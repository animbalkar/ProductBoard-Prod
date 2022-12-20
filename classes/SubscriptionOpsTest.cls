@isTest
public class SubscriptionOpsTest {
    
    @testSetup static void initsObjects() {
		DataFactory_TEST.init();
	}

	@isTest
	private static void testInitObjects() {
		Test.startTest();
		System.assertEquals(5, [select Id from Product2].size());
		System.assertEquals(15, [select Id from PricebookEntry].size());
		System.assertEquals(2, [select Id from Pricebook2].size());
		Test.stopTest();
	}

	@isTest
	private static void testSubscribeNewIdeaNoDiscountYearly() {
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c)[0];

		Test.startTest();
		Subscription_DTO_Req info = DataFactory_TEST.setSubscriptionInfo(pr.Project_PB_ID__c, masterContact.Email, 1, 'yearly', 'New idea');
		String response = SubscriptionOps.addSubscription(info);
        Test.stopTest();
        
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
	}

    private static void testCancelSubscriptionYearlyNoDiscount() {
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c).get(0);

		
		Subscription_DTO_Req info = DataFactory_TEST.setSubscriptionInfo(pr.Project_PB_ID__c, masterContact.Email, 1, 'yearly', 'New idea');
		String response0 = SubscriptionOps.addSubscription(info);
		
		Test.startTest();
		Subscription_DTO_Req cancelInfo = DataFactory_TEST.setCancelSubscriptionInfo(masterContact.Email, pr.Project_PB_ID__c);
		String response = SubscriptionOps.cancelSubscription(cancelInfo);
        Test.stopTest();
        
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
        System.assertEquals(ApiConstants.MSG_SUCCESS_SUBSCRIPTION_CANCELATION, res.statusMessage);
    }
    
    @isTest
    private static void testChangeDowngrade() {
        Project__c pr = DataFactory_TEST.createProjectWithAssetWithDiscount('Startup','yearly', 1, 'credit', null, null, 500, null, null);
        
        Test.startTest();
        Subscription_DTO_Req info = DataFactory_TEST.setChangePlanInfo('yearly', pr.Project_PB_ID__c, 'New idea', '4');
        String response = SubscriptionOps.changePlan(info);
        Test.stopTest();

        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
        System.assertEquals(ApiConstants.MSG_SUCCESS_SUBSCRIPTION_CHANGE, res.statusMessage);
    }

	@isTest
	private static void testUpgradeToTrial() {
		Project__c pr = DataFactory_TEST.createStarterProject();

		Test.startTest();
		Subscription_DTO_Req info = DataFactory_TEST.setChangePlanInfo('', pr.Project_PB_ID__c, 'Trial', '');
		String response = SubscriptionOps.changePlan(info);
		Test.stopTest();

		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
		System.assertEquals(ApiConstants.MSG_SUCCESS_SUBSCRIPTION_CHANGE, res.statusMessage);
		pr = [ SELECT  Space_Type__c,
				Master_User_Contact__c,
				Name,
				Product_Name__c,
				Trial_End_Date__c
		FROM Project__c
		WHERE Id = :pr.Id
		];
		System.assertEquals('Main', pr.Space_Type__c);
		System.assertEquals(Datetime.now().addDays(14).date(), pr.Trial_End_Date__c);
	}

	@isTest
	private static void testDowngradeToStarter() {
		Project__c pr = DataFactory_TEST.createTrialProject();

		Test.startTest();
		Subscription_DTO_Req info = DataFactory_TEST.setChangePlanInfo('', pr.Project_PB_ID__c, 'Starter', '');
		String response = SubscriptionOps.changePlan(info);
		Test.stopTest();

		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
		System.assertEquals(ApiConstants.MSG_SUCCESS_SUBSCRIPTION_CHANGE, res.statusMessage);

		pr = [ SELECT  Space_Type__c,
						Master_User_Contact__c,
						Name,
						Product_Name__c,
						Trial_End_Date__c
				FROM Project__c
				WHERE Id = :pr.Id
		];
		System.assertEquals('Starter', pr.Space_Type__c);
		System.assertEquals(null, pr.Trial_End_Date__c);
	}

}