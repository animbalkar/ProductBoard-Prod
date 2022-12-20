public class ProjectOps_SERV {
	public static void updateProjectName(String newProjectName, String projectId, IntegrationLog__c il) {
		if (newProjectName == null || projectId == null) {
			il.Description__c += '\nFAILED - Invalid parameters';
			throw new ProductboardException(ApiConstants.MSG_FAILED_PARAMETERS, ApiConstants.CODE_FAILED_PARAMETERS);
		} else {
			Project__c existingProject = Project_DAO.getProjectByPBIdWithExc(projectId);
			il.Description__c += '\n- Project found. id: ' + existingProject.Id;
			existingProject.Name = newProjectName + '.productboard.com';
			existingProject.Team_URL__c = newProjectName + '.productboard.com';
			update existingProject;
			il.Description__c += '\n- Project updated.';
		}
	}

	public static void updateTrialEndDate(Date trialEndDate, String projectId, IntegrationLog__c il) {
		Project__c existingProject = Project_DAO.getProjectByPBIdWithExc(projectId);
		il.Description__c += '\n- Project found. id: ' + existingProject.Id;
		Contact existingContact = Contact_DAO.getContactbyId2(existingProject.Master_User_Contact__c)[0];
		il.Description__c += '\n- Contact found. id: ' + existingContact.Id;
		List<Opportunity> existingOpportunities = Opportunity_DAO.getOpenOpportunitiesByProjectId(existingProject.id);
		il.Description__c += '\n- Opportunity found. count: ' + existingOpportunities.size();

		existingContact.Trial_End_Date__c = trialEndDate;
		existingProject.Trial_End_Date__c = trialEndDate;
		if (trialEndDate != null) {
			existingProject.Active__c = true;
		}

		update existingProject;
		il.Description__c += '\n- Project updated.';
		update existingContact;
		il.Description__c += '\n- Contact updated.';

		if (trialEndDate != null) {
			Opportunity opp = new Opportunity();
			if (!existingOpportunities.isEmpty()) {
				opp = getProjectOpportunity(existingOpportunities);
				il.Description__c += '\n- Existing opportunity. id: ' + opp.id;
			} else {
				opp.Project__c = existingProject.Id;
				opp.AccountId = existingContact.AccountId;
				opp.CloseDate = trialEndDate;
				opp.RecordTypeId = OpportunityRecordTypes.self_service;
				opp.Type = 'New Business';
				opp.Name = existingContact.Name + ', ' + Datetime.now();
				opp.StageName = 'Free Trial';
				insert opp;
				il.Description__c += '\n- New Opportunity created. id: ' + opp.Id;
			}
		}
	}

	public static Opportunity getProjectOpportunity(List<Opportunity> opps) {
		Id techUserId = [SELECT Id FROM User WHERE UserName LIKE 'technical-pb@enehano.cz%'].Id;
		Opportunity opp = new Opportunity();
		for (integer i = 0; i < opps.size(); i++) {
			if (i == opps.size() - 1) {
				opp = opps[i];
			} else {
				if (opps[i].OwnerId != techUserId) {
					opp = opps[i];
				}
			}
		}
		return opp;
	}
}