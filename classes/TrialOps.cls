global class TrialOps {
	global class LeadInfo {
		webService String spaceType;
		webService String fullName;
		webService Date trialEndDate;
		webService Datetime activationDate;
		webService String company;
		webService String phone;
		webService String userEmail;
		webService String userId;
		webService String projectId;
		webService String teamUrl;
		webService String userEmail1;
		webService String userId1;
		webService String userEmail2;
		webService String userId2;
		webService String userEmail3;
		webService String userId3;
		/* Emailove adresy uzivatelov ktorych zaktivnit*/
		webService List<String> userEmailsToActivate;
	}

	webService static String activateStarterLead(LeadInfo info) {
		IntegrationLog__c il = Utils.createIntegrationLog('TrialOps', 'activateStarterLead', JSON.serialize(info));
		ApiResponse response = new ApiResponse();
		System.Savepoint sp = Database.setSavepoint();

		try {
			String leadId = Lead_SERV.activateStarterLead(info.userId);

			response.success(ApiConstants.MSG_SUCCESS_LEAD_UPDATE);
			response.addResponseData('leadSfId', leadId);
		} catch (ProductboardException e) {
			response.error(e);
			response.addLog(il);
			Database.rollback(sp);
		} catch (Exception e) {
			il.Description__c += '\nFAILED - StackTrace: ' + e.getStackTraceString();
			response.error(e);
			response.addLog(il);
			Database.rollback(sp);
		} finally {
			Utils.updateIntegrationLog(il, response);
			ApiRequestController.logApiRequest(
				JSON.serialize(info),
				'LeadInfo',
				il.Success__c,
				il.Method__c,
				il.Description__c,
				response
			);
		}
		return response.getResponseInString();
	}

	webService static String createTrialLead(LeadInfo info) {
		IntegrationLog__c il = Utils.createIntegrationLog('TrialOps', 'createTrialLead', JSON.serialize(info));
		Datetime now = Datetime.now();
		ApiResponseDTO response = new ApiResponseDTO();
		System.Savepoint sp = Database.setSavepoint();

		try {
			Lead_SERV.createOrUpdateTrialRequest(info, now, il);
			ApiResponseDTO.createResponse(response, ApiConstants.CODE_SUCCESS, ApiConstants.MSG_SUCCESS_LEAD_CREATION, null, null, null);
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
			ApiRequestController.logApiRequest(JSON.serialize(info), 'LeadInfo', il.Success__c, il.Method__c, il.Description__c, response);
		}

		return JSON.serialize(response);
	}

	webService static String createNewProject(LeadInfo projectInfo) {
		IntegrationLog__c il = Utils.createIntegrationLog('TrialOps', 'createNewProject', JSON.serialize(projectInfo));
		Datetime now = Datetime.now();
		ApiResponse response = new ApiResponse();
		System.Savepoint sp = Database.setSavepoint();

		try {
			Lead masterLead = Lead_SERV.createOrUpdateTrialOwner(projectInfo, now, il);
			il.Description__c += '\n- MasterLead. id: ' + masterLead.Id;

			Contact masterConvertedContact = SubscriptionOps.convertOrReturnContactToLead(masterLead, null, projectInfo.company);
			il.Description__c += '\n- masterConvertedContact. id: ' + masterConvertedContact.Id;

			TrialOps_SERV.setProjectFields(masterLead, masterConvertedContact);
			update masterConvertedContact;
			il.Description__c += '\n- Project fields on Contact set.';

			Project__c newProject = new Project__c();
			TrialOps_SERV.setValuesForTrialProject(newProject, projectInfo, masterConvertedContact, now);
			insert newProject;
			il.Description__c += '\n- New Project created. id: ' + newProject.Id;

			Opportunity newOpp = new Opportunity();
			if (projectInfo.spaceType != 'standalone_portal' && projectInfo.spaceType != 'starter') {
				TrialOps_SERV.setValuesForOpportunity(newOpp, projectInfo, masterConvertedContact, newProject.id, now);
				insert newOpp;
				il.Description__c += '\n- New Opportunity created. id: ' + newOpp.Id;

				newProject.Opportunity__c = newOpp.Id;
				update newProject;
			}

			// create project users
			Map<Double, String> usersMap = new Map<Double, String>();
			if (projectInfo.userEmail1 != null && projectInfo.userId1 != null && projectInfo.userId1 != '') {
				usersMap.put(Double.valueOf(projectInfo.userId1), projectInfo.userEmail1.toLowerCase());
			}
			if (projectInfo.userEmail2 != null && projectInfo.userId2 != null && projectInfo.userId2 != '') {
				usersMap.put(Double.valueOf(projectInfo.userId2), projectInfo.userEmail2.toLowerCase());
			}
			if (projectInfo.userEmail3 != null && projectInfo.userId3 != null && projectInfo.userId3 != '') {
				usersMap.put(Double.valueOf(projectInfo.userId3), projectInfo.userEmail3.toLowerCase());
			}
			TrialOps_SERV.addProjectUsersAndConvertLeads(
				projectInfo.spaceType,
				masterConvertedContact,
				newOpp,
				projectInfo.userEmail.toLowerCase(),
				usersMap,
				newProject,
				now,
				il
			);

			response.success(ApiConstants.MSG_SUCCESS_NEW_PROJECT_CREATION);
			response.addResponseData('accountSfId', newProject.Account_Name__c);
		} catch (ProductboardException e) {
			response.error(e);
			response.addLog(il);
			// ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null );
			Database.rollback(sp);
		} catch (Exception e) {
			il.Description__c += '\nFAILED - StackTrace: ' + e.getStackTraceString();
			response.error(e);
			response.addLog(il);
			Database.rollback(sp);
		} finally {
			Utils.updateIntegrationLog(il, response);
			ApiRequestController.logApiRequest(
				JSON.serialize(projectInfo),
				'LeadInfo',
				il.Success__c,
				il.Method__c,
				il.Description__c,
				response
			);
		}

		return response.getResponseInString();
	}

	public static boolean contains(List<SObject> listOfSomething, SObject something) {
		for (SObject obj : listOfSomething) {
			if (obj == something)
				return true;
		}
		return false;
	}
}