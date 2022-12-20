global class ManSearchedProjectAccUpdate implements Database.Batchable<SObject> {

	global ManSearchedProjectAccUpdate() {

	}

	/**
	 * @description gets invoked when the batch job starts
	 * @param context contains the job ID
	 * @returns the record set as a QueryLocator object that will be batched for execution
	 */
	global Database.QueryLocator start(Database.BatchableContext context) {
		return Database.getQueryLocator('SELECT Name, Id, Account_Name__c, PB_Account_Name__c, Account_Not_Found__c, Updated__c, PB_Account_Searched__c  FROM Project__c where PB_Account_Name__c != null AND Updated__c = false');
	}

	/**
	 * @description gets invoked when the batch job executes and operates on one batch of records. Contains or calls the main execution logic for the batch job.
	 * @param context contains the job ID
	 * @param scope contains the batch of records to process.
	 */
	global void execute(Database.BatchableContext context, List<Project__c> scope) {
		/*List<Project__c> projectsToUpdate = new List<Project__c> ();
		List<Contract> contractsToUpdate = new List<Contract> ();
		List<Asset> assetsToUpdate = new List<Asset> ();

		Integer numberOfUpdatedProjects = 0;
		Integer numberOfUpdatedContracts = 0;
		Integer numberOfUpdatedAssets = 0;



		List<Id> projectIds = new List<Id> ();
		for (Project__c pr : scope) {
			projectIds.add(pr.Id);
		}

		List<Contract> contracts = Contract_DAO.getContractsByListOfProjectIds(projectIds); // získej contracty na základě listu projectIds  - možná už tam taková metoda je
		List<Id> contractIds = new List<Id> ();
		for (Contract c : contracts) {
			contractIds.add(c.Id);
		}

		List<Asset> assets = Asset_DAO.getAssetsByListOfContractIds(contractIds); // získej assety na základě listu contractIds  - možná už tam taková metoda je

		for (Project__c proj : scope) {
			proj.PB_Account_Searched__c = true;
			proj.Updated__c = true;
			if (proj.PB_Account_Name__c.equals('Customers_system_account')) {
				proj.Account_Not_Found__c = true;
			} else {
				Account accToUpdate = Account_DAO.getAccountByName(proj.PB_Account_Name__c);
				proj.Account_Name__c = accToUpdate.Id;

				List<Contract> projectContracts = ManuallyPbProjectAccountUpdate_SERV.findContractByProjectId(proj.Id, contracts);

				Contract projectContract = null;
				for (Contract c : projectContracts) {
					projectContract = c;
					projectContract.AccountId = accToUpdate.Id;
					contractsToUpdate.add(projectContract);
					numberOfUpdatedContracts++;
				}

				if (projectContract != null) {
					List<Asset> assetsToFind = ManuallyPbProjectAccountUpdate_SERV.findAssetsByContractId(projectContract.Id, assets);
					for (Asset a : assetsToFind) {
						a.AccountId = accToUpdate.Id;
						assetsToUpdate.add(a);
						numberOfUpdatedAssets++;
					}
				}
			}
			numberOfUpdatedProjects++;
			projectsToUpdate.add(proj);
		}

		System.debug('Number of updated projects: ' + numberOfUpdatedProjects);
		System.debug('Number of updated contracts: ' + numberOfUpdatedContracts);
		System.debug('Number of updated assets: ' + numberOfUpdatedAssets);

		update projectsToUpdate;
		update contractsToUpdate;
		update assetsToUpdate;
        */
	}

	/**
	 * @description gets invoked when the batch job finishes. Place any clean up code in this method.
	 * @param context contains the job ID
	 */
	global void finish(Database.BatchableContext context) {

	}
}