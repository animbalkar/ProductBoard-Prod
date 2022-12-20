global class SubscriptionOps {
	// add subscription
	webService static String addSubscription(Subscription_DTO_Req info) {
		IntegrationLog__c il = Utils.createIntegrationLog('SubscriptionOps', 'addSubscription', JSON.serialize(info));
		ApiResponseDTO response = new ApiResponseDTO();
		Datetime now = Datetime.now();
		System.Savepoint sp = Database.setSavepoint();

		try {
			info.userEmail = info.userEmail.toLowerCase();

			Project__c existingProject = Project_DAO.getProjectByPBIdWithExc(info.projectId);
			il.Description__c += '\n- Project found. id: ' + existingProject.Id;

			Contact subContact = Contact_DAO.getMasterContactByProject(existingProject);
			il.Description__c += '\n- Contact found. id: ' + subContact.Id;

			List<Opportunity> existingOpportunities = [
				SELECT Id, Name, Amount, StageName, Pricebook2Id
				FROM Opportunity
				WHERE Project__c = :existingProject.Id AND StageName NOT IN ('Closed Won')
				ORDER BY type
			]; //emtpy, new business, expansion, renewal
			il.Description__c += '\n- Opportunities found. count: ' + existingOpportunities.size();

			if (info.planVersion == null)
				info.planVersion = 'Custom Plans';
			Product2 planProduct = [
				SELECT Id, Name, Family
				FROM Product2
				WHERE Name = :info.plan AND Family = :info.planVersion AND IsActive = TRUE
				LIMIT 1
			];
			il.Description__c += '\n- PlanProduct found. id: ' + planProduct.Id;
			existingProject.Product_Name__c = planProduct.Id;

			Pricebook2 planPricebook = [SELECT Id, Name FROM Pricebook2 WHERE Name = :info.frequency LIMIT 1];
			il.Description__c += '\n- PlanPricebook found. id: ' + planPricebook.Id;
			existingProject.Price_Book__c = planPricebook.Id;

			Account updatedAccount = updateAccountAndContact(subContact, info.biVATNumber);
			existingProject.Account_Name__c = updatedAccount.Id;

			SubscriptionOps_SERV.setHasSubscriptionOnUsers(existingProject, true);

			// test if opportunity exists
			Opportunity subOpportunity = SubscriptionOps_SERV.setSubscriptionOpp(
				existingOpportunities,
				existingProject.Id,
				updatedAccount.Id,
				subContact.Name,
				planPricebook.Id,
				info.stripeInvoiceId,
				il
			);

			PricebookEntry pricebookEntry = [
				SELECT Id, ProductCode, Product2Id, UnitPrice
				FROM PricebookEntry
				WHERE Product2Id = :planProduct.Id AND Pricebook2Id = :subOpportunity.Pricebook2Id
			];
			il.Description__c += '\n- PricebookEntry found. id: ' + pricebookEntry.Id;

			OpportunityLineItem lineItem = new OpportunityLineItem();
			SubscriptionOps_SERV.setValuesForOppLineItem(
				lineItem,
				info,
				pricebookEntry,
				subOpportunity.Id,
				planProduct.Id,
				planPricebook.Name,
				now
			);
			insert lineItem;
			il.Description__c += '\n- LineItem inserted. id: ' + lineItem.Id;

			update subOpportunity;
			il.Description__c += '\n- Opportunity Closed. id: ' + subOpportunity.Id;

			SubscriptionOps_SERV.setValuesForProject(existingProject, info, planPricebook.Id, planProduct.Id, now);
			update existingProject;

			ApiResponseDTO.createResponse(response, ApiConstants.CODE_SUCCESS, ApiConstants.MSG_SUCCESS_NEW_SUBSCRIPTION, null, null, null);
		} catch (ProductboardException e) {
			ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null);
			Database.rollback(sp);
		} catch (Exception e) {
			il.Description__c += '\nFAILED - StackTrace: ' + e.getStackTraceString();
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_FAILED_GENERAL,
				ApiConstants.MSG_FAILED_GENERAL,
				il,
				e.getMessage(),
				null
			);
			Database.rollback(sp);
		} finally {
			Utils.updateIntegrationLog(il, response);
			ApiRequestController.logApiRequest(
				JSON.serialize(info),
				'Subscription_DTO_Req',
				il.Success__c,
				il.Method__c,
				il.Description__c,
				response
			);
		}
		return JSON.serialize(response);
	}

	//*****************************************************************************************************************************************************************
	// If contact exists then return, if not then convert lead and check contact and account existence after
	//*****************************************************************************************************************************************************************

	public static Contact convertOrReturnContactToLead(Lead masterUserLead, Project__c project, String company) {
		List<Contact> existingContacts = [
			SELECT Id, Name, Email, AccountId, LeadSource
			FROM Contact
			WHERE User_PB_ID__c = :masterUserLead.User_PB_ID__c
			LIMIT 1
		];
		if (existingContacts.isEmpty()) {
			existingContacts = [
				SELECT Id, Name, Email, AccountId, LeadSource
				FROM Contact
				WHERE User_PB_ID__c = NULL AND Email = :masterUserLead.Email
				LIMIT 1
			];
			if (!existingContacts.isEmpty()) {
				existingContacts[0].User_PB_ID__c = masterUserLead.User_PB_ID__c;
				update existingContacts[0];
			}
		}
		List<Account> existingAccounts = SubscriptionOps_SERV.findAccountBasedOnCriteria(masterUserLead.Company);

		Id accountIdForConversion;
		Database.LeadConvert ld = new Database.LeadConvert();
		ld.setLeadId(masterUserLead.Id);
		ld.setConvertedStatus([SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted = TRUE LIMIT 1].MasterLabel);
		ld.setDoNotCreateOpportunity(true);

		if (existingContacts.isEmpty()) {
			if (existingAccounts.isEmpty()) {
				if (
					masterUserLead.Company == null ||
					masterUserLead.Company.equals('Not provided') ||
					masterUserLead.Company.equals('[not provided]')
				) {
					accountIdForConversion = [SELECT Id, Name FROM Account WHERE Name = 'Customers_system_account' LIMIT 1].Id;
				} else {
					accountIdForConversion = createAccountWithCompanyName(masterUserLead.Company, company).Id;
				}
			} else {
				accountIdForConversion = existingAccounts[0].Id;
			}
		} else {
			ld.setContactId(existingContacts[0].Id);
			accountIdForConversion = existingContacts[0].AccountId;
		}

		ld.setAccountId(accountIdForConversion);
		Database.LeadConvertResult Leadconverts = Database.convertLead(ld);

		return Contact_DAO.getContactbyId2(Leadconverts.getContactId())[0];
	}

	public static Account createAccountWithCompanyName(String companyName, String companyNameUserInput) {
		Account acc = new Account();
		acc.Name = companyName;
		if (companyNameUserInput == null) {
			acc.Company_Name_User_Input__c = 'Not provided by user';
		} else {
			acc.Company_Name_User_Input__c = '"' + companyNameUserInput + '"';
		}

		insert acc;
		return acc;
	}

	//*****************************************************************************************************************************************************************
	//GET UPDATE ACCOUNT
	//*****************************************************************************************************************************************************************

	public static Account updateAccountAndContact(Contact subContact, String biVATNumber) {
		Account returnAccount;
		List<Account> existingAccounts = new List<Account>();

		if (biVATNumber != null) {
			existingAccounts = [
				SELECT Id, Name, Country__c, Street__c, Street_Number__c, City__c
				FROM Account
				WHERE Name LIKE :biVATNumber
				LIMIT 1
			];
		}

		if (existingAccounts.isEmpty()) {
			returnAccount = [
				SELECT Id, Name, Country__c, Street__c, Street_Number__c, City__c
				FROM Account
				WHERE Id = :subContact.AccountId
				LIMIT 1
			];
		} else {
			returnAccount = existingAccounts[0];
			if (!(returnAccount.Id.equals(subContact.AccountId))) {
				EmailNotification_SERV.sendEmail();
				subContact.AccountId = returnAccount.Id;
				update subContact;
			}
		}
		return returnAccount;
	}

	/*****************************************************************************************************************************************************************   
	 
	 *****************************************************************************************************************************************************************
	 *****************************************************************************************************************************************************************
	  CANCEL SUBSCRIPTION    
	 ***************************************************************************************************************************************************************** 
	 *****************************************************************************************************************************************************************
	 *****************************************************************************************************************************************************************/
	// cancel subscription
	webService static String cancelSubscription(Subscription_DTO_Req cancelInfo) {
		IntegrationLog__c il = Utils.createIntegrationLog('SubscriptionOps', 'cancelSubscription', JSON.serialize(cancelInfo));
		Datetime now = Datetime.now();
		ApiResponseDTO response = new ApiResponseDTO();
		System.Savepoint sp = Database.setSavepoint();

		try {
			SubscriptionCalc_DTO_Info calcDto = new SubscriptionCalc_DTO_Info(cancelInfo, 'Cancel', now);
			SubscriptionOps_SERV.updateObjectsBasedOnDTO(calcDto);
			il.Description__c += '\n- Project marked.';
			SubscriptionOps_SERV.setHasSubscriptionOnUsers(calcDto.allProjectUsers, false);
			il.Description__c += '\n- ProjectUsers marked.';
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_SUCCESS,
				ApiConstants.MSG_SUCCESS_SUBSCRIPTION_CANCELATION,
				null,
				null,
				null
			);
		} catch (ProductboardException e) {
			ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null);
			Database.rollback(sp);
		} catch (Exception e) {
			il.Description__c += '\nFAILED - StackTrace: ' + e.getStackTraceString();
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_FAILED_GENERAL,
				ApiConstants.MSG_FAILED_GENERAL,
				il,
				e.getMessage(),
				null
			);
			Database.rollback(sp);
		} finally {
			Utils.updateIntegrationLog(il, response);
			ApiRequestController.logApiRequest(
				JSON.serialize(cancelInfo),
				'Subscription_DTO_Req',
				il.Success__c,
				il.Method__c,
				il.Description__c,
				response
			);
		}

		return JSON.serialize(response);
	}

	/*****************************************************************************************************************************************************************   
	 *****************************************************************************************************************************************************************
	 *****************************************************************************************************************************************************************
	  CHANGE SUBSCRIPTION    
	 ***************************************************************************************************************************************************************** 
	 *****************************************************************************************************************************************************************
	 *****************************************************************************************************************************************************************/
	webService static String changePlan(Subscription_DTO_Req changeInfo) {
		//only billing frequency change or change frequency with change product plan
		IntegrationLog__c il = Utils.createIntegrationLog('SubscriptionOps', 'changePlan', JSON.serialize(changeInfo));
		Datetime now = Datetime.now();
		ApiResponseDTO response = new ApiResponseDTO();
		System.Savepoint sp = Database.setSavepoint();

		try {
			SubscriptionCalc_DTO_Info startDto = new SubscriptionCalc_DTO_Info(changeInfo.projectId);
			if (changeInfo.plan != null && (changeInfo.plan == 'Trial' || changeInfo.plan == 'Starter')) {
				Project__c project = Project_DAO.getProjectByPBIdWithExc(changeInfo.projectId); // would rename to sth like getProjectByPBIdWithExc
				if (changeInfo.plan == 'Trial') {
					Opportunity newOpp = TrialOps_SERV.createTrialOpportunity(project, now);
					insert newOpp;
					il.Description__c += '\n- New Opportunity created. id: ' + newOpp.Id;
					TrialOps_SERV.updateProjectToTrial(project, newOpp.Id, now);
					il.Description__c += '\n- Project plan upgraded to Trial. id: ' + changeInfo.projectId;
				}
				if (changeInfo.plan == 'Starter'){
					TrialOps_SERV.updateProjectToStarter(project);
					il.Description__c += '\n- Project plan downgraded to Starter. id: ' + changeInfo.projectId;
				}
			} else if ((changeInfo.frequency != startDto.calcAsset.Period__c) && (changeInfo.plan == null)) {
				//only change period
				SubscriptionCalc_DTO_Info calcDto = new SubscriptionCalc_DTO_Info(changeInfo, 'ChangePeriod', now);
				SubscriptionOps_SERV.updateObjectsBasedOnDTO(calcDto);
				il.Description__c += '\n- Project period changed. id: ' + calcDto.calcProject.Id;
			} else if ((changeInfo.frequency != startDto.calcAsset.Period__c) && (changeInfo.plan != null)) {
				//only change period
				SubscriptionCalc_DTO_Info calcDto = new SubscriptionCalc_DTO_Info(changeInfo, 'ChangePeriod_DowngradeUpgrade', now);
				SubscriptionOps_SERV.updateObjectsBasedOnDTO(calcDto);
				il.Description__c += '\n- Project period and plan changed. id: ' + calcDto.calcProject.Id;
			} else if ((changeInfo.frequency == startDto.calcAsset.Period__c) && (changeInfo.plan != null)) {
				//only change product plan
				SubscriptionCalc_DTO_Info calcDto = new SubscriptionCalc_DTO_Info(changeInfo, 'DowngradeUpgrade', now);
				SubscriptionOps_SERV.updateObjectsBasedOnDTO(calcDto);
				il.Description__c += '\n- Project plan changed. id: ' + calcDto.calcProject.Id;
			}
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_SUCCESS,
				ApiConstants.MSG_SUCCESS_SUBSCRIPTION_CHANGE,
				null,
				null,
				null
			);
		} catch (ProductboardException e) {
			ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null);
			Database.rollback(sp);
		} catch (Exception e) {
			il.Description__c += '\nFAILED - StackTrace: ' + e.getStackTraceString();
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_FAILED_GENERAL,
				ApiConstants.MSG_FAILED_GENERAL,
				il,
				e.getMessage(),
				null
			);
			Database.rollback(sp);
		} finally {
			Utils.updateIntegrationLog(il, response);
			ApiRequestController.logApiRequest(
				JSON.serialize(changeInfo),
				'Subscription_DTO_Req',
				il.Success__c,
				il.Method__c,
				il.Description__c,
				response
			);
		}

		return JSON.serialize(response);
	}
}