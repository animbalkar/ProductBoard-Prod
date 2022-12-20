@isTest
global class TrialOpsTest {
	@TestSetup
	private static void testSetup(){
		DataFactory_TEST.init();
	}
 
    testMethod static void testTrialOps() {
   
      	TrialOps.LeadInfo leadInfo = new TrialOps.LeadInfo();
		leadInfo.spaceType = 'main';
      	leadInfo.userEmail = 'test@test.test';
		leadInfo.userId = '1';
      	TrialOps.createTrialLead( leadInfo );
      	
        // check master lead
      	Lead[] l = [SELECT Id, Email FROM Lead WHERE Email = 'test@test.test'];
      	System.assertEquals(l.size(), 1);        
             
        leadInfo.fullName = 'TestTest';         
        leadInfo.phone = '123465798'; 
        leadInfo.userEmail = 'test@test.test'; 
		leadInfo.userId = '1';
		leadInfo.trialEndDate = Date.today();
        leadInfo.projectId = '1111111111111111111'; 
        leadInfo.teamUrl = 'test'; 
        leadInfo.userEmail1 = 'test1@test1.test'; 
		leadInfo.userId1 = '111';
        leadInfo.userEmail2 = 'test2@test2.test'; 
		leadInfo.userId2 = '222';

       	TrialOps.createNewProject(leadInfo);
        
        // check created project
		 Project__c[] p = [SELECT Id, Master_User_Lead__c 
							FROM Project__c 
							WHERE Project_PB_ID__c = '1111111111111111111'];
        System.assertEquals(p.size(), 1);


        Project_User__c[] pu = [SELECT Id, User_Score__c FROM Project_User__c WHERE Name IN ('test@test.test','test1@test1.test','test2@test2.test','test3@test3.test')  ORDER BY Name];
 
		System.assertEquals(pu.size(), 3);

    }

    testMethod static void testTrialOpsExistingUsers() {
		String email = 'test@test.test';
		String userId = GeneralConfig_TEST.TEST_USER_PB_ID;
		Lead newLead = new Lead();
		newLead.Space_Type__c = 'main';
		newLead.Email = email;
		newLead.LastName = 'Not provided';
		newLead.Company = 'Not provided';
		newLead.user_PB_ID__c = double.valueof(userId);
		insert newLead;

      	TrialOps.LeadInfo leadInfo = new TrialOps.LeadInfo();
		leadInfo.spaceType = 'main';
      	leadInfo.userEmail = email;
		leadInfo.userId = userId;
      	TrialOps.createTrialLead( leadInfo );
      	
        // check master lead
      	Lead l = [SELECT Trial_Source__c FROM Lead WHERE User_PB_ID__c = :double.valueof(userId)];
		System.assertEquals(l.Trial_Source__c, 'Trial Request');
             
        leadInfo.fullName = 'Test Test';         
        leadInfo.phone = '123465798'; 
        leadInfo.userEmail = email;
		leadInfo.userId = '1'; 
		leadInfo.trialEndDate = Date.today();
        leadInfo.projectId = '11111111111111111111'; 
        leadInfo.teamUrl = 'test'; 
        leadInfo.userEmail1 = 'test1@test1.test'; 
		leadInfo.userId1 = '111';

		TrialOps.createNewProject(leadInfo);
        
        // check created project
		 Project__c[] p = [SELECT Id, Master_User_Lead__c FROM Project__c 
		 					WHERE Project_PB_ID__c = '11111111111111111111'];
        System.assertEquals(p.size(), 1);        
        
        // check created project users
		Project_User__c[] pu = [SELECT Id FROM Project_User__c 
								WHERE Name IN ('test@test.test','test1@test1.test','test2@test2.test','test3@test3.test') ORDER BY Name];
      	System.assertEquals(pu.size(), 2);
    }
    
	@isTest static void testTrialOpsCreateTrialLeadError() {
		TrialOps.LeadInfo leadInfo = new TrialOps.LeadInfo();        
        leadInfo.userId1 = '123';
		String response = TrialOps.createTrialLead( leadInfo ); 
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_GENERAL, res.statusCode);        
	}  
    
	@isTest static void testTrialOpsCreateTrialLeadPBError() {
		TrialOps.LeadInfo leadInfo = new TrialOps.LeadInfo();   
        leadInfo.userEmail = ''; 
        leadInfo.userId = '123';        
		String response = TrialOps.createTrialLead( leadInfo ); 
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_PARAMETERS, res.statusCode);        
	} 
    
	@isTest static void testTrialOpsCreateNewProjectError() {
		TrialOps.LeadInfo leadInfo = new TrialOps.LeadInfo();        
        leadInfo.userId1 = '123';
		String response = TrialOps.createNewProject( leadInfo ); 
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_GENERAL, res.statusCode);        
	} 
    
	@isTest static void testTrialOpsContains() {
		List<Account> listAcc = new List<Account>();
		Account Acc = new Account(Name = 'Test Account');
        listAcc.add(Acc);
        Boolean result = TrialOps.contains(listAcc, Acc);
		System.assertEquals(True, result);   
        listAcc.remove(0);
        result = TrialOps.contains(listAcc, Acc);
		System.assertEquals(False, result);          
	}    
}