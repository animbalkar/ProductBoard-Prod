global class updatePayingCustomerOnCurrentContacts implements Database.Batchable<SObject> {
	
	global updatePayingCustomerOnCurrentContacts() {
		
	}
	
	/**
	 * @description gets invoked when the batch job starts
	 * @param context contains the job ID
	 * @returns the record set as a QueryLocator object that will be batched for execution
	 */ 
	global Database.QueryLocator start(Database.BatchableContext context) {
		List<Project_User__c> activePusOnPayingProject =  [select Contact__r.id from Project_User__c WHERE Active__c=true AND Project__r.status__c='Paying' AND Project__r.cancelled__c=false AND Project__r.deleted__c=false];
		List<id> payingContactId = new List<id>();
		for (project_user__c pu : activePusOnPayingProject) {
			payingContactId.add(pu.contact__r.id);
		}
		String query = 'Select Paying_Customer_A__c from contact where id IN :payingContactId AND Paying_Customer_A__c= false';
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
			c.Paying_Customer_A__c = true;	
			c.Paying_Customer_A_Last_Update__c = 'Batch, new value: true ' + Datetime.now();
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