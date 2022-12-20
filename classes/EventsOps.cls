global class EventsOps {

	global class EventInfo {
		webservice String eventType;
		webservice String projectId;
        webservice String userEmail;
		webservice String userId;
		webservice String userRole; 
    }

	webService static String newUserEvent(EventInfo newUserInfo) {
		return addNewUser(newUserInfo);
	}

	webService static String removeUserEvent(EventInfo removeUserInfo) {
		return updateProjectUser(removeUserInfo);
	}

	webService static String changeRoleEvent(EventInfo changeRoleInfo) {
		return updateProjectUser(changeRoleInfo);
	}

	webService static String freezeUserEvent(EventInfo freezeInfo) {
		return updateProjectUser(freezeInfo);
	}

	webService static String unfreezeUserEvent(EventInfo unfreezeInfo) {
		return updateProjectUser(unfreezeInfo);
	}

	// add new user 
	public static String addNewUser(EventInfo info) {
        IntegrationLog__c il = Utils.createIntegrationLog('EventsOps', 'addNewUser', JSON.serialize(info));
        Datetime now = Datetime.now();
        ApiResponseDTO response = new ApiResponseDTO();
        System.Savepoint sp = Database.setSavepoint();

        try{
            String pbNewUserEmail = info.userEmail.toLowerCase();
            Double userId = Double.valueOf(info.userId);

            List<Project__c> existingProjects = [SELECT Account_Name__c, Space_Type__c
                                                    FROM Project__c
                                                    WHERE Project_PB_ID__c = :info.projectId];
            Utils.checkEmptyUniqueList(existingProjects, 'projectId: ' + info.projectId);
            Project__c existingProject = existingProjects[0];
            il.Description__c += '\n- Project found. id: ' + existingProject.Id;
            
            List<Project_User__c> projectUsers = [SELECT Id 
                                                    FROM Project_User__c
                                                    WHERE Project__c = :existingProjects[0].Id AND Contact__r.User_PB_ID__c = :Double.valueOf(info.userId)];

            if(!projectUsers.isEmpty()){
                il.Description__c += '\n- ProjectUser found. count: ' + projectUsers.size();
                Project_User__c projectUser = projectUsers[0];
                ProjectUser_SERV.setValueForProjectUser(projectUser, null, info.userRole, null, null, null, now, 'Current', true);
                update projectUser;
                il.Description__c += '\n- ProjectUser updated. id: ' + projectUser.Id;
            } else {
                // new user lead creation
                Lead newUserLead = Lead_SERV.createOrUpdateTrialUser(existingProjects[0].Space_Type__c, pbNewUserEmail, userId, now, il);
                il.Description__c += '\n- Actual User Lead. id: ' + newUserLead.Id;

                List<Contact> contacts = [SELECT AccountId
                                            FROM Contact
                                            WHERE User_PB_ID__c = :userId];
                il.Description__c += '\n- Contacts found by userId. count: ' + contacts.size();
                if(contacts.isEmpty()){
                    contacts = [SELECT AccountId 
                                FROM Contact
                                WHERE User_PB_ID__c = null AND Email = :pbNewUserEmail];
                    il.Description__c += '\n- Contacts found by email. count: ' + contacts.size();
                }          

                Id accountIdForConversion = existingProject.Account_Name__c;
                Id contactIdForConversion;
                
                if (!contacts.isEmpty()) {
                    Contact contactForConversion = contacts[0];
                    contactForConversion.Removed_From_Project_Date__c = null;
                    contactForConversion.User_PB_ID__c = userId;
                    update contactForConversion;

                    contactIdForConversion = contactForConversion.Id;
                    accountIdForConversion = contactForConversion.AccountId;
                }
                il.Description__c += '\n- Data for conversion. contactId: ' + contactIdForConversion + ', accountId: ' + accountIdForConversion;
                
                Contact newUserContact = Lead_SERV.convertLead(newUserLead, accountIdForConversion, contactIdForConversion);
                il.Description__c += '\n- Contact after conversion. id: ' + newUserContact.Id;

                // new project user creation
                Project_User__c newProjectUser = new Project_User__c();
                ProjectUser_SERV.setValueForProjectUser(newProjectUser, pbNewUserEmail, info.userRole, existingProject, newUserContact, false, now, 'Current', true);
                insert newProjectUser;
                il.Description__c += '\n- New ProjectUser inserted. id: ' + newProjectUser.Id;
            }     

            ApiResponseDTO.createResponse(response, ApiConstants.CODE_SUCCESS, ApiConstants.MSG_SUCCESS_USER_NEW, null, null, null );
        } catch(ProductboardException e) {
            ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null );
            Database.rollback(sp);
        } catch(Exception e) {
            il.Description__c += '\nFAILED - StackTrace: '+ e.getStackTraceString();
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_FAILED_GENERAL, ApiConstants.MSG_FAILED_GENERAL, il, e.getMessage(), null );
            Database.rollback(sp); 
        } finally { 
            Utils.updateIntegrationLog(il, response);
            ApiRequestController.logApiRequest(JSON.serialize(info), 'EventInfo', il.Success__c, il.Method__c, il.Description__c, response);
        }   

        return JSON.serialize(response);
    }


    public static String updateProjectUser(EventInfo info){
        Integrationlog__c il = Utils.createIntegrationLog('EventsOps', info.eventType, JSON.serialize(info));
        ApiResponseDTO response = new ApiResponseDTO();
        System.Savepoint sp = Database.setSavepoint();

        try{
            // gets existing project, contract, account and asset
            List<Project__c> projects = [SELECT Id
                                        FROM Project__c
                                        WHERE Project_PB_ID__c = :info.projectId];
            Utils.checkEmptyUniqueList(projects, 'projectId: ' + info.projectId);
            Project__c project = projects[0];
            il.Description__c += '\n- Project found. id: ' + project.Id;

            // gets project user
            List<Project_User__c> projectUsers = [SELECT Id 
                                                FROM Project_User__c
                                                WHERE Project__c = :project.Id AND Contact__r.User_PB_ID__c = :Double.valueOf(info.userId)];
            /*temp commented due to inaccureate date - substitue by FORloop
            Utils.checkEmptyUniqueList(projectUsers, '');
            Project_User__c projectUser = projectUsers[0];
            il.Description__c += '\n- ProjectUser found. id: ' + projectUser.id;
            
            if (info.eventType == 'changeUserRole'){
                projectUser.Project_Role__c = info.userRole;
            }else if (info.eventType == 'disableUser' || info.eventType == 'removeUser'){
                projectUser.Active__c = false;
            }else if (info.eventType == 'activateUser'){
                projectUser.Active__c = true;
            }
            update projectUser;
            */
            //temp Substitution start
            if(projectUsers.isEmpty()) {
                String newUserResponse = addNewUser(info);
                il.Description__c += '\n- AddNewUser invoked. response: ' + newUserResponse;
                projectUsers = [SELECT Id 
                                FROM Project_User__c
                                WHERE Project__c = :project.Id AND Contact__r.User_PB_ID__c = :Double.valueOf(info.userId)];
                il.Description__c += '\n- ProjectUser found. count: ' + projectUsers.size();
            }

            String responseMessage;
            for(Project_User__c projectUser : projectUsers){
                il.Description__c += '\n- ProjectUser found. id: ' + projectUser.id;
                
                if (info.eventType == 'changeUserRole'){
                    ProjectUser_SERV.setValueForProjectUser(projectUser, null, info.userRole, null, null, null, null, 'Current', true);
                    responseMessage = ApiConstants.MSG_SUCCESS_USER_CHANGE;
                }else if (info.eventType == 'disableUser'){
                    ProjectUser_SERV.setValueForProjectUser(projectUser, null, null, null, null, null, null, 'Cancelled', false);
                    responseMessage = ApiConstants.MSG_SUCCESS_USER_FREEZE;
                }else if(info.eventType == 'removeUser'){
                    ProjectUser_SERV.setValueForProjectUser(projectUser, null, null, null, null, null, null, 'Cancelled', false);
                    responseMessage = ApiConstants.MSG_SUCCESS_USER_REMOVE;
                }else if (info.eventType == 'activateUser'){
                    ProjectUser_SERV.setValueForProjectUser(projectUser, null, null, null, null, null, null, 'Current', true);
                    responseMessage = ApiConstants.MSG_SUCCESS_USER_UNFREEZE;
                }
            }
            update projectUsers;
            //temp substitution edn
            il.Description__c += '\n- ProjectUser updated.';

            ApiResponseDTO.createResponse(response, ApiConstants.CODE_SUCCESS, responseMessage, null, null, null );
        } catch(ProductboardException e) {
            ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null );
            Database.rollback(sp);
        } catch(Exception e) {
            il.Description__c += '\nFAILED - StackTrace: '+ e.getStackTraceString();
            ApiResponseDTO.createResponse(response, ApiConstants.CODE_FAILED_GENERAL, ApiConstants.MSG_FAILED_GENERAL, il, e.getMessage(), null );
            Database.rollback(sp); 
        } finally { 
            Utils.updateIntegrationLog(il, response);
            ApiRequestController.logApiRequest(JSON.serialize(info), 'EventInfo', il.Success__c, il.Method__c, il.Description__c, response);
        }  

         return JSON.serialize(response);
    }

}