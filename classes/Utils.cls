public class Utils {
    
    public static Id getRecordTypeId(String objectName, String recordTypeName) {
        return Schema.getGlobalDescribe().get(objectName).getDescribe().getRecordTypeInfosByName().get(recordTypeName).getRecordTypeId();
    }

    public static IntegrationLog__c createIntegrationLog(String className, String methodName, String jsonRequest){
        IntegrationLog__c il = new IntegrationLog__c();
        il.Class__c = className;
        il.Method__c = methodName;
        il.Success__c = false;
        il.Description__c = '' ;
        il.Method_Parameters__c = jsonRequest;
        insert il;
        return il;
    }

    public static void updateIntegrationLog(IntegrationLog__c il, ApiResponseDTO response){
        if(response.statusCode == 200) il.Success__c = true;
        il.Response_Message__c = response.statusMessage;
        il.Response_Code__c = response.statusCode;
        update il;
    }
    public static void updateIntegrationLog(IntegrationLog__c il, ApiResponse response){
        if(response.statusCode == 200) il.Success__c = true;
        il.Response_Message__c = response.statusMessage;
        il.Response_Code__c = response.statusCode;
        update il;
    }

    public static void checkEmptyList(List<SObject> objList, String errorMessageAppendix){
		if(objList.isEmpty()) throw new ProductboardException(objList.getSObjectType().getDescribe().getLabel() + ' was not found.' + errorMessageAppendix, ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
    }
    
    public static void checkEmptyUniqueList(List<SObject> objList, String errorMessageAppendix){
        if(objList.isEmpty()) throw new ProductboardException(objList.getSObjectType().getDescribe().getLabel() + ' was not found.' + errorMessageAppendix, ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
        if(objList.size() > 1) throw new ProductboardException('More '  + objList.getSObjectType().getDescribe().getLabelPlural() + ' were found.' + errorMessageAppendix, ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND);
	}
}