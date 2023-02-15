@isTest 
private class AccountToConOppUpdateTriggerTest {

    @TestSetup
    private static void init(){
        DataFactory_TEST.init();
    }

	@isTest
	private static void testContacts() {
		Account a = new Account();
		a.Name = 'testAcc';
        insert a;

		Contact cont = new Contact();
		cont.LastName = 'Hopkins';
        cont.Accountid = a.id;
        cont.Trial_End_Date__c = Date.today().addDays(30);
        cont.Email = GeneralConfig_TEST.TEST_NEW_USER_EMAIL;
		insert cont;

        Product2 prod = [SELECT Id,Name FROM Product2 LIMIT 1];
        Project__c proj = DataFactory_TEST.createProject(a.Id,cont.Id,prod.Id);
        
        Opportunity opp = new Opportunity();
        opp.Project__c = proj.id;
        opp.Name = 'testAccOpp';
        opp.StageName = 'Free Trial';
        opp.CloseDate = System.today();
        
        
		
		opp.AccountId = a.Id;
		cont.AccountId = a.Id;
		opp.Account = a;

		insert opp;
		// end of init
		
		a.Opportunity_Apex_Trigger_Field__c = 'Something';
		update a;
		Test.startTest();
		Test.stopTest();
		
		// Opportunity testOpp = [SELECT Id,Name,Related_Account_Apex_Trigger_Field__c FROM Opportunity WHERE AccountId=:a.Id LIMIT 1];
		// System.assertEquals('Something',testOpp.Related_Account_Apex_Trigger_Field__c);
	}

	@isTest
	private static void testOpps() {
		Account a = new Account();
		a.Name = 'testAcc';
        insert a;

        Contact cont = new Contact();
        cont.LastName = 'Hopkins';
        cont.Accountid = a.id;
        cont.Trial_End_Date__c = Date.today().addDays(30);
        cont.Email = GeneralConfig_TEST.TEST_NEW_USER_EMAIL;
        insert cont;

        Product2 prod = [SELECT Id,Name FROM Product2 LIMIT 1];
        Project__c proj = DataFactory_TEST.createProject(a.Id,cont.Id,prod.Id);

		Opportunity opp = new Opportunity();
        opp.Project__c = proj.id;
		opp.Name = 'testAccOpp';
		opp.StageName = 'Free Trial';
		opp.CloseDate = System.today();
		

		opp.AccountId = a.Id;
		cont.AccountId = a.Id;
		opp.Account = a;


		insert opp;
		// end of init
		
		a.Contact_Apex_Trigger_Field__c = 'Something';
		update a;
		Test.startTest();
		Test.stopTest();
		
		// Contact testCon = [SELECT Id,Name,Related_Account_Apex_Trigger_Field__c FROM Contact WHERE AccountId=:a.Id LIMIT 1];
		// System.assertEquals('Something',testCon.Related_Account_Apex_Trigger_Field__c);
	}
}