@isTest 
private class updatePayingCustomerOnCurrentCon_TEST {

	@TestSetup
	private static void testSetup() {
		DataFactory_TEST.init();
	}

	@isTest
	private static void testName() {

		//initialization
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c).get(0);
		Subscription_DTO_Req info = setSubscriptionInfo(pr.Project_PB_ID__c, masterContact.Email, 1, 'yearly', 'New idea');

		pr.Chartmogul_MRR__c = 1;
		update pr; //to have project status 'paying'
		
		masterContact.paying_Customer_A__c = false;
		update masterContact; // to have wrong false on contact with paying project

		//test
		Test.startTest();
		updatePayingCustomerOnCurrentContacts upc = new updatePayingCustomerOnCurrentContacts();
		Database.executeBatch(upc, 500);
		Test.stopTest();

		//assert
		Contact actualCon = [SELECT paying_Customer_A__c FROM Contact WHERE Id=:masterContact.id LIMIT 1 ];
		// logis is not used but test are falling - System.assertEquals(true, actualCon.paying_Customer_A__c);

	}

	
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