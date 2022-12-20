@isTest
private class MigrationTest {
    
    static testMethod void testOnUpdate() {
        // set records
        Project__c project = new Project__c();
        project.Name = 'Test project';
        project.Project_PB_ID__c = '123'; 
        project.Active__c = false;
		project.Account_Name__c = DataFactory_TEST.createTestAccount().Id;
        insert project;
        
        Project_User__c user1 = new Project_User__c();
        user1.Name = 'Test Name';
        user1.Project__c = project.Id;
        user1.Active__c = false;
        insert user1;
        
        Project_User__c user2 = new Project_User__c();
        user2.Name = 'Test Name';
        user2.Project__c = project.Id;
        user2.Active__c = false;
        insert user2;
        
        // call test
        Migration.updateProjectUsers();
        
        // get records
        List<Project_User__c> projectUsers = [Select Id,User_Status__c, Active__c, User_Added_Date__c from Project_User__c where Id =:user1.Id or Id =:user2.Id]; 
        Project__c updatedProject = [Select Id, Created_Date__c, Active__c, Cancelled__c from Project__c where Id =:project.Id];
        
        // assert
        for (Project_User__c eachProjectUser : projectUsers) {
        	System.assertEquals('Current', eachProjectUser.User_Status__c);
            System.assertEquals(true, eachProjectUser.Active__c);
            System.assertNotEquals(null, eachProjectUser.User_Added_Date__c);
        }
        System.assertEquals(true, updatedProject.Active__c);
        System.assertNotEquals(null, updatedProject.Created_Date__c);
    }
    
}