public class SubscriptionOps_SERV {

	public static void setHasSubscriptionOnUsers(Project__c pr, Boolean newHasSubscriptionValue) {
		List<Id> conIds = new List<Id> ();
		for (Project_User__c pu : ProjectUser_DAO.getProjectUsersByProjectId2(pr.Id)) {
			conIds.add(pu.Contact__c);
		}
		List<Contact> cons = Contact_DAO.getContactbyListOfIds(conIds);
		for (Contact c : cons) {
			c.hasSubscription__c = newHasSubscriptionValue;
			c.isTrial__c = newHasSubscriptionValue;
		}
		update cons;
	}

	public static void setHasSubscriptionOnUsers(List<Project_User__c> pus, Boolean newHasSubscriptionValue) {
		List<Id> conIds = new List<Id> ();

		for (Project_User__c pu : pus) {
			conIds.add(pu.Contact__c);
		}
		List<Contact> cons = Contact_DAO.getContactbyListOfIds(conIds);
		for (Contact c : cons) {
			c.hasSubscription__c = newHasSubscriptionValue;
			c.isTrial__c = newHasSubscriptionValue;
		}
		update cons;
	}

	//*****************************************************************************************************************************************************************
	//DISCOUNTED TOTAL PRICCE 
	//*****************************************************************************************************************************************************************     

	// counts total price on line item (with discount), fills discount fields on opp line item    
	public static OpportunityLineItem countDiscountedTotalPrice(OpportunityLineItem lineItem,
	                                                            Decimal discountValue, String discountType, String subtype, Integer discountLength, Datetime now/* MT_pricebookChange 19-09-03: , Integer periodCon*/)
	{
		Double remainingCredit;
		Double discountedTotalPrice = lineItem.Price_Without_Discount__c;
		Double priceWithoutDiscount = lineItem.Price_Without_Discount__c;
		Double amountOfUsers = lineItem.Quantity;
		lineItem.Discount_Fixed_Rest_Below_Zero__c = 0;
		if (discountType != null /* MM ZERO NUMBER OF USERS || lineItem.Quantity != 0*/) {

			lineItem.Discount_Subtype__c = subtype;

			// credit type
			if (discountType.equals('credit')) {
				lineItem.Discount_Credit__c = discountValue;
				lineItem.Discount_Type__c = discountType;
				// remainingCredit = priceWithoutDiscount - discountValue; // záporný, 0, nebo kladný
				if (discountValue > priceWithoutDiscount) {
					discountedTotalPrice = 0;
					remainingCredit = discountValue - priceWithoutDiscount;
				} else {
					discountedTotalPrice = priceWithoutDiscount - discountValue;
					remainingCredit = 0;
				}

			}
			// fix type
			if (discountType.equals('amount_off')) {
				lineItem.Discount_Fixed__c = discountValue;
				lineItem.Remaining_Credit__c = 0;
				lineItem.Discount_Type__c = discountType;


				Datetime discountEndDate = now.addMonths(discountLength);
				lineItem.Discount_Length_ms__c = discountEndDate.getTime() - now.getTime();
				//MitchiWork.MitchiEditInSubscriptionOpsIncountDiscountedTotalPriceFix

				if (subtype.equals('forever') && discountLength == 0) {
					discountedTotalPrice = (lineItem.List_Price_TMP__c * lineItem.Quantity /* MT_pricebookChange 19-09-03: * periodCon*/) - discountValue;
					if (discountedTotalPrice< 0) {
						lineItem.Discount_Fixed_Rest_Below_Zero__c = Math.abs(discountedTotalPrice);
						discountedTotalPrice = 0;
					}
				}

				if (subtype.equals('multi-month')) {
					discountEndDate = now.addMonths(discountLength);
					lineItem.Discount_Length_ms__c = discountEndDate.getTime() - now.getTime();

					discountedTotalPrice = (lineItem.List_Price_TMP__c * lineItem.Quantity /* MT_pricebookChange 19-09-03: * periodCon*/) - discountValue;
					if (discountedTotalPrice< 0) {
						lineItem.Discount_Fixed_Rest_Below_Zero__c = Math.abs(discountedTotalPrice);
						discountedTotalPrice = 0;
					}
				}

				// END FIX
			}

			// percent type
			if (discountType.equals('percent_off')) {
				lineItem.Discount_Percent__c = discountValue;
				lineItem.Discount_Type__c = discountType;


				Datetime discountEndDate = now.addMonths(discountLength);
				lineItem.Discount_Length_ms__c = discountEndDate.getTime() - now.getTime();
				//MitchiWork.MitchiEditInSubscriptionOpsIncountDiscountedTotalPricePercent

				if (subtype.equals('forever') && discountLength == 0) {
					discountedTotalPrice = (lineItem.List_Price_TMP__c * (1 - (discountValue * 0.01))) * lineItem.Quantity;
				}

				if (subtype.equals('multi-month')) {
					discountEndDate = now.addMonths(discountLength);
					lineItem.Discount_Length_ms__c = discountEndDate.getTime() - now.getTime();

					discountedTotalPrice = (lineItem.List_Price_TMP__c * (1 - (discountValue * 0.01))) * lineItem.Quantity;
				}

			}


		}

		lineItem.TotalPrice = discountedTotalPrice;
		lineItem.Remaining_Credit__c = remainingCredit;
		return lineItem;
	}


	//*****************************************************************************************************************************************************************
	// Find Accounts based on criteria     
	//*****************************************************************************************************************************************************************  
	public static List<Account> findAccountBasedOnCriteria(String companyName) {
		List<Account> existingAccounts = [Select Id, Name, Country__c, Street__c, Street_Number__c, City__c
		                                  from Account
		                                  where Name LIKE :companyName LIMIT 1];
		return existingAccounts;

	}

	//*****************************************************************************************************************************************************************
	// SubscriptionCalc_DTO_Info to Asset Object, Project__c Object
	//*****************************************************************************************************************************************************************

	public static void updateObjectsBasedOnDTO(SubscriptionCalc_DTO_Info calcDto) {
		Project__c updatedProject = calcDto.calcProject;
		Product2 updatedProduct2 = calcDto.calcProduct;
        Pricebook2 updatedPricebook2 = calcDto.calcPriceBook;
		//Asset Object
		if (calcDto.action.equals('DowngradeUpgrade')) {

            updatedProject.Product_Name__c = updatedProduct2.Id;
            updatedProject.Price_Book__c = updatedPricebook2.id;

		} else if (calcDto.action.equals('ChangePeriod') || calcDto.action.equals('ChangePeriod_DowngradeUpgrade')) {
            updatedProject.Product_Name__c = updatedProduct2.Id;
            updatedProject.Subscription_Start_Date__c = calcDto.now;
            if (calcDto.newPeriodType.equals('monthly')) {
                updatedProject.Subscription_End_Date__c = calcDto.now.addMonths(1);
            } else if (calcDto.newPeriodType.equals('yearly')) {
                updatedProject.Subscription_End_Date__c = calcDto.now.addYears(1);
            }
            updatedProject.Price_Book__c = updatedPricebook2.id;

		} else if (calcDto.action.equals('Cancel')) {
			// project cancellation
			updatedProject.Cancelled__c = true;
			updatedProject.Active__c = false;
			updatedProject.End_Date__c = calcDto.now;
            updatedProject.Subscription_End_Date__c = calcDto.now;
			for (Project_User__c projectUser : calcDto.allProjectUsers) {
				ProjectUser_SERV.setValueForProjectUser(projectUser, null, null, null, null, null, calcDto.now, 'Cancelled', false);
			}
			ProjectUser_DAO.updateProjectUserList(calcDto.allProjectUsers);
			updatedProject.Product_Name__c = null;
            updatedProject.Price_Book__c = null;

		}
		Project_DAO.updateProject(updatedProject);


	}

	//*****************************************************************************************************************************************************************
	// handle subs opportunity
	//*****************************************************************************************************************************************************************


	public static Opportunity setSubscriptionOpp(List<Opportunity> oppList, Id projectId, Id accId, String conName, Id planPricebookId, String stripeInvoiceId, IntegrationLog__c il){
		Opportunity opp = new Opportunity();
		if (oppList.isEmpty()) {
			//new opportunity and opportunity line item
			opp.project__c = projectId;
			opp.Name = conName + ', ' + Datetime.now();
			opp.CloseDate = Date.today();
			opp.RecordTypeId = OpportunityRecordTypes.self_service;
			opp.StageName = 'Free Trial';
			opp.Pricebook2Id = planPricebookId;
			opp.AccountId = accId;
			opp.Stripe_Invoice_ID__c = stripeInvoiceId;
			insert opp;
			il.Description__c += '\n- Opportunity inserted. id: ' + opp.Id;
		} else {
			opp = oppList[0];

			List<OpportunityLineItem> oldLineItems = OpportunityLineItem_DAO.getAllOppLineItemsByOppId(opp.Id);
			delete oldLineItems;
			il.Description__c += '\n- LineItems deleted. count: ' + oldLineItems.size();

			opp.project__c = projectId;
			opp.Pricebook2Id = planPricebookId;
			opp.AccountId = accId;
			opp.Stripe_Invoice_ID__c = stripeInvoiceId;   
			update opp;
			il.Description__c += '\n- Opportunity updated. id: ' + opp.Id;
		}

		opp.Subtype__c = 'System';
		opp.StageName = 'Closed Won';
		return opp;
	}

	public static void setValuesForOppLineItem(OpportunityLineItem li, Subscription_DTO_Req info, PricebookEntry pbe, Id oppId, Id productId, String pricebookName, Datetime now){
		Decimal discountValue;
		if (info.discountValue == null) {
			discountValue = 0;
		} else {
			discountValue = Decimal.valueOf(info.discountValue);
		}

		Integer discountLength;
		if (info.discountLength == null) {
			discountLength = 0;
		} else {
			discountLength = Integer.valueOf(info.discountLength);
		}

		li.PricebookEntryId = pbe.Id;
		li.OpportunityId = oppId;
		li.Product2Id = productId;
		li.Quantity = info.amountOfUsers;
		li.Period__c = pricebookName;
		li.List_Price_TMP__c = pbe.UnitPrice;
		li.Price_Without_Discount__c = info.amountOfUsers * pbe.UnitPrice;
		li = SubscriptionOps_SERV.countDiscountedTotalPrice(li, discountValue, info.discountType, info.discountSubtype, discountLength, now);
	}

	public static void setValuesForProject(Project__c project, Subscription_DTO_Req info, Id pricebookId, Id productId, Datetime now){
		project.CC_Address__c = info.ccAddress;
		project.CC_City__c = info.ccCity;
		project.CC_Country__c = info.ccCountry;
		project.CC_Postal_Code__c = info.ccPostalCode;
		project.CC_State__c = info.ccState;
		project.CC_Billing_Email__c = info.ccBillingEmail;

		if (info.billingInfoFlag) {
			project.BI_Company_Name__c = info.biCompanyName;
			project.BI_Address__c = info.biAddress;
			project.BI_City__c = info.biCity;
			project.BI_Postal_Code__c = info.biPostalCode;
			project.BI_State__c = info.biState;
			project.BI_Country__c = info.biCountry;
			project.BI_VAT_Number__c = info.biVATNumber;
			project.BI_Additional_Info__c = info.biAdditionalInfo;
		}

		project.Price_Book__c = pricebookId;
		project.Product_Name__c = productId;
		project.Subscription_Start_Date__c = now;
		if (info.frequency.equals('monthly')) {
			project.Subscription_End_Date__c = now.addMonths(1);
		} else if(info.frequency.equals('yearly')){
			project.Subscription_End_Date__c = now.addYears(1);
		} 
	}
}