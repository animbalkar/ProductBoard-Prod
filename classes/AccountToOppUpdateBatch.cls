global class AccountToOppUpdateBatch implements Database.Batchable<SObject> {

    private Map<id, String> accIdWithOppValueMap;

	global AccountToOppUpdateBatch(Map<id, String> myMap) {
		accIdWithOppValueMap = myMap;
        
	}

	/**
	 * @description gets invoked when the batch job starts
	 * @param context contains the job ID
	 * @returns the record set as a QueryLocator object that will be batched for execution
	 */ 
	global Database.QueryLocator start(Database.BatchableContext context) {
		return Database.getQueryLocator([SELECT Related_Account_Apex_Trigger_Field__c, AccountId FROM Opportunity WHERE AccountId IN :accIdWithOppValueMap.keySet()]);
	}

	/**
	 * @description gets invoked when the batch job executes and operates on one batch of records. Contains or calls the main execution logic for the batch job.
	 * @param context contains the job ID
	 * @param scope contains the batch of records to process.
	 */ 
   	global void execute(Database.BatchableContext context, List<Opportunity> scope) {
        
        for(Opportunity opp : scope){
            opp.Related_Account_Apex_Trigger_Field__c = accIdWithOppValueMap.get(opp.AccountId);
        }
        update scope;
	}
	
	/**
	 * @description gets invoked when the batch job finishes. Place any clean up code in this method.
	 * @param context contains the job ID
	 */ 
	global void finish(Database.BatchableContext context) {
		
	}
}