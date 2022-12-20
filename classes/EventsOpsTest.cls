@isTest 
public class EventsOpsTest {
    @testSetup static void initsObjects() {
		DataFactory_TEST.init();
    }
    
//newUser
    @isTest
	private static void testNewUserSuccess() {
        Project__c pr = DataFactory_TEST.createTrialProject();

        String response = EventsOps.newUserEvent( DataFactory_TEST.createEventsInfo('newUser', '1', GeneralConfig_TEST.TEST_NEW_USER_EMAIL, pr.Project_PB_ID__c, 'admin') );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);

    }

    @isTest
	private static void testNewUserWrongParameters() {
        Project__c pr = DataFactory_TEST.createTrialProject();

        String response = EventsOps.newUserEvent( DataFactory_TEST.createEventsInfo('newUser', '1', GeneralConfig_TEST.TEST_NEW_USER_EMAIL, null, 'admin') );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_FAILED_RECORD_NOT_FOUND, res.statusCode);

    }

    @isTest
	private static void testNewUserGeneralError() {
        Project__c pr = DataFactory_TEST.createTrialProject();

        String response = EventsOps.newUserEvent( DataFactory_TEST.createEventsInfo('newUser', '1', null, pr.Project_PB_ID__c, 'admin') );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_FAILED_GENERAL, res.statusCode);

    }

//remove User
    @isTest
	private static void testRemoveUserSuccess() {
        Project__c pr = DataFactory_TEST.createTrialProject();
        String response0 = EventsOps.newUserEvent( DataFactory_TEST.createEventsInfo('newUser', '1', GeneralConfig_TEST.TEST_NEW_USER_EMAIL, pr.Project_PB_ID__c, 'admin') );

        String response = EventsOps.removeUserEvent( DataFactory_TEST.createEventsInfo('removeUser', '1', null, pr.Project_PB_ID__c, null) );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);

    }

//freeze user
    @isTest
	private static void testFreezeUserSuccess() {
        Project__c pr = DataFactory_TEST.createTrialProject();
        String response0 = EventsOps.newUserEvent( DataFactory_TEST.createEventsInfo('newUser', '1', GeneralConfig_TEST.TEST_NEW_USER_EMAIL, pr.Project_PB_ID__c, 'admin') );

        String response = EventsOps.freezeUserEvent( DataFactory_TEST.createEventsInfo('disableUser', '1', null, pr.Project_PB_ID__c, null) );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);

    }

//unfreeze user
    @isTest
	private static void testUnfreezeUserSuccess() {
        Project__c pr = DataFactory_TEST.createTrialProject();
        String response0 = EventsOps.newUserEvent( DataFactory_TEST.createEventsInfo('newUser', '1', GeneralConfig_TEST.TEST_NEW_USER_EMAIL, pr.Project_PB_ID__c, 'admin') );
        String response1 = EventsOps.freezeUserEvent( DataFactory_TEST.createEventsInfo('disableUser', '1', null, pr.Project_PB_ID__c, null) );

        String response = EventsOps.unfreezeUserEvent( DataFactory_TEST.createEventsInfo('activateUser', '1', null, pr.Project_PB_ID__c, null) );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);

    }

//chenger user role
    @isTest
	private static void testChangeUserSuccess() {
        Project__c pr = DataFactory_TEST.createTrialProject();
        String response0 = EventsOps.newUserEvent( DataFactory_TEST.createEventsInfo('newUser', '1', GeneralConfig_TEST.TEST_NEW_USER_EMAIL, pr.Project_PB_ID__c, 'admin') );

        String response = EventsOps.changeRoleEvent( DataFactory_TEST.createEventsInfo('changeUserRole', '1', null, pr.Project_PB_ID__c, 'contributor') );
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);

    }

    //update project user
    @isTest
	private static void testUpdateuserWrongParameters() {
        Project__c pr = DataFactory_TEST.createTrialProject();
        String response0 = EventsOps.newUserEvent( DataFactory_TEST.createEventsInfo('newUser', '1', GeneralConfig_TEST.TEST_NEW_USER_EMAIL, pr.Project_PB_ID__c, 'admin') );

        String response = EventsOps.removeUserEvent( DataFactory_TEST.createEventsInfo('removeUser', '1', null, null, null) );        
        ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
        System.assertEquals(ApiConstants.CODE_FAILED_RECORD_NOT_FOUND, res.statusCode);

    }


}