public class ApiResponseDTO  {
    public Integer statusCode;
    public String statusMessage;

    public static void createResponse(ApiResponseDTO res, Integer statusCode, String statusMessage, IntegrationLog__c il, String errorMessage, String stackTrace){
        res.statusCode = statusCode;
        string finalMessage = statusMessage;
        if(il != null) finalMessage = finalMessage + '. IntegrationLog id: [' + il.id + ']';
        if(errorMessage != null) finalMessage = finalMessage + '. ErrorMessage: [' + errorMessage + ']';
        if(stackTrace != null) finalMessage = finalMessage + '. StackTrace: [' + stackTrace + ']';
        res.statusMessage = finalMessage;
    }
}