public class ApiResponse  {
    public Integer statusCode {get; private set; }
    public String statusMessage {get; private set; }
    private Map<String, Object> responseData;

    public ApiResponse(){
        this.responseData = new Map<String, Object>();
    }

    public void success(String successMessage){
        this.statusCode = ApiConstants.CODE_SUCCESS;
        this.statusMessage = successMessage;
    }

    public void error(ProductboardException ex){
        this.statusCode = ex.status;
        this.statusMessage = ex.getMessage();
    }

    public void error(Exception ex){
        this.statusCode = ApiConstants.CODE_FAILED_GENERAL;
        this.statusMessage = ApiConstants.MSG_FAILED_GENERAL;
        addAdditionalStatusMessage('. ErrorMessage: [' + ex.getMessage() + ']. StackTrace: [' + ex.getStackTraceString() + ']');
    }

    public void addResponseData(String name, Object value){
        this.responseData.put(name, value);
    }

    public void addLog(IntegrationLog__c il){
        addAdditionalStatusMessage('. IntegrationLog id: [' + il.id + ']');
    }

    public String getResponseInString(){
        return JSON.serialize(this);
    }

    private void addAdditionalStatusMessage(String message){
        if(this.statusMessage == null){
            this.statusMessage = '';
        }
        this.statusMessage += message;
    }
}