@isTest 
private class Clearbit_TEST {
	
	@TestSetup
	private static void init(){
		DataFactory_TEST.init();
	}

	@isTest
	private static void testClearbit_DAO() {
		cbit__Clearbit__c newCbitRecord = new cbit__Clearbit__c();
		Database.SaveResult result = Database.insert(newCbitRecord,false);
		System.assert(result.isSuccess());
		List<Id> listOfIds = new List<Id>();
		listOfIds.add(newCbitRecord.Id);

		cbit__Clearbit__c retrievedCbitRecord = null;
		List<cbit__Clearbit__c> listOfRetrievedRecords = null;

		Test.startTest();
		listOfRetrievedRecords = Clearbit_DAO.getClearbitRecordsByListOfIds(listOfIds);
		Test.stopTest();

		System.assert(listOfRetrievedRecords.size() > 0);
		retrievedCbitRecord = listOfRetrievedRecords.get(0);
		System.assertEquals(retrievedCbitRecord.Id,newCbitRecord.Id);
	}

	@isTest
	private static void testUpdateAccountOnMasterContactsAndProjects(){
		Integer returnedNumber;
		
		Contact c = new Contact(LastName='SystemAccountUser');
		
		cbit__Clearbit__c newCbit = new cbit__Clearbit__c();
		newCbit.cbit__CompanyGeoStreetName__c = 'someStreetName';
		newCbit.cbit__CompanyName__c = 'Testehano';

		Database.SaveResult result = Database.insert(newCbit,false);
		System.assert(result.isSuccess());

		c.cbit__Clearbit__c = newCbit.Id;
		c.Trial_Source__c= 'Trial Owner';
		c.AccountId = Account_DAO.getSystemAccount().Id;
		c.SystemAccScriptUpdated__c = false;

		result = Database.insert(c,false);
		System.assert(result.isSuccess());
		
		Project__c pr = DataFactory_TEST.createTrialProject();
		pr.Master_User_Contact__c = c.Id;

		result = Database.update(pr,false);
		System.assert(result.isSuccess());

		String eachEmail = 'test@test.com';
		Integer contactLimit = 1;

		List<Contact> contactsToUpdate = new List<Contact>();
		contactsToUpdate.add(c);
		List<Project__c> projectsToUpdate = new List<Project__c>();
		projectsToUpdate.add(pr);
		
		Integer numOfInsertedAccounts = 1;

		Test.startTest();
		returnedNumber = UpdateSystemAccountWithClearbit_SERV.updateAccountOnMasterContactsAndProjects(contactsToUpdate,projectsToUpdate,numOfInsertedAccounts, eachEmail, contactLimit);
		Test.stopTest();
	}

	@isTest
	private static void testCreateNewAccountFromCbit(){
		
		cbit__Clearbit__c testCbit = new cbit__Clearbit__c();
		testCbit.cbit__CompanyName__c = 'FortuanCompany';
		testCbit.cbit__CompanyPhone__c = '00421948127337';
		testCbit.cbit__CompanyGeoStreetName__c = 'Lubovnikova';
		testCbit.cbit__CompanyFacebookHandle__c = 'Fortuan';
		Account newAcc = null;

		Test.startTest();
		newAcc = UpdateSystemAccountWithClearbit_SERV.createNewAccount(testCbit);
		Test.stopTest();

		System.assertEquals('FortuanCompany',newAcc.Name);
		System.assertEquals('00421948127337',newAcc.Phone__c);
		System.assertEquals('Lubovnikova',newAcc.Street__c);
		System.assertEquals('www.facebook.com/Fortuan',newAcc.Facebook__c);
	}

	@isTest
	private static void testGetProjects(){
		
		Account acc = DataFactory_TEST.createTestAccount('testAcc');
		Contact con = DataFactory_TEST.createTestContact(acc.Id);
        Product2 prod = [SELECT Id,Name FROM Product2 LIMIT 1];
        Project__c testProject = DataFactory_TEST.createProject(acc.Id,con.Id,prod.Id);
		Opportunity opp = DataFactory_TEST.createTrialOpportunity(acc.Id,con.Id,testProject.id);
		System.assertNotEquals(null,prod);

		System.assertNotEquals(null,testProject);

		List<Project__c> listOfDesiredProjects = null;
		List<Project__c> listOfAllProjects = new List<Project__c>();
		listOfAllProjects.add(testProject);

		Test.startTest();
		listOfDesiredProjects = UpdateSystemAccountWithClearbit_SERV.getProjects(con.Id,listOfAllProjects);
		Test.stopTest();

		System.assert(listOfDesiredProjects.size() > 0);
	}

	@isTest
	private static void testGetClearbitRecord(){
		cbit__Clearbit__c newRecord = new cbit__Clearbit__c();
		newRecord.cbit__CompanyGeoStreetName__c = 'NoStreet';
		cbit__Clearbit__c anotherRecord = new cbit__Clearbit__c();
		cbit__Clearbit__c evenAnotherRecord = new cbit__Clearbit__c();
		
		List<cbit__Clearbit__c> listOfRecords = new List<cbit__Clearbit__c>();
		listOfRecords.add(newRecord);
		listOfRecords.add(anotherRecord);
		listOfRecords.add(evenAnotherRecord);

		List<Database.SaveResult> results = Database.insert(listOfRecords,false);
		for(Database.SaveResult r : results){
			System.assert(r.isSuccess());
		}

		Id cbId = newRecord.Id;
		newRecord = null;
		
		Test.startTest();
		newRecord = UpdateSystemAccountWithClearbit_SERV.getClearbitRecord(cbId,listOfRecords);
		Test.stopTest();

		System.assertNotEquals(null,newRecord);
		System.assertEquals('NoStreet',newRecord.cbit__CompanyGeoStreetName__c);
	}

	@isTest
	private static void testSuccessAndErrorSetting(){
		Map<String,String> resultMap = new Map<String,String>();
		List<Contact> contactsToUpdate = new List<Contact>();
		List<Project__c> projectsToUpdate = new List<Project__c>();
		List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
		Integer insertedAccounts = 1;
		Test.startTest();
		UpdateSystemAccountWithClearbit_SERV.setSuccessResultPhase1(resultMap,contactsToUpdate,projectsToUpdate,insertedAccounts);
		UpdateSystemAccountWithClearbit_SERV.setSuccessResultPhase2(resultMap,contactsToUpdate,opportunitiesToUpdate);
		UpdateSystemAccountWithClearbit_SERV.setErrorResultPhase1(resultMap,new ProductboardException('Something wrong',2),'test@test.com');
		UpdateSystemAccountWithClearbit_SERV.setErrorResultPhase2(resultMap,new ProductboardException('Something wrong',2));
		Test.stopTest();
	}

	@isTest
	private static void testGetPusProjects(){
		Project__c pr = DataFactory_TEST.createTrialProject();
		
		Project_User__c newPU = new Project_User__c();
		newPU.Project__c = pr.Id;

		Database.SaveResult result = Database.insert(newPU,false);

		List<Project__c> listOfRetrievedProjects = new List<Project__c>();
		List<Project_User__c> projectUsers = new List<Project_User__c>();
		projectUsers.add(newPU);

		Test.startTest();
		listOfRetrievedProjects = UpdateSystemAccountWithClearbit_SERV.getPusProjects(projectUsers);
		Test.stopTest();

		System.assert(listOfRetrievedProjects.size() > 0);
	}

	@isTest
	private static void testGetPuContact(){
		List<Contact> listOfContacts = new List<Contact>();
		
		Account yesAccount = DataFactory_TEST.createTestAccount();

		Contact yesContact = DataFactory_TEST.createTestContact(yesAccount.Id);

		Account noAccount = DataFactory_TEST.createTestAccount();
		
		Contact noContact = DataFactory_TEST.createTestContact(noAccount.Id);

		listOfContacts.add(yesContact);


		Contact foundContact = null;
		Test.startTest();
		try {
			foundContact = UpdateSystemAccountWithClearbit_SERV.getPuContact(noContact.Id,listOfContacts);
		} catch (ProductboardException pe){
			System.debug('As expected, the contact was not found in the testing phase. ' + pe.getMessage());
		}
		System.assertEquals(null,foundContact);
		foundContact = UpdateSystemAccountWithClearbit_SERV.getPuContact(yesContact.Id,listOfContacts);
		Test.stopTest();
		System.assertNotEquals(null,foundContact);
	}

	@isTest
	private static void testGetPuProjectThatExists(){
		List<Project__c> listOfProjects = new List<Project__c>();
		
		Account yesAccount = DataFactory_TEST.createTestAccount();
		Contact yesContact = DataFactory_TEST.createTestContact(yesAccount.Id);
        Product2 yesProduct = [SELECT Id,Name FROM Product2 LIMIT 1];
        Project__c yesProject = DataFactory_TEST.createProject(yesAccount.Id,yesContact.Id,yesProduct.Id);
		Opportunity yesOpportunity = DataFactory_TEST.createTrialOpportunity(yesAccount.Id,yesContact.Id,yesProject.id);


		listOfProjects.add(yesProject);

		Project__c foundProject = null;

		Test.startTest();
		foundProject = UpdateSystemAccountWithClearbit_SERV.getPuProject(yesProject.Id,listOfProjects);
		Test.stopTest();
		System.assertNotEquals(null,foundProject);
	}

	@isTest
	private static void testGetPuProjectThatDoesNotExist(){
		List<Project__c> listOfProjects = new List<Project__c>();

		Account noAccount = DataFactory_TEST.createTestAccount('noAccount');
		Contact noContact = DataFactory_TEST.createTestContact(noAccount.Id);
        Product2 noProduct = [SELECT Id,Name FROM Product2 LIMIT 1];
        Project__c noProject = DataFactory_TEST.createProject(noAccount.Id,noContact.Id,noProduct.Id);

		Opportunity noOpportunity = DataFactory_TEST.createTrialOpportunity(noAccount.Id,noContact.Id,noProject.id);


		Project__c foundProject = null;

		Test.startTest();
		try {
			foundProject = UpdateSystemAccountWithClearbit_SERV.getPuProject(noProject.Id,listOfProjects);
		} catch (ProductboardException pe){
			System.debug('As expected, the project was not found in the testing phase. ' + pe.getMessage());
		}
		System.assertEquals(null,foundProject);
	}

	@isTest
	private static void testGetProjectOpp(){
		List<Opportunity> opps = new List<Opportunity>();
		
		Account yesAccount = DataFactory_TEST.createTestAccount('yesAccount');
		Contact yesContact = DataFactory_TEST.createTestContact(yesAccount.Id);
        Product2 yesProduct = [SELECT Id,Name FROM Product2 LIMIT 1];
        Project__c yesProject = DataFactory_TEST.createProject(yesAccount.Id,yesContact.Id,yesProduct.Id);
		Opportunity yesOpportunity = DataFactory_TEST.createTrialOpportunity(yesAccount.Id,yesContact.Id,yesProject.id);
		opps.add(yesOpportunity);
		Id expectedId = yesOpportunity.Id;

		Account noAccount = DataFactory_TEST.createTestAccount('noAccount');
		Contact noContact = DataFactory_TEST.createTestContact(noAccount.Id);
        Product2 noProduct = [SELECT Id,Name FROM Product2 LIMIT 1];

        Project__c noProject = new Project__c();
        noProject.Name = GeneralConfig_TEST.TEST_PROJECT_NAME_FOR_UPDATE;
        noProject.Team_URL__c = GeneralConfig_TEST.TEST_PROJECT_NAME_FOR_UPDATE;
        noProject.Account_Name__c = noAccount.id;
        noProject.Trial_End_Date__c = Date.today().addDays(30);
        noProject.Master_User_Contact__c = noContact.id;
        noProject.Project_PB_ID__c = GeneralConfig_TEST.TEST_PROJECT_PB_ID2;
        noProject.Active__c = true;
        //projopp pr.Opportunity__c = oppId;
        noProject.Created_Date__c = Datetime.now();
        noProject.Product_Name__c = noProduct.id;
        //Project_DAO.insertProject(pr);
        insert noProject;



		Opportunity noOpportunity = DataFactory_TEST.createTrialOpportunity(noAccount.Id,noContact.Id,noProject.id);
		opps.add(noOpportunity);

		Opportunity foundOpp = null;
		Test.startTest();
		foundOpp = UpdateSystemAccountWithClearbit_SERV.getProjectOpp(expectedId,opps);
		Test.stopTest();

		System.assertNotEquals(null,foundOpp);
		System.assertEquals(expectedId,foundOpp.Id);
	}

	@IsTest
	private static void testUpdateAccOnPuContactsAndProjectOpps(){
		List<Opportunity> opps = new List<Opportunity>();
		List<Contact> puContacts = new List<Contact>();

		Account yesAccount = DataFactory_TEST.createTestAccount('yesAccount');
		Contact yesContact = DataFactory_TEST.createTestContact(yesAccount.Id);
        Product2 yesProduct = [SELECT Id,Name FROM Product2 LIMIT 1];
        Project__c yesProject = DataFactory_TEST.createProject(yesAccount.Id,yesContact.Id,yesProduct.Id);
		Opportunity yesOpportunity = DataFactory_TEST.createTrialOpportunity(yesAccount.Id,yesContact.Id,yesProject.id);
		opps.add(yesOpportunity);
		puContacts.add(yesContact);
		Id expectedId = yesOpportunity.Id;

		Account noAccount = DataFactory_TEST.createTestAccount('noAccount');
		Contact noContact = DataFactory_TEST.createTestContact(noAccount.Id);
        Product2 noProduct = [SELECT Id,Name FROM Product2 LIMIT 1];
        //Project__c noProject = DataFactory_TEST.createProject(noAccount.Id,noContact.Id,noProduct.Id);
		Opportunity noOpportunity = DataFactory_TEST.createTrialOpportunity(noAccount.Id,noContact.Id,yesProject.id);
		opps.add(noOpportunity);
		puContacts.add(noContact);
		Integer pusLimit = 5;



		Project_User__c pu1 = DataFactory_TEST.createTestProjectUser(yesContact,yesProject,true,'admin');
		Project_User__c pu2 = DataFactory_TEST.createTestProjectUser(noContact,yesProject,false,'contributor');

		Test.startTest();
		UpdateSystemAccountWithClearbit_SERV.updateAccOnPuContactsAndProjectOpps(puContacts,opps, pusLimit);
		Test.stopTest();
	}
}