global class UpdatePayingCustomerOnContact_BATCH implements Database.Batchable<SObject> {
	
	private string phase; //phase1 - set all contact to from true to false, phase 2 set paying to TRUE
	private Boolean newValue;

	global UpdatePayingCustomerOnContact_BATCH(string phaseFromTrigger) {
		phase = phaseFromTrigger;
		if(phase == 'phase1'){
			newValue = false;
		} else if(phase == 'phase2'){
			newValue = true;
		}
	}
	
	/**
	 * @description gets invoked when the batch job starts
	 * @param context contains the job ID
	 * @returns the record set as a QueryLocator object that will be batched for execution
	 */ 
	global Database.QueryLocator start(Database.BatchableContext context) {
		String query;

		if(phase == 'phase1'){
		//set all true to false
			query = 'SELECT Paying_Customer_A__c,Paying_Customer_A_Last_Update__c FROM contact WHERE Paying_Customer_A__c = true';
		} else if (phase == 'phase2'){
		//change paying to true
			List<Project_User__c> activePusOnPayingProject = [SELECT Contact__r.id 
															FROM Project_User__c 
															WHERE (Project__r.Current_Backend_Stage__c = 'Active Contract' OR
																	Project__r.Current_Backend_Stage__c = 'Active Subscription' OR
																	Project__r.Current_Backend_Stage__c = 'Subspace')];
			List<id> payingContactId = new List<id>();
			for (project_user__c pu : activePusOnPayingProject) {
				payingContactId.add(pu.contact__r.id);
			}
			query = 'SELECT Paying_Customer_A__c,Paying_Customer_A_Last_Update__c FROM contact WHERE id IN :payingContactId';
		}

		return Database.getQueryLocator(query);
	}

	/**
	 * @description gets invoked when the batch job executes and operates on one batch of records. Contains or calls the main execution logic for the batch job.
	 * @param context contains the job ID
	 * @param scope contains the batch of records to process.
	 */ 
   	global void execute(Database.BatchableContext context, List<Contact> scope) {
		List<Contact> conToUpdate = scope;
		for (Contact c : conToUpdate) {
			c.Paying_Customer_A__c = newValue;	
			c.Paying_Customer_A_Last_Update__c = 'Batch, New value: ' + newValue + ', TimeStamp: ' + Datetime.now();
		}
		update conToUpdate;

	}
	
	/**
	 * @description gets invoked when the batch job finishes. Place any clean up code in this method.
	 * @param context contains the job ID
	 */ 
	global void finish(Database.BatchableContext context) {
	
	}
}