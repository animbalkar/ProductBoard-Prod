public class ProjectUser_SERV {

	public static void setValueForProjectUser(Project_User__c projectUser,
												String userEmail,
												String role,
												Project__c project,
												Contact userContact,
												Boolean isMaster,
												Datetime now,
												String userStatus,
												Boolean isActive
	) {

		if(userEmail != null) projectUser.Name = userEmail;
		if(role != null) projectUser.Project_Role__c = role;
		if(project != null) projectUser.Project__c = project.Id;
		if(userContact != null) projectUser.Contact__c = userContact.Id;
		if(isActive != null) projectUser.Active__c = isActive;
		if(userStatus != null) projectUser.User_Status__c = userStatus;
		if(now != null) projectUser.User_Added_Date__c = now;
		if(isMaster != null) projectUser.Master_User__c = isMaster;
		if(userStatus == 'Cancelled') projectUser.User_Removed_Date__c = now;
		if(userStatus == 'Current') projectUser.User_Removed_Date__c = null;
	}

}