public class ApiRequestController {

    public static void logApiRequest(String jsonReq, String recordTypeName, Boolean success, String method, String detail, ApiResponse res) { 
        ApiResponseDTO responseDto = new ApiResponseDTO();
        responseDto.statusCode = res.statusCode;
        responseDto.statusMessage = res.statusMessage;
        logApiRequest(jsonReq,recordTypeName,success,method,detail,responseDto);
    }
    
    public static void logApiRequest(String jsonReq, String recordTypeName, Boolean success, String method, String detail, ApiResponseDTO res) { 
        API_Request__c ar = new API_Request__c();
        
        ar.RecordTypeId = Utils.getRecordTypeId('API_Request__c', recordTypeName);
        ar.Original_Request__c = jsonReq;
        ar.Method__c = method;
        ar.Success__c = success;
        ar.Detail__c = detail;
        ar.Response_Code__c = res.statusCode;
        ar.Response_Message__c = res.statusMessage;

        ApiRequestController.Wrapper obj = (ApiRequestController.Wrapper) JSON.deserialize(jsonReq, ApiRequestController.Wrapper.class);
        ar.activationDate__c = obj.activationDate;
        ar.biAdditionalInfo__c = obj.biAdditionalInfo;
        ar.biAddress__c = obj.biAddress;
        ar.biCity__c = obj.biCity;
        ar.biCompanyName__c = obj.biCompanyName;
        ar.biCountry__c = obj.biCountry;
        ar.biPostalCode__c = obj.biPostalCode;
        ar.biState__c = obj.biState;
        ar.biVATNumber__c = obj.biVATNumber;
        ar.ccAddress__c = obj.ccAddress;
        ar.ccBillingEmail__c = obj.ccBillingEmail;
        ar.ccCity__c = obj.ccCity;
        ar.ccCountry__c = obj.ccCountry;
        ar.ccPostalCode__c = obj.ccPostalCode;
        ar.ccState__c = obj.ccState;
        ar.company__c = obj.company;
        ar.eventType__c = obj.eventType;
        ar.fullName__c = obj.fullName;
        ar.UserRole__c = obj.UserRole;
        ar.pbOptIn__c = obj.pbOptIn;
        ar.phone__c = obj.phone;
        ar.projectId__c = obj.projectId;
        ar.teamUrl__c = obj.teamUrl;
        ar.trialEndDate__c = obj.trialEndDate;
        ar.userEmail__c = obj.userEmail;
        ar.userEmail1__c = obj.userEmail1;
        ar.userEmail2__c = obj.userEmail2;
        ar.userEmail3__c = obj.userEmail3;
        ar.userEmailsToActivate__c = String.valueOf(obj.userEmailsToActivate);
        ar.userId__c = obj.userId;
        ar.userId1__c = obj.userId1;
        ar.userId2__c = obj.userId2;
        ar.userId3__c = obj.userId3;
        ar.hash__c = obj.hash;
        ar.amountOfUsers__c = obj.amountOfUsers;
        ar.frequency__c = obj.frequency;
        ar.plan__c = obj.plan;
        ar.planVersion__c = obj.planVersion;
        ar.discountValue__c = obj.discountValue;
        ar.discountType__c = obj.discountType;
        ar.discountSubtype__c = obj.discountSubtype;
        ar.discountLength__c = obj.discountLength;
        ar.stripeInvoiceId__c = obj.stripeInvoiceId;
        ar.spaceType__c = obj.spaceType;
        if(obj.billingInfoFlag != null) ar.billingInfoFlag__c = obj.billingInfoFlag;

        insert ar;
    }
  
    public class Wrapper{
        public Datetime activationDate;
        public String biAdditionalInfo;
        public String biAddress;
        public String biCity;
        public String biCompanyName;
        public String biCountry;
        public String biPostalCode;
        public String biState;
        public String biVATNumber;
        public String ccAddress;
        public String ccBillingEmail;
        public String ccCity;
        public String ccCountry;
        public String ccPostalCode;
        public String ccState;
        public String company;
        public String eventType;
        public String fullName;
        public String UserRole;
        public String pbOptIn;
        public String phone;
        public String projectId;
        public String teamUrl;
        public Date trialEndDate;
        public String userEmail;
        public String userEmail1;
        public String userEmail2;
        public String userEmail3;
        public List<String> userEmailsToActivate;
        public String userId;
        public String userId1;
        public String userId2;
        public String userId3;
        public String hash;
        public Integer amountOfUsers;
        public String frequency;
        public String plan;
        public String planVersion;
        public String discountValue;
        public String discountType;
        public String discountSubtype;
        public String discountLength;
        public String stripeInvoiceId;
        public Boolean billingInfoFlag;
        public String spaceType;
    }
}