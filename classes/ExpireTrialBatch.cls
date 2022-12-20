global class ExpireTrialBatch implements Database.Batchable<SObject> {
	
	global ExpireTrialBatch() {
		
	}
	
	/**
	 * @description gets invoked when the batch job starts
	 * @param context contains the job ID
	 * @returns the record set as a QueryLocator object that will be batched for execution
	 */ 
	global Database.QueryLocator start(Database.BatchableContext BC) {
		Date today = Date.today();
		Id trialId = Product2_DAO.getTrialProduct().Id;
        String query = 'SELECT Account_Name__c, Account_Not_Found__c, Active__c, Cancelled__c, Created_Date__c, Deleted__c, Description__c, End_Date__c, Health_status__c, Id, Master_User_Contact__c, Master_User_Lead__c, Name, Number_of_admins__c, Number_of_admins_editors__c, Number_of_contributors__c, Number_of_editors__c, Number_of_viewers__c, Opportunity__c, PB_Account_Name__c, PB_Account_Searched__c, Parent_Project__c, Product_Name__c, Project_Activation_Date__c, Project_PB_ID__c, Status__c, Team_URL__c, Total_Project_Score__c, Trial_End_Date__c, Type__c, Updated__c FROM Project__c WHERE Active__c = true AND Trial_End_Date__c < :today AND Deleted__c = false AND Product_Name__c = :trialId';
        return Database.getQueryLocator(query);
	}

	/**
	 * @description gets invoked when the batch job executes and operates on one batch of records. Contains or calls the main execution logic for the batch job.
	 * @param context contains the job ID
	 * @param scope contains the batch of records to process.
	 */ 
   	global void execute(Database.BatchableContext BC, List<Project__c> scope) {
	    List<Project__c> upProjects = new List<Project__c>();
		List<Id> oppsToUpdateIds = new List<Id>();
        for(Project__c project : scope) {
			 oppsToUpdateIds.add(project.Opportunity__c);
             project.Active__c = false;
			 upProjects.add(project);
        }
		List<Opportunity> oppsToUpdate = Opportunity_DAO.getOppsByListOfIds(oppsToUpdateIds);
		for(Opportunity opp : oppsToUpdate) {
			opp.StageName = 'Trial Expired';
		}

		update oppsToUpdate;
		update upProjects;
	}
	
	/**
	 * @description gets invoked when the batch job finishes. Place any clean up code in this method.
	 * @param context contains the job ID
	 */ 
	global void finish(Database.BatchableContext BC) {
		
	}
}