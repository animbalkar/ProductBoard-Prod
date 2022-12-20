@isTest 
private class UpdatePayingCustomerOnContact_TEST {

	@TestSetup
	private static void testSetup() {
		DataFactory_TEST.init();
	}

	@isTest
	private static void testUpdateWithBatch() {

		//initialization
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c).get(0);
		Subscription_DTO_Req info = setSubscriptionInfo(pr.Project_PB_ID__c, masterContact.Email, 1, 'yearly', 'New idea');

		pr.Current_Backend_Stage__c = 'Active Subscription';
		update pr; //to have paying project
		
		masterContact.paying_Customer_A__c = false;
		update masterContact; // to have wrong false on contact with paying project

		//test
		Test.startTest();
		updatePayingCustomerOnContact_BATCH batchPhase1 = new updatePayingCustomerOnContact_BATCH('phase1');
		Database.executeBatch(batchPhase1, 300);

		updatePayingCustomerOnContact_BATCH batchPhase2 = new updatePayingCustomerOnContact_BATCH('phase2');
		Database.executeBatch(batchPhase2, 300);
		Test.stopTest();

		//assert
		Contact actualCon = [SELECT paying_Customer_A__c FROM Contact WHERE Id=:masterContact.id LIMIT 1 ];
		System.assertEquals(true, actualCon.paying_Customer_A__c);

	}
	
/*	@IsTest
	private static void testUpdateByTrigger() {
		//initialization
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c).get(0);
		Subscription_DTO_Req info = setSubscriptionInfo(pr.Project_PB_ID__c, masterContact.Email, 1, 'yearly', 'New idea');

		//in order to test trigger on project
		Account systemAccount = [Select id from account where name = :GeneralConfig_TEST.SYSTEM_ACCOUNT_NAME];
		List<Project__c> emptyProjects = new List<Project__c>();
		for (Integer i = 0; i < 20; i++){
			Project__c p = new project__c();
			p.name = 'emptyProject'+i;
			p.Project_PB_ID__c= '' + 100000 + i;
			p.Account_Name__c = systemAccount.id;
			emptyProjects.add(p);
		}
		insert emptyProjects;
		List<Project__c> projetsToUpdate = [SELECT Name,Current_Backend_Stage__c from Project__c];
		for (project__c p : projetsToUpdate){
				p.name = p.name + 'new';
		}

		//test
		Test.startTest();
		update projetsToUpdate;
		Test.stopTest();

		//assert
		Contact actualCon = [SELECT paying_Customer_A__c FROM Contact WHERE Id=:masterContact.id LIMIT 1 ];
		System.assertEquals(false, actualCon.paying_Customer_A__c);

	}

	*/
	public static Subscription_DTO_Req setSubscriptionInfo(String projectPbId, String em, Integer users, String frequency, String plan) {
		Subscription_DTO_Req info = new Subscription_DTO_Req();
		info.projectId = projectPbId;
		info.useremail = em.toLowerCase();
		info.amountOfUsers = users;
		info.frequency = frequency;
		info.plan = plan;
		info.planVersion = '4';
		//CC INFO
		info.billingInfoFlag = false;
		info.ccAddress = 'Test Street 000';
		info.ccCity = 'Test City';
		info.ccPostalCode = '00000';
		info.ccState = 'Test State';
		info.ccCountry = 'Test Country';
		info.ccBillingEmail = em;
		return info;
	}
}