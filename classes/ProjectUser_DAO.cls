public class ProjectUser_DAO {

	public static List<Project_User__c> getProjectUsersByLeadEmail(String email) {
		List<Project_User__c> projectUsers = [SELECT Active__c, /*Cancelled__c,*/ CreatedById, CreatedDate, Email__c,
		                                      Id, IsDeleted, LastActivityDate, LastModifiedById, LastModifiedDate,
		                                      LastReferencedDate, LastViewedDate, Lead__c, Master_User__c, Name,
		                                      Project_Role__c, Project__c, SystemModstamp, Trial_Usage_Score__c,
		                                      User_Added_Date__c, User_Removed_Date__c, User_Score__c, User_Status__c, Contact__c
		                                      FROM Project_User__c
		                                      WHERE Name = :email];
		return projectUsers;
	}

	public static List<Project_User__c> getProjectUsersByProjectId(Id projectId) {
		List<Project_User__c> projectUsers = [SELECT Active__c, /*Cancelled__c,*/ CreatedById, CreatedDate, Email__c,
		                                      Id, IsDeleted, LastActivityDate, LastModifiedById, LastModifiedDate,
		                                      LastReferencedDate, LastViewedDate, Lead__c, Master_User__c, Name,
		                                      Project_Role__c, Project__c, SystemModstamp, Trial_Usage_Score__c,
		                                      User_Added_Date__c, User_Removed_Date__c, User_Score__c, User_Status__c, Contact__c
		                                      FROM Project_User__c
		                                      WHERE Project__c = :projectId];
		return projectUsers;
	}

	public static List<Project_User__c> getProjectUsersByProjectId2(Id projectId) {
		List<Project_User__c> projectUsers = [SELECT Active__c, /*Cancelled__c,*/ CreatedById, CreatedDate, Email__c,
		                                      Id, IsDeleted, LastActivityDate, LastModifiedById, LastModifiedDate,
		                                      LastReferencedDate, LastViewedDate, Lead__c, Master_User__c, Name,
		                                      Project_Role__c, Project__c, SystemModstamp, Trial_Usage_Score__c,
		                                      User_Added_Date__c, User_Removed_Date__c, User_Score__c, User_Status__c, Contact__c,
											  PB_Account_Searched__c, Updated__c
		                                      FROM Project_User__c
		                                      WHERE Project__c = :projectId];
		if (projectUsers.isEmpty()) {
			throw new ProductboardException('No Project users were found for project Id: [' + projectId + ']', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		return projectUsers;
	}

	public static List<Project_User__c> getProjectUsersByListOfProjectIds(List<Id> projectIds) {
		List<Project_User__c> projectUsers = [SELECT Active__c, /*Cancelled__c,*/ CreatedById, CreatedDate, Email__c,
		                                      Id, IsDeleted, LastActivityDate, LastModifiedById, LastModifiedDate,
		                                      LastReferencedDate, LastViewedDate, Lead__c, Master_User__c, Name,
		                                      Project_Role__c, Project__c, SystemModstamp, Trial_Usage_Score__c,
		                                      User_Added_Date__c, User_Removed_Date__c, User_Score__c, User_Status__c, Contact__c
		                                      FROM Project_User__c
		                                      WHERE Project__c IN :projectIds];
		if (projectUsers.isEmpty()) {
			throw new ProductboardException('No Project users were found for project Ids: [' + projectIds + ']', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		} 
		return projectUsers;
	}

	public static List<Project_User__c> getProjectUsersWithLimit(Integer pusLimit) {
		List<Project_User__c> projectUsers = [SELECT Active__c, /*Cancelled__c,*/ CreatedById, CreatedDate, Email__c,
		                                      Id, IsDeleted, LastActivityDate, LastModifiedById, LastModifiedDate,
		                                      LastReferencedDate, LastViewedDate, Lead__c, Master_User__c, Name,
		                                      Project_Role__c, Project__c, SystemModstamp, Trial_Usage_Score__c,
		                                      User_Added_Date__c, User_Removed_Date__c, User_Score__c, User_Status__c, Contact__c,
		                                      SystemAccScriptUpdated__c
		                                      FROM Project_User__c
		                                      WHERE Contact__c != null
		                                      //AND Master_User__c = false
		                                      AND Project__c != null
		                                      AND SystemAccScriptUpdated__c = false
		                                      LIMIT :pusLimit];
		if (projectUsers.isEmpty()) {
			throw new ProductboardException('No Project users were found for update.', 1);
		}
		return projectUsers;
	}

	public static List<Project_User__c> getProjectUsersWithLimit(List<Id> ids, Integer pusLimit) {
		List<Project_User__c> projectUsers = [SELECT Active__c, /*Cancelled__c,*/ CreatedById, CreatedDate, Email__c,
		                                      Id, IsDeleted, LastActivityDate, LastModifiedById, LastModifiedDate,
		                                      LastReferencedDate, LastViewedDate, Lead__c, Master_User__c, Name,
		                                      Project_Role__c, Project__c, SystemModstamp, Trial_Usage_Score__c,
		                                      User_Added_Date__c, User_Removed_Date__c, User_Score__c, User_Status__c, Contact__c,
		                                      SystemAccScriptUpdated__c
		                                      FROM Project_User__c
		                                      WHERE Id IN :ids
		                                      LIMIT :pusLimit];
		if (projectUsers.isEmpty()) {
			throw new ProductboardException('No Project users were found for update.', 1);
		}
		return projectUsers;
	}
    /*
	public static List<Project_User__c> getUsersOfPayingProjectByContact(Id conId) {
		List<Project_User__c> pusOfPayingProject = [SELECT Active__c,  CreatedById, CreatedDate, Email__c,
													Id, IsDeleted, LastActivityDate, LastModifiedById, LastModifiedDate,
													LastReferencedDate, LastViewedDate, Lead__c, Master_User__c, Name,
													Project_Role__c, Project__c, SystemModstamp, Trial_Usage_Score__c,
													User_Added_Date__c, User_Removed_Date__c, User_Score__c, User_Status__c, Contact__c
													FROM Project_User__c
													WHERE (Project__r.Current_Backend_Stage__c= 'Active Contract'OR
															Project__r.Current_Backend_Stage__c= 'Active Subscription' OR
															Project__r.Current_Backend_Stage__c= 'Subspace') AND
															Contact__c = :conId AND Active__c = true];
	
		return pusOfPayingProject;
	}
    */


	public static void insertProjectUser(Project_User__c prju) {

		try {
			insert prju;
		}
		catch(DmlException e) {
			throw new ProductboardException('Insert Project User ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}

	public static void updateProjectUser(Project_User__c prju) {

		try {
			update prju;
		}
		catch(DmlException e) {
			throw new ProductboardException('Update Project User ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}

	}

	public static void updateProjectUserList(List<Project_User__c> prju) {

		try {
			update prju;
		}
		catch(DmlException e) {
			throw new ProductboardException('Update Project User ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}

	}


}