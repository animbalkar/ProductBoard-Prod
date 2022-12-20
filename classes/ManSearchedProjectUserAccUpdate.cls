global class ManSearchedProjectUserAccUpdate implements Database.Batchable<SObject> {
	
	global ManSearchedProjectUserAccUpdate() {
		
	}
	
	/**
	 * @description gets invoked when the batch job starts
	 * @param context contains the job ID
	 * @returns the record set as a QueryLocator object that will be batched for execution
	 */ 
	global Database.QueryLocator start(Database.BatchableContext context) {
		return Database.getQueryLocator('SELECT Name, Id, Contact__c, PB_Account_Name__c, Account_Not_Found__c, Updated__c, PB_Account_Searched__c  FROM Project_User__c where PB_Account_Name__c != null AND Updated__c = false');
	}

	/**
	 * @description gets invoked when the batch job executes and operates on one batch of records. Contains or calls the main execution logic for the batch job.
	 * @param context contains the job ID
	 * @param scope contains the batch of records to process.
	 */ 
   	global void execute(Database.BatchableContext context, List<Project_User__c> scope) {
		Integer numberOfUpdatedContacts = 0;
		Integer numberOfUpdatedProjectUsers = 0;				
		
		List<Contact> contacts = Contact_DAO.getContactsByPbUsers(scope);

		Account a;
		List<Contact> contactsToUpdate = new List<Contact>();
		List<Project_User__c> projectUsersToUpdate = new List<Project_User__c>();
		Contact c;
		for(Project_User__c pu : scope){
			pu.PB_Account_Searched__c = true;
			pu.Updated__c = true;
			if(pu.PB_Account_Name__c.equals('Customers_system_account')){
				pu.Account_Not_Found__c = true;
			} else {
				a = Account_DAO.getAccountByName(pu.PB_Account_Name__c);
				c = ManuallyPbProjectUserAccountUpdate_SERV.getContactByProjectUser(contacts,pu);
				c.AccountId = a.Id;
				contactsToUpdate.add(c);	
				numberOfUpdatedContacts++;
			}	
			projectUsersToUpdate.add(pu);	
			numberOfUpdatedProjectUsers++;
		}
		System.debug('Number of updated project users: '+ numberOfUpdatedProjectUsers);
		System.debug('Number of updated contacts: '+ numberOfUpdatedContacts);
		update projectUsersToUpdate;
		update contactsToUpdate;
	}
	
	/**
	 * @description gets invoked when the batch job finishes. Place any clean up code in this method.
	 * @param context contains the job ID
	 */ 
	global void finish(Database.BatchableContext context) {
		
	}
}