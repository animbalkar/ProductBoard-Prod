@isTest
private class ProjectOpsTest {
	@testSetup
	static void initsObjects() {
		DataFactory_TEST.init();
	}

	//update project name
	@isTest
	private static void testWrongParamaters() {
		String response = ProjectOps.updateProjectName(
			DataFactory_TEST.createProjectInfo(null, GeneralConfig_TEST.TEST_PROJECT_NAME_FOR_UPDATE, null, null)
		);
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_PARAMETERS, res.statusCode);
	}

	@isTest
	private static void testInvalidProjectIdName() {
		String response = ProjectOps.updateProjectName(
			DataFactory_TEST.createProjectInfo('9', GeneralConfig_TEST.TEST_PROJECT_NAME_FOR_UPDATE, null, null)
		);
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_RECORD_NOT_FOUND, res.statusCode);
	}

	@isTest
	private static void testProjectNameGeneralError() {
		Project__c pr = DataFactory_TEST.createTrialProject();

		String response = ProjectOps.updateProjectName(
			DataFactory_TEST.createProjectInfo(
				pr.Project_PB_ID__c,
				GeneralConfig_TEST.TEST_PROJECT_NAME_FOR_UPDATE +
				'addMoreCharactersForTooLongStringToSavInOrderToThrowError' +
				'addMoreCharactersForTooLongStringToSavInOrderToThrowError',
				null,
				null
			)
		);
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_GENERAL, res.statusCode);
	}

	@isTest
	private static void testFunctionalUpdate() {
		Project__c pr = DataFactory_TEST.createTrialProject();

		String response = ProjectOps.updateProjectName(
			DataFactory_TEST.createProjectInfo(pr.Project_PB_ID__c, GeneralConfig_TEST.TEST_PROJECT_NAME_FOR_UPDATE, null, null)
		);
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
		System.assertEquals(
			GeneralConfig_TEST.TEST_PROJECT_NAME_FOR_UPDATE_FULL,
			Project_DAO.getProjectByPBIdWithExc(pr.Project_PB_ID__c).Team_URL__c
		);
		System.assertEquals(
			GeneralConfig_TEST.TEST_PROJECT_NAME_FOR_UPDATE_FULL,
			Project_DAO.getProjectByPBIdWithExc(pr.Project_PB_ID__c).Name
		);
	}

	//delete project
	@isTest
	private static void testDeleteProjectGeneralError() {
		Project__c pr = DataFactory_TEST.createTrialProject();
		pr.name = 'almostTooLongNamexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
		update pr;

		String response = ProjectOps.deleteSpace(DataFactory_TEST.createProjectInfo(pr.Project_PB_ID__c, null, null, null));
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_GENERAL, res.statusCode);
	}

	@isTest
	private static void testDeleteDeletedProject() {
		Project__c pr = DataFactory_TEST.createTrialProject();
		pr.Deleted__c = true;
		Project_DAO.updateProject(pr);

		String response = ProjectOps.deleteSpace(DataFactory_TEST.createProjectInfo(pr.Project_PB_ID__c, null, null, null));

		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.MSG_SUCCESS_PROJECT_DELETE, res.statusMessage);
	}

	@isTest
	private static void testDeleteSubscriptionNotCancelled() {
		Project__c pr = DataFactory_TEST.createProjectWithAssetWithDiscount(
			'Startup',
			'yearly',
			1,
			'amount_off',
			12,
			'multi-month',
			null,
			200,
			null
		);

		String response = ProjectOps.deleteSpace(DataFactory_TEST.createProjectInfo(pr.Project_PB_ID__c, null, null, null));

		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_PROJECT_NOT_DELETED, res.statusCode);
	}

	@isTest
	private static void testDeleteTrial() {
		Project__c pr = DataFactory_TEST.createTrialProject();

		String response = ProjectOps.deleteSpace(DataFactory_TEST.createProjectInfo(pr.Project_PB_ID__c, null, null, null));

		Project__c updatedProject = Project_DAO.getProjectByPBIdWithExc(pr.Project_PB_ID__c);
		List<Project_User__c> pus = ProjectUser_DAO.getProjectUsersByProjectId2(pr.Id);

		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.MSG_SUCCESS_PROJECT_DELETE, res.statusMessage);
		System.assertEquals(true, updatedProject.Deleted__c);
		for (Project_User__c pu : pus) {
			System.assertEquals('Deleted', pu.User_Status__c);
		}
	}

	@isTest
	private static void testDeleteCancelledSubscription() {
		Project__c pr = DataFactory_TEST.createTrialProject();
		Contact masterContact = Contact_DAO.getContactbyId2(pr.Master_User_Contact__c).get(0);

		Subscription_DTO_Req info = DataFactory_TEST.setSubscriptionInfo(pr.Project_PB_ID__c, masterContact.Email, 1, 'yearly', 'New idea');
		String response0 = SubscriptionOps.addSubscription(info);

		Subscription_DTO_Req cancelInfo = DataFactory_TEST.setCancelSubscriptionInfo(masterContact.Email, pr.Project_PB_ID__c);
		String responseCancel = SubscriptionOps.cancelSubscription(cancelInfo);

		Test.startTest();
		String response = ProjectOps.deleteSpace(DataFactory_TEST.createProjectInfo(pr.Project_PB_ID__c, null, null, null));
		Test.stopTest();

		Project__c updatedProject = Project_DAO.getProjectByPBIdWithExc(pr.Project_PB_ID__c);
		List<Project_User__c> pus = ProjectUser_DAO.getProjectUsersByProjectId2(pr.Id);

		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.MSG_SUCCESS_PROJECT_DELETE, res.statusMessage);
		System.assertEquals(true, updatedProject.Deleted__c);
		for (Project_User__c pu : pus) {
			System.assertEquals('Deleted', pu.User_Status__c);
		}
	}

	@isTest
	private static void testDeleteProjectNotFound() {
		String projectId = '9';
		String response = ProjectOps.deleteSpace(DataFactory_TEST.createProjectInfo(projectId, null, null, null));

		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_RECORD_NOT_FOUND, res.statusCode);
	}

	//updateTrialEndDate

	@isTest
	private static void testupdateTrialEndDateSuccess() {
		Project__c pr = DataFactory_TEST.createTrialProject();

		String response = ProjectOps.updateTrialEndDate(DataFactory_TEST.createProjectInfo(pr.Project_PB_ID__c, null, Date.today(), null));
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
	}

	@isTest
	private static void testupdateTrialEndDateWrongParameters() {
		Project__c pr = DataFactory_TEST.createTrialProject();

		String response = ProjectOps.updateTrialEndDate(DataFactory_TEST.createProjectInfo(null, null, Date.today(), null));
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_RECORD_NOT_FOUND, res.statusCode);
	}
}