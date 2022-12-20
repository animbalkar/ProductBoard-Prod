@isTest
private class ApiResponseTest {

	@isTest
	private static void testSuccess() {
		ApiResponse response = new ApiResponse();
		response.success('ok');
		System.assertEquals('{"statusMessage":"ok","statusCode":200,"responseData":{}}', response.getResponseInString(), 'Wrong success message');
	}

	@isTest
	private static void testErrorPbException() {
		ApiResponse response = new ApiResponse();
		try{
			throw new ProductboardException('errorMessage', 400);
		}catch(ProductboardException ex){
			response.error(ex);
		}
		System.assertEquals('{"statusMessage":"errorMessage","statusCode":400,"responseData":{}}', response.getResponseInString(), 'Wrong error message');
	}

	@isTest
	private static void testErrorGeneralException() {
		ApiResponse response = new ApiResponse();
		try{
			Integer i = 1/0;
		}catch(Exception ex){
			response.error(ex);
		}
		System.assertEquals('{"statusMessage":"Something went wrong. ErrorMessage: [Divide by 0]. StackTrace: [Class.ApiResponseTest.testErrorGeneralException: line 26, column 1]","statusCode":400,"responseData":{}}', response.getResponseInString(), 'Wrong error message');
	}

	@isTest
	private static void testAddResponseData() {
		ApiResponse response = new ApiResponse();
		response.success('ok');
		response.addResponseData('property', 'value');
		System.assertEquals('{"statusMessage":"ok","statusCode":200,"responseData":{"property":"value"}}', response.getResponseInString(), 'Wrong success message');
	}

	@isTest
	private static void testAddLog() {
		ApiResponse response = new ApiResponse();
		response.success('ok');
		IntegrationLog__c il = new IntegrationLog__c();
		insert il;
		response.addLog(il);
		System.assertEquals('{"statusMessage":"ok. IntegrationLog id: [' + il.Id + ']","statusCode":200,"responseData":{}}', response.getResponseInString(), 'Wrong success message');
	}

	


	


	   
}