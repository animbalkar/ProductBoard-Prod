@RestResource(urlMapping = '/migration/systemAccountUpdate/phase1/*')
global with sharing class UpdateSystemAccountWithClearbitPhase1 {

	/*
	 *
	 *  Update system account with Clearbit account if exists
	 *
	 *  PHASE 1 
	 *  Update on MASTER CONTACTS and PROJECTS
	 *
	 */

	@HttpPut
	global static Map<String, String> updateWithClearbitAccount(Integer contactLimit) {
		Map<String, String> result = new Map<String, String> ();
		String eachEmail;

		try {
			// stores records to update
			List<Contact> contactsToUpdate = new List<Contact> ();
			List<Project__c> projectsToUpdate = new List<Project__c> ();
			Integer insertedAccounts = 0;

			// set master contacts and projects for update
			insertedAccounts = UpdateSystemAccountWithClearbit_SERV.updateAccountOnMasterContactsAndProjects(contactsToUpdate,projectsToUpdate,insertedAccounts,eachEmail,contactLimit);

			// update all master contacts and projects
			update contactsToUpdate;
			update projectsToUpdate;

			// return result
			UpdateSystemAccountWithClearbit_SERV.setSuccessResultPhase1(result,contactsToUpdate, projectsToUpdate, insertedAccounts);
		} catch(Exception e) {
			UpdateSystemAccountWithClearbit_SERV.setErrorResultPhase1(result, e, eachEmail);			
		}
		return result;
	}

	

}