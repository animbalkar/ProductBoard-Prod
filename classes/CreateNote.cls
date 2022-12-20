public with sharing class CreateNote {
    
    @AuraEnabled
    public static String makePostCallout(Id recordId, String comments) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.productboard.com/notes');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Opportunity opportunity = [SELECT Loss_Reason__c, Loss_Reason_Long__c, Name FROM Opportunity WHERE Id=:recordId];
        
        String lossReason = 'Loss Reason - ' + (String.isEmpty(opportunity.Loss_Reason__c) ? '' : opportunity.Loss_Reason__c);
        String lossReasonLong = String.isEmpty(opportunity.Loss_Reason_Long__c) ? '' : opportunity.Loss_Reason_Long__c;
        String oppoName = opportunity.Name;

        comments = String.isEmpty(comments) ? '' : comments;

        request.setHeader('Authorization','Bearer eyJ0eXAiOiJKV1QiLCJraWQiOiJlZTNhN2M4OWNhMGVhN2RjNDFkNjE0ZTBkNjliMjg4OTUwMGY5ZGNlZWYxZDJiN2EzYzk1YjQwNjFlNjBhMTE0IiwiYWxnIjoiUlM1MTIifQ.eyJ1c2VyX2lkIjo4MDc5OCwic3BhY2VfaWQiOjI4MTI0LCJpYXQiOjE1NzY4NTk3NzN9.epLQMig8FERxg3prrcaWGf7cENNgjlfpibFD8e0YQ1ywZCyWZpWGuY_kgGviy5x0lqLx9cPFsir8y-PS843pcaIcS-n7Dqe-2HAKAt7PlikyjuVp7MXW8IFRoOY1VleVbZedGqpQq9RU_cSCnJPYk3VRbpDzTd5vlC7xP6_lNisvfeB0zjbmBPX5eYx5EjA4uBoVK_9CPwmvSgxsfTdaSDuPWvu8HWz1vW65rXsqypUqT-WyjgGC5KT8Vt0tgKTwW6CjhWsQJQ4uHfIYy-74PFxRUDpPEBitcCfOAA-NTCxJPoeIfKTEzz0cXsEUT2v8nkmtE9A0DHXZ5syqHeA7Zw');
        request.setBody('{"title":"'+oppoName+': '+lossReason+'", "content":"'+lossReasonLong + '\n\n '+ comments + '", "customer_email" : "'+UserInfo.getUserEmail()+'", "tags" : ["Lost Opportunity"]}');
        HttpResponse response = http.send(request);
        
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
                AuraHandledException e = new AuraHandledException('The status code returned was not expected');
                e.setMessage('The status code returned was not expected');
                throw e;
        } else {
            System.debug(response.getBody());
            return 'SUCCESS';
        }   
    }        
}