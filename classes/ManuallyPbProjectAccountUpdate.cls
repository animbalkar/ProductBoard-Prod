@RestResource(urlMapping = '/migration/pbAccountEnrichment/phase1/*')
global with sharing class ManuallyPbProjectAccountUpdate  {

	/*
	 *
	 *  Update system account with account name that is stored on Project in "PB_Account_Name__c"
	 *
	 *  PHASE 1 
	 *  Update account on PROJECTS, CONTRACTS, ASSETS
	 *
	 */

	@HttpPatch
	global static AsyncApexJob updateWithPbManualAccount(Integer batchSize) {
		ManSearchedProjectAccUpdate projects = new ManSearchedProjectAccUpdate();
		Id jobId = database.executebatch(projects,batchSize);		
		
		AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :jobId];

		return job;
		/*
		List<String> projectNamesList = ManuallyPbProjectAccountUpdate_SERV.getProjectNames();

		List<Project__c> projectsToUpdate = new List<Project__c>();
		List<Contract> contractsToUpdate = new List<Contract>();
		List<Asset> assetsToUpdate = new List<Asset>();

		Integer numberOfUpdatedProjects = 0;
		Integer numberOfUpdatedContracts = 0;
		Integer numberOfUpdatedAssets = 0;


		List<Project__c> projects = Project_DAO.getProjectsWithNamesWithLimit(projectNamesList,projectLimit);

		List<Id> projectIds = new List<Id>();
		for(Project__c pr : projects) {
			projectIds.add(pr.Id);
		}

		List<Contract> contracts = Contract_DAO.getContractsByListOfProjectIds(projectIds);// získej contracty na základě listu projectIds  - možná už tam taková metoda je
		List<Id> contractIds = new List<Id>();
		for(Contract c : contracts) {
			contractIds.add(c.Id);
		}

		List<Asset> assets = Asset_DAO.getAssetsByListOfContractIds(contractIds); // získej assety na základě listu contractIds  - možná už tam taková metoda je

		for(Project__c proj : projects) {
			proj.PB_Account_Searched__c = true;		
			proj.Updated__c = true;
			if(proj.Account_Name__c=='Customers_system_account'){
				proj.Account_Not_Found__c = true;
			} else {		
				String accountNameToUpdate = proj.PB_Account_Name__c;
				Account accToUpdate = Account_DAO.getAccountByName(accountNameToUpdate);
				proj.Account_Name__c = 	accToUpdate.Id;				
				Contract projectContract = ManuallyPbProjectAccountUpdate_SERV.findContractByProjectId(proj.Id, contracts);
				projectContract.AccountId = accToUpdate.Id;
				contractsToUpdate.add(projectContract);
				numberOfUpdatedContracts++;

				List<Asset> assetsToFind = ManuallyPbProjectAccountUpdate_SERV.findAssetsByContractId(projectContract.AccountId, assets);
				for(Asset a : assetsToFind){
					a.AccountId = accToUpdate.Id;
					assetsToUpdate.add(a);
					numberOfUpdatedAssets++;
				}
			}
			numberOfUpdatedProjects++;	
			projectsToUpdate.add(proj);			
		}

		update projectsToUpdate;
		update contractsToUpdate;
		update assetsToUpdate;
		*/

		
		
	}

}