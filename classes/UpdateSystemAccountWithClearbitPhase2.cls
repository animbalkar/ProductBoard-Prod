@RestResource(urlMapping = '/migration/systemAccountUpdate/phase2/*')
global with sharing class UpdateSystemAccountWithClearbitPhase2 {

	/*
	 *
	 *  Update system account with Clearbit account if exists
	 *
	 *  PHASE 2
	 *  Update on PROJECT USER CONTACTS and CONTARACTS
	 *
	 */

	@HttpPut
	global static Map<String, String> updateWithClearbitAccount(Integer projectUsersLimit) {
		Map<String, String> result = new Map<String, String> ();

		try {
			// stores records to update
			List<Contact> puContactsToUpdate = new List<Contact> ();
			List<Opportunity> oppsToUpdate = new List<Opportunity> ();

			// set pu contacts and opportunities for update
			UpdateSystemAccountWithClearbit_SERV.updateAccOnPuContactsAndProjectOpps(puContactsToUpdate,oppsToUpdate,projectUsersLimit);


			// update all master contacts and projects
			update puContactsToUpdate;
			update oppsToUpdate;

			// return result
			UpdateSystemAccountWithClearbit_SERV.setSuccessResultPhase2(result,puContactsToUpdate, oppsToUpdate);
		} catch(Exception e) {
			UpdateSystemAccountWithClearbit_SERV.setErrorResultPhase2(result, e);			
		}
		return result;
	}

	

}