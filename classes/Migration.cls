global class Migration {
    
    webService static List<String> updateProjectUsers() {
        
        // variables set
		List<Project_User__c> allProjectUsers = [Select Id,User_Status__c, User_Added_Date__c, CreatedDate, Active__c from Project_User__c where User_Status__c = null LIMIT 50];
        List<Project__c> allProjects = [Select Id,Created_Date__c, CreatedDate, Active__c from Project__c where Created_Date__c = null LIMIT 50];
        Integer currentStatusUpdateNumber = 0;
        Integer userAddedDateNumber = 0;
        Integer userActiveNumber = 0;
        Integer projectCreatedDateNumber = 0;
        Integer projectActiveNumber = 0;
        List<String> returnMessage = new List<String>();
        
        // update on project user
        for(Project_User__c eachProjectUser : allProjectUsers) {
            if (eachProjectUser.User_Status__c == null) {
                eachProjectUser.User_Status__c = 'Current';
            	currentStatusUpdateNumber += 1;
            
            if (eachProjectUser.User_Added_Date__c == null) {
                eachProjectUser.User_Added_Date__c = eachProjectUser.CreatedDate;                            	
            	userAddedDateNumber += 1;
            }
            if (!eachProjectUser.Active__c) {
                eachProjectUser.Active__c = true;
            	userActiveNumber += 1;
            }            
            update eachProjectUser;
            }
        }
        returnMessage.add(currentStatusUpdateNumber+' project users updated on "User Status" field.');
        returnMessage.add(userAddedDateNumber+' project users updated on "User Added Date" field.');
        returnMessage.add(userActiveNumber+' project users updated on "Active" field.');
        
        // update on project
        for(Project__c eachProject : allProjects) {
            if (eachProject.Created_Date__c == null) {
                eachProject.Created_Date__c = eachProject.CreatedDate;                            	
            	projectCreatedDateNumber += 1;
            
            if (!eachProject.Active__c) {
                eachProject.Active__c = true;
            	projectActiveNumber += 1;
            }
            update eachProject;
            }
        }
        returnMessage.add(projectCreatedDateNumber+' project updated on "Created Date" field.');
        returnMessage.add(projectActiveNumber+' project updated on "Active" field.');
        
        return returnMessage;
    }
	/*
		List<String> returnMessage = new List<String>();
		returnMessage.add('Test API / zda vrati 404');
//throw new ProductboardException('Test API - vyhozeni vyjimky', 1);
		//Asset ass = [Select Id From Asset];
		return returnMessage;
		}
		*/
}