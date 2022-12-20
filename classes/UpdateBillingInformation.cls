global class UpdateBillingInformation  {

    webService static String updateBillingInformation(BillingInfo info) {
        IntegrationLog__c il = Utils.createIntegrationLog('UpdateBillingInformation', 'updateBillingInformation', JSON.serialize(info)); 
        ApiResponseDTO response = new ApiResponseDTO();
        System.Savepoint sp = Database.setSavepoint();

        try {
            UpdateBillingInformation_SERV.updateBillingFields(info, il);
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_SUCCESS, ApiConstants.MSG_SUCCESS_BILLING_INFO_UPDATE, null, null, null );
        } catch(ProductboardException e) {
            ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null );
            Database.rollback(sp);
        } catch(Exception e) {
            il.Description__c += '\nFAILED - StackTrace: '+ e.getStackTraceString();
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_FAILED_GENERAL, ApiConstants.MSG_FAILED_GENERAL, il, e.getMessage(), null );
            Database.rollback(sp); 
        } finally { 
            Utils.updateIntegrationLog(il, response);
            ApiRequestController.logApiRequest(JSON.serialize(info), 'BillingInfo', il.Success__c, il.Method__c, il.Description__c, response);
        }   

        return JSON.serialize(response);
    }
}