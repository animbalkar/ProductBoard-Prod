@isTest
private class UpdateBillingInformationTest {
	@testSetup
	static void initsObjects() {
		DataFactory_TEST.init();
	}

	@isTest
	private static void testInvalidProjectId() {
		String response = UpdateBillingInformation.updateBillingInformation(UpdateBillingInformationTest_SERV.setUpBillingInfo(null, true));
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_FAILED_RECORD_NOT_FOUND, res.statusCode);
	}

	@isTest
	private static void testBillingInfoUpdate() {
		Project__c pr = DataFactory_TEST.createProjectWithAssetNoDiscount('New idea', 'yearly', 1);

		String response = UpdateBillingInformation.updateBillingInformation(
			UpdateBillingInformationTest_SERV.setUpBillingInfo(pr.Project_PB_ID__c, true)
		);

		Project__c actualProject = Project_DAO.getProjectByPBIdWithExc(pr.Project_PB_ID__c);
		ApiResponseDTO res = (ApiResponseDTO) JSON.deserialize(response, ApiResponseDTO.class);
		System.assertEquals(ApiConstants.CODE_SUCCESS, res.statusCode);
		System.assertEquals(ApiConstants.MSG_SUCCESS_BILLING_INFO_UPDATE, res.statusMessage);
		System.assertEquals('Test Street 123', actualProject.CC_Address__c);
		System.assertEquals('test@test.test', actualProject.CC_Billing_Email__c);
		System.assertEquals('Test City', actualProject.CC_City__c);
		System.assertEquals('Test Country', actualProject.CC_Country__c);
		System.assertEquals('12300', actualProject.CC_Postal_Code__c);
		System.assertEquals('Test State', actualProject.CC_State__c);
		System.assertEquals('Test billing additional information.', actualProject.BI_Additional_Info__c);
		System.assertEquals('Company Street 321', actualProject.BI_Address__c);
		System.assertEquals('Company City', actualProject.BI_City__c);
		System.assertEquals('Test Company', actualProject.BI_Company_Name__c);
		System.assertEquals('Company Country', actualProject.BI_Country__c);
		System.assertEquals('32100', actualProject.BI_Postal_Code__c);
		System.assertEquals('Company State', actualProject.BI_State__c);
		System.assertEquals('123465789', actualProject.BI_VAT_Number__c);
	}
}