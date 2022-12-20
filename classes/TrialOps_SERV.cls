public class TrialOps_SERV {
	public static void setValuesForOpportunity(opportunity opp, TrialOps.LeadInfo info, Contact con, id projectId, Datetime now) {
		opp.Project__c = projectId;
		opp.AccountId = con.AccountId;
		opp.CloseDate = info.trialEndDate;
		opp.RecordTypeId = OpportunityRecordTypes.self_service;
		opp.Type = 'New Business';
		opp.Name = info.fullName + ', ' + now;
		opp.StageName = 'Free Trial';
	}

	public static void createOppContactRole(Id opp, Id con, Boolean isPrimary) {
		OpportunityContactRole role = new OpportunityContactRole();
		role.ContactId = con;
		role.OpportunityId = opp;
		role.IsPrimary = isPrimary;
		insert role;
	}

	public static Opportunity searchExistingOpenOpp(List<Opportunity> opps) {
		List<Opportunity> existingOpps = new List<Opportunity>();
		Opportunity existingOpp;
		for (Opportunity opp : opps) {
			if (!opp.IsClosed) {
				existingOpps.add(opp);
			}
		}
		if (existingOpps.size() > 1) {
			throw new ProductboardException('There are more open opps for the contact.', ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND);
		}
		if (existingOpps.size() == 1) {
			existingOpp = existingOpps.get(0);
		}
		return existingOpp;
	}

	public static void setValuesForTrialProject(Project__c newProject, TrialOps.LeadInfo info, Contact con, Datetime now) {
		newProject.Account_Name__c = con.AccountId;
		newProject.Name = info.teamUrl + '.productboard.com';
		newProject.Team_URL__c = info.teamUrl + '.productboard.com';
		newProject.Project_PB_ID__c = info.projectId;
		newProject.Active__c = true;
		newProject.Type__c = 'Self Service';
		newProject.Created_Date__c = now;
		newProject.Master_User_Contact__c = con.Id;

		if (info.activationDate != null) {
			newProject.Project_Activation_Date__c = info.activationDate;
		}

		if (info.company == null) {
			newProject.Company_Name_User_Input__c = 'Not provided by master user';
		} else {
			newProject.Company_Name_User_Input__c = '"' + info.company + '"';
		}

		if (info.spaceType == 'standalone_portal') {
			newProject.Space_Type__c = 'Standalone Portal';
		} else if (info.spaceType == 'starter') {
			newProject.Space_Type__c = 'Starter';
		} else {
			newProject.Space_Type__c = 'Main';
			newProject.Product_Name__c = [SELECT Id FROM Product2 WHERE Name = 'Trial'].Id;

			if (info.trialEndDate != null) {
				newProject.Trial_End_Date__c = info.trialEndDate;
			}
		}
	}

	public static void addProjectUsersAndConvertLeads(
		String spaceType,
		Contact con,
		Opportunity newOpp,
		String pbEmail,
		Map<Double, String> usersMap,
		Project__c newProject,
		Datetime now,
		IntegrationLog__c il
	) {
		List<Project_User__c> projectUserList = new List<Project_User__c>();
		List<Contact> contactsToUpdate = new List<Contact>();
		List<Event__c> eventsToInsert = new List<Event__c>();

		//create project master user
		Project_User__c newProjectMasterUser = new Project_User__c();
		ProjectUser_SERV.setValueForProjectUser(newProjectMasterUser, pbEmail, 'admin', newProject, con, true, now, 'Current', true);
		projectUserList.add(newProjectMasterUser);

		if (newOpp.Id != null && OppContactRole_DAO.getExistingOppContactRolesByOppId(newOpp.Id).isEmpty()) {
			createOppContactRole(newOpp.Id, con.Id, newProjectMasterUser.Master_User__c);
		}
		//max size of map is 3
		for (Double userId : usersMap.keySet()) {
			// create or update lead and convert with opp contact role
			Lead newUserLead = Lead_SERV.createOrUpdateTrialUser(spaceType, usersMap.get(userId), userId, now, il);
			List<Contact> contacts = getContactsForConversion(userId, usersMap.get(userId), il);
			Id accountIdForConversion = con.AccountId;
			Id convertedContactId;
			if (!contacts.isEmpty()) {
				accountIdForConversion = contacts[0].AccountId;
				convertedContactId = contacts[0].Id;
			}
			Contact convertedUserContact = Lead_SERV.convertLead(newUserLead, accountIdForConversion, convertedContactId);
			il.Description__c += '\n- User Contact. id: ' + convertedUserContact.Id;
			setProjectFields(newUserLead, convertedUserContact);
			contactsToUpdate.add(convertedUserContact);

			// create project user
			Project_User__c projectUser = new Project_User__c();
			ProjectUser_SERV.setValueForProjectUser(
				projectUser,
				usersMap.get(userId),
				'editor',
				newProject,
				convertedUserContact,
				false,
				now,
				'Current',
				true
			);
			projectUserList.add(projectUser);
		}
		update contactsToUpdate;
		il.Description__c += '\n- Contacts updated. count: ' + contactsToUpdate.size();

		insert projectUserList;
		il.Description__c += '\n- ProjectUsers inserted. count: ' + projectUserList.size();

		insert eventsToInsert;
	}

	public static void setProjectFields(Lead userLead, Contact userContact) {
		userContact.isTrial__c = userLead.IsTrial__c;
		userContact.Legacy_Lead_Source_March_2019__c = userLead.Legacy_Lead_Source_March_2019__c;
		userContact.Space_Type__c = userLead.Space_Type__c;

		if (userLead.Space_Type__c == 'Standalone Portal') {
			userContact.Portal_Source__c = userLead.Portal_Source__c;
			userContact.Portal_Request_DT__c = userLead.Portal_Request_DT__c;
		} else if (userLead.Space_Type__c == 'Starter') {
			userContact.Starter_Source__c = userLead.Starter_Source__c;
			userContact.Starter_Request_DT__c = userLead.Starter_Request_DT__c;
		} else {
			userContact.Trial_Source__c = userLead.Trial_Source__c;
			userContact.Trial_End_Date__c = userLead.Trial_End_Date__c;
			userContact.Trial_Request_DT__c = userLead.Trial_Request_DT__c;
		}
	}

	public static List<Contact> getContactsForConversion(Double userId, String userEmail, IntegrationLog__c il) {
		List<Contact> cons = [SELECT AccountId FROM Contact WHERE User_PB_ID__c = :userId];
		il.Description__c += '\n- Contact found by id. count: ' + cons.size();
		if (cons.isEmpty()) {
			cons = [SELECT AccountId FROM Contact WHERE Email = :userEmail];
			il.Description__c += '\n- Contact found by email. count: ' + cons.size();
		}
		return cons;
	}

	public static void updateProjectToStarter(Project__c project) {
		Product2 starterProduct = Product2_DAO.getStarterProduct();
		project.Space_Type__c = 'Starter';
		project.Product_Name__c = starterProduct.Id;
		project.Trial_End_Date__c = null;
		project.Price_Book__c = null;
		project.Name = createStarterProjectName(project.Name);
		Project_DAO.updateProject(project);
	}

	private static String createStarterProjectName(String oldName) {
		String newName;
		if (oldName.contains('-starter')){
			newName = oldName;
		} else {
			newName = oldName.replace('.productboard.com', '') + '-starter.productboard.com';
		}
		return newName;
	}

	public static void updateProjectToTrial(Project__c project, Id oppId, Datetime now){
		Product2 trialProduct = Product2_DAO.getTrialProduct();
		project.Opportunity__c = oppId;
		project.Space_Type__c = 'Main';
		project.Product_Name__c = trialProduct.Id;
		project.Trial_End_Date__c = now.addDays(14).date();
		project.Name = project.Name.replace('-starter', '');
		updateProjectUsers(project, now);
		Project_DAO.updateProject(project);
	}

	private static void updateProjectUsers(Project__c project, Datetime now) {
		List<Id> contactIds = new List<Id> ();
		Id masterUserId;
		for (Project_User__c projectUser : ProjectUser_DAO.getProjectUsersByProjectId(project.Id)) {
			if (projectUser.Master_User__c) {
				masterUserId = projectUser.Contact__c;
			}
			contactIds.add(projectUser.Contact__c);
		}
		List<Contact> contacts = Contact_DAO.getContactsByIds(contactIds);
		for (Contact contact : contacts) {
			if(contact.Id == masterUserId){
				contact.Trial_Source__c = 'Trial Owner';
			} else {
				contact.Trial_Source__c = 'Trial User';
			}
			contact.isTrial__c = true;
			contact.Space_Type__c = 'Main';
			contact.Trial_Request_DT__c = now;
			contact.Trial_Activation_DT__c = now;
		}
		update contacts;
	}

	public static Opportunity createTrialOpportunity(Project__c project, Datetime now) {
		Opportunity opp = new Opportunity();
		opp.Project__c = project.Id;
		opp.AccountId = project.Account_ID__c;
		opp.CloseDate = now.addDays(14).date();
		opp.RecordTypeId = OpportunityRecordTypes.self_service;
		opp.Type = 'New Business';
		opp.Name = createTrialOpportunityName(project, now);
		opp.StageName = 'Free Trial';
		return opp;
	}

	private static String createTrialOpportunityName(Project__c project, Datetime now) {
		String oppName = '';
		Contact masterContact = Contact_DAO.getMasterContactByProjectNoExc(project);
		if (masterContact != null){
			oppName += masterContact.Name;
		} else if (project.Account_Name__c != null){
			oppName += Account_DAO.getAccountById(project.Account_Name__c).Name;
		} else {
			oppName += project.Name;
		}
		oppName += ' Trial, ' + now;
		return oppName;
	}

}