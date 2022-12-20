public class DeleteProject_SERV {

	public static void markProjectAndPusAsDeleted(Project__c deletedProject, String hash, IntegrationLog__c il) {		
		Product2 projectPlan = null;
		if(deletedProject.Product_Name__c != null) projectPlan = Product2_DAO.getProduct2ById2(deletedProject.Product_Name__c);
		il.Description__c += '\n- ProjectPlan.';
		
		if (projectPlan == null || projectPlan.Name.equals('Trial') || deletedProject.Cancelled__c == true) {
			setProjectAsDeleted(deletedProject, hash, il);
			setProjectUsersAsDeleted(deletedProject, il);
		} else {
            il.Description__c += '\nFAILED - Project is not in Trial or has an active subscription. Project was not deleted!';
            throw new ProductboardException(ApiConstants.MSG_FAILED_PROJECT_NOT_DELETED, ApiConstants.CODE_FAILED_PROJECT_NOT_DELETED);
        }
	}
	
	public static void setProjectAsDeleted(Project__c pr, String hash, IntegrationLog__c il) {
		pr.Deleted__c = true;		
		String oldName = pr.Name.substringBefore('.');		
		pr.Name = oldName + '-deleted-' + hash + '.productboard.com';
		pr.Team_URL__c = oldName + '-deleted-' + hash + '.productboard.com';	
		pr.Active__c = false;
		update pr;
		il.Description__c += '\n- Project marked as deleted.';
	}

	public static void setProjectUsersAsDeleted(Project__c pr, IntegrationLog__c il) {
		List<Project_User__c> projectUsers = ProjectUser_DAO.getProjectUsersByProjectId2(pr.Id);
		List<Project_User__c> puList = new List<Project_User__c>();
		for (Project_User__c pu : projectUsers) {
			pu.User_Status__c = 'Deleted';
			pu.Active__c = false;
			puList.add(pu);
			il.Description__c += '\n- ProjectUser to delete. id: ' + pu.Id;
		}
		update puList;
		il.Description__c += '\n- ProjectUsers marked as deleted';
	}

	

}