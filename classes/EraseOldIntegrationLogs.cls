global class EraseOldIntegrationLogs implements Database.Batchable<SObject> {
    
    private Integer erasePeriodInDays; // 0 = today and before
    private Boolean eraseStatus; 
    
    global EraseOldIntegrationLogs(Integer periodInDays, boolean successStatus) {
        erasePeriodInDays = periodInDays;
        eraseStatus = successStatus;
    }
    
    /**
     * @description gets invoked when the batch job starts
     * @param context contains the job ID
     * @returns the record set as a QueryLocator object that will be batched for execution
     */ 
    global Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator('SELECT Id FROM IntegrationLog__c WHERE createdDate <= LAST_N_DAYS:' + erasePeriodInDays + ' AND Success__c = ' + eraseStatus);
    }

    /**
     * @description gets invoked when the batch job executes and operates on one batch of records. Contains or calls the main execution logic for the batch job.
     * @param context contains the job ID
     * @param scope contains the batch of records to process.
     */ 
    global void execute(Database.BatchableContext context, List<IntegrationLog__c> scope) {
        delete scope;
    }
    
    /**
     * @description gets invoked when the batch job finishes. Place any clean up code in this method.
     * @param context contains the job ID
     */ 
    global void finish(Database.BatchableContext context) {
        IntegrationLog__c il = new IntegrationLog__c();
        String method;
        if(eraseStatus) method = 'eraseSuccesfulLogs';
        if(!eraseStatus) method = 'eraseFailedLogs';
        il.Class__c = 'EraseOldIntegrationLogs';
        il.Success__c = true;
        il.Method_Parameters__c = 'erasePeriodInDays: "' + erasePeriodInDays + '"' + '\n' + 'eraseStatus: "' + eraseStatus + '"';
        il.Description__c = 'Logs have been sucessfully erased.';
        il.Method__c = method;
        insert il;
    }
}