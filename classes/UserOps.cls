global class UserOps {

	webService static String updateUserPbOptIn(UserOps_DTO_req info) {
        IntegrationLog__c il = Utils.createIntegrationLog('UserOps', 'updateUserPbOptIn', JSON.serialize(info)); 
        ApiResponseDTO response = new ApiResponseDTO();
        System.Savepoint sp = Database.setSavepoint();

        try {
            if (info.pbOptIn == null || info.userId == null) {
                il.Description__c += '\nFAILED - Invalid parameters';
                throw new ProductboardException(ApiConstants.MSG_FAILED_PARAMETERS, ApiConstants.CODE_FAILED_PARAMETERS);
            }
			UserOps_SERV.updateUserPbOptIn(info.fullName, Double.valueOf(info.userId), info.pbOptIn, il);
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_SUCCESS, ApiConstants.MSG_SUCCESS_USER_OPT_IN_UPDATE, null, null, null );
        } catch(ProductboardException e) {
            ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null );
            Database.rollback(sp);
        } catch(Exception e) {
            il.Description__c += '\nFAILED - StackTrace: '+ e.getStackTraceString();
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_FAILED_GENERAL, ApiConstants.MSG_FAILED_GENERAL, il, e.getMessage(), null );
            Database.rollback(sp); 
        } finally { 
            Utils.updateIntegrationLog(il, response);
            ApiRequestController.logApiRequest(JSON.serialize(info), 'UserOps_DTO_req', il.Success__c, il.Method__c, il.Description__c, response);
        }   

        return JSON.serialize(response);
    }
    
    webService static String updateUserFullName(UserOps_DTO_req info) {
        IntegrationLog__c il = Utils.createIntegrationLog('UserOps', 'updateUserFullName', JSON.serialize(info)); 
        ApiResponseDTO response = new ApiResponseDTO();
        System.Savepoint sp = Database.setSavepoint();

		try {
            if (info.fullName == null || info.userId == null) {
                il.Description__c += '\nFAILED - Invalid parameters';
                throw new ProductboardException(ApiConstants.MSG_FAILED_PARAMETERS, ApiConstants.CODE_FAILED_PARAMETERS);
            }
		    UserOps_SERV.updateUserFullName(info.fullName, Double.valueOf(info.userId), il);
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_SUCCESS, ApiConstants.MSG_SUCCESS_USER_NAME_UPDATE, null, null, null );
	    } catch(ProductboardException e) {
            ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null );
            Database.rollback(sp);
        } catch(Exception e) {
            il.Description__c += '\nFAILED - StackTrace: '+ e.getStackTraceString();
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_FAILED_GENERAL, ApiConstants.MSG_FAILED_GENERAL, il, e.getMessage(), null );
            Database.rollback(sp); 
        } finally { 
            Utils.updateIntegrationLog(il, response);
            ApiRequestController.logApiRequest(JSON.serialize(info), 'UserOps_DTO_req', il.Success__c, il.Method__c, il.Description__c, response);
        }    

        return JSON.serialize(response);
    }

    webService static String updateUserEmail(UserOps_DTO_req info) {
        IntegrationLog__c il = Utils.createIntegrationLog('UserOps', 'updateUserEmail', JSON.serialize(info)); 
        ApiResponseDTO response = new ApiResponseDTO();
        System.Savepoint sp = Database.setSavepoint();

        try {
            if (info.userEmail == null || info.userId == null) {
                il.Description__c += '\nFAILED - Invalid parameters';
                throw new ProductboardException(ApiConstants.MSG_FAILED_PARAMETERS, ApiConstants.CODE_FAILED_PARAMETERS);
            }
            UserOps_SERV.updateUserEmail(info.userEmail.toLowerCase(), Double.valueOf(info.userId), il);
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_SUCCESS, ApiConstants.MSG_SUCCESS_USER_EMAIL_UPDATE, null, null, null );
        } catch(ProductboardException e) {
            ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null );
            Database.rollback(sp);
        } catch(Exception e) {
            il.Description__c += '\nFAILED - StackTrace: '+ e.getStackTraceString();
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_FAILED_GENERAL, ApiConstants.MSG_FAILED_GENERAL, il, e.getMessage(), null );
            Database.rollback(sp); 
        } finally { 
            Utils.updateIntegrationLog(il, response);
            ApiRequestController.logApiRequest(JSON.serialize(info), 'UserOps_DTO_req', il.Success__c, il.Method__c, il.Description__c, response);
        }   
        return JSON.serialize(response);
    }
}