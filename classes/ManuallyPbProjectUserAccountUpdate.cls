@RestResource(urlMapping = '/migration/pbAccountEnrichment/phase2')
global with sharing class ManuallyPbProjectUserAccountUpdate  {
	
	@HttpPatch
	global static AsyncApexJob updateWithPbManualAccount(Integer batchSize) {
		ManSearchedProjectUserAccUpdate projectUsers = new ManSearchedProjectUserAccUpdate();
		Id jobId = database.executebatch(projectUsers,batchSize);		
		
		AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :jobId];

		return job;
		
		/*
		Integer numberOfUpdatedContacts = 0;
		Integer numberOfUpdatedProjectUsers = 0;
		
		List<Id> projectUserIds = ManuallyPbProjectUserAccountUpdate_SERV.getProjectUserIds();

		List<Project_User__c> projectUsers = ProjectUser_DAO.getProjectUsersWithLimit(projectUserIds,projectUsersLimit);
		List<Contact> contacts = Contact_DAO.getContactsByPbUsers(projectUsers);

		Account a;
		List<Contact> contactsToUpdate = new List<Contact>();
		List<Project_User__c> projectUsersToUpdate = new List<Project_User__c>();
		Contact c;
		for(Project_User__c pu : projectUsers){
			pu.PB_Account_Searched__c = true;
			pu.Updated__c = true;
			if(pu.PB_Account_Name__c=='Customers_system_account'){
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
		update projectUsersToUpdate;
		update contactsToUpdate;
		return numberOfUpdatedContacts + numberOfUpdatedProjectUsers;
		*/
	}
}