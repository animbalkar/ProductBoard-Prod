@isTest
private class UserOpsTest {

	@testSetup static void initsObjects() {
		DataFactory_TEST.init();
	}

	@isTest
	private static void testWrongParametersEmail() {
		String response = UserOps.updateUserEmail( DataFactory_TEST.createUserInfo('1', null, null, null) );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_FAILED_PARAMETERS, res.statusCode);
	}

    
	@isTest
	private static void testNoLeadsNoContactsNoPus() {
		String newEmail = 'test852@test852.test';
		String response = UserOps.updateUserEmail( DataFactory_TEST.createUserInfo('1', newEmail, null, null) );

        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
	}
    
	@isTest
	private static void testUpdateLeadsContactsPus() {
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c).get(0);
		String userEmail = GeneralConfig_TEST.TEST_NEW_USER_EMAIL2;
		String userId = GeneralConfig_TEST.TEST_USER_PB_ID;
		Lead testLead = DataFactory_TEST.createTestLead(userId, masterContact.Email);

		String response = userOps.updateUserEmail( DataFactory_TEST.createUserInfo(userId, userEmail, null, null) );

		List<Lead> leads = [SELECT Email FROM Lead WHERE user_PB_ID__c = :double.valueOf(userId) ];
		List<Contact> contacts = [SELECT Email FROM Contact WHERE user_PB_ID__c = :double.valueOf(userId) ];
		List<Project_User__c> pus = [SELECT Name FROM Project_User__c WHERE Contact__r.User_PB_ID__c = :double.valueOf(userId)];	
		
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);

		for(Lead l : leads) {
			System.assertEquals(userEmail, l.Email);
		}
		
		for(Contact c : contacts) {
			System.assertEquals(userEmail, c.Email);
		}
		for(Project_User__c pu : pus) {
			System.assertEquals(userEmail, pu.Name);
		}
		
	}	
    
	@isTest
	private static void testWrongParametersFullName() {
		String response = UserOps.updateUserFullName( DataFactory_TEST.createUserInfo('1', null, null, null) );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_FAILED_PARAMETERS, res.statusCode);
	}
    
	@isTest
	private static void testNoLeadsNoContacts() {
		String response = UserOps.updateUserFullName( DataFactory_TEST.createUserInfo('1', null, 'Test User', null) );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
	}
    
	@isTest
	private static void testUpdateLeadsContactsFullName() {
		String fullName = 'First Last';
		String userId = GeneralConfig_TEST.TEST_USER_PB_ID;
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c).get(0);
		Lead testLead = DataFactory_TEST.createTestLead(userId, masterContact.Email);

		String response = UserOps.updateUserFullName( DataFactory_TEST.createUserInfo(userId, null, fullName, null));

		
		List<Lead> leads = [SELECT Name, Full_Name__c, FirstName,LastName
							 FROM Lead WHERE user_PB_ID__c = :double.valueOf(userId)];
		List<Contact> contacts = [SELECT Name, FirstName, LastName 
									FROM Contact WHERE user_PB_ID__c = :double.valueOf(userId)];

        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
        System.assertEquals(ApiConstants.MSG_SUCCESS_USER_NAME_UPDATE, res.statusMessage);
		
		for(Lead l : leads) {
			System.assertEquals(fullName, l.Name);
			System.assertEquals(fullName, l.Full_Name__c);
			System.assertEquals('First', l.FirstName);
			System.assertEquals('Last', l.LastName);
		}
		
		for(Contact c : contacts) {
			System.assertEquals(fullName, c.Name);
			System.assertEquals('First', c.FirstName);
			System.assertEquals('Last', c.LastName);
		}
	}
    

	@IsTest
	private static void testNullLastName(){
		Contact theTestedContact = new Contact();
		
		Test.startTest();
		Contact_SERV.parseContactFullName('Anthony ',theTestedContact);
		Test.stopTest();

		System.assertEquals(theTestedContact.LastName,'Anthony');
	}


    
	@isTest
	private static void testUpdateLeadsContactsJustLastName() {
		String fullName = 'Last';
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c).get(0);
		String userId = GeneralConfig_TEST.TEST_USER_PB_ID;
		Lead testLead = DataFactory_TEST.createTestLead(userId, masterContact.Email);

		String response = UserOps.updateUserFullName(DataFactory_TEST.createUserInfo(userId, null, fullName, null) );

		List<Lead> leads = [SELECT Name, Full_Name__c, FirstName,LastName
							 FROM Lead WHERE user_PB_ID__c = :double.valueOf(userId)];
		List<Contact> contacts = [SELECT Name, FirstName, LastName 
									FROM Contact WHERE user_PB_ID__c = :double.valueOf(userId)];

        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
        System.assertEquals(ApiConstants.MSG_SUCCESS_USER_NAME_UPDATE, res.statusMessage);
				
		for(Lead l : leads) {
			System.assertEquals(fullName, l.Name);
			System.assertEquals(fullName, l.Full_Name__c);
			System.assertEquals(null, l.FirstName);
			System.assertEquals('Last', l.LastName);
		}
		
		
		for(Contact c : contacts) {
			System.assertEquals(fullName, c.Name);
			System.assertEquals(null, c.FirstName);
			System.assertEquals('Last', c.LastName);
		}
	}
    
	@isTest
	private static void testInvalidParametersPbOptIn() {		
		String response = UserOps.updateUserPbOptIn(DataFactory_TEST.createUserInfo('1', null, 'first last', null));
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_FAILED_PARAMETERS, res.statusCode);
                
	}
        
	@isTest
	private static void testValidUpdate() {
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c).get(0);
		String fullName = 'First Last';
		String response = UserOps.updateUserPbOptIn( DataFactory_TEST.createUserInfo(String.valueOf(masterContact.User_PB_ID__c), null, fullName, 'true') );

		List<Contact> contacts = [SELECT Productboard_Opt_in__c, Name FROM Contact WHERE user_PB_ID__c = :masterContact.User_PB_ID__c];
		
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
        	
		System.assertEquals('First Last', contacts[0].Name);
		System.assertEquals(true, contacts[0].Productboard_Opt_in__c);
	}
	   
}