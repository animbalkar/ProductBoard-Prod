public class Lead_SERV {
	public static List<Lead> getUnconvertedLeadsByEmailWithoutLeadSource(String email, String legacyLeadSource) {
		List<Lead> leads = Lead_DAO.getUnconvertedLeadsByEmail(email);

		List<Lead> result = new List<Lead>();
		for (Lead lead : leads) {
			if (lead.Legacy_Lead_Source_March_2019__c != null) {
				if (lead.Legacy_Lead_Source_March_2019__c != legacyLeadSource) {
					result.add(lead);
				}
			} else {
				result.add(lead);
			}
		}

		return result;
	}

	public static List<lead> getExistingLeadsByUserId(Double userId) {
		return [
			SELECT
				Trial_Source__c,
				IsConverted,
				Company,
				Email,
				User_PB_ID__c,
				Legacy_Lead_Source_March_2019__c,
				Trial_End_Date__c,
				Trial_Request_DT__c,
				Portal_Request_DT__c,
				Portal_Source__c,
				Space_Type__c,
				Starter_Source__c,
				Starter_Request_DT__c,
				Starter_Activation_DT__c
			FROM Lead
			WHERE User_PB_ID__c = :userId AND IsConverted = FALSE
		];
	}
	public static List<lead> getExistingLeadsByEmail(String email) {
		return [
			SELECT
				Trial_Source__c,
				IsConverted,
				Company,
				Email,
				User_PB_ID__c,
				Legacy_Lead_Source_March_2019__c,
				Trial_End_Date__c,
				Trial_Request_DT__c,
				Portal_Request_DT__c,
				Portal_Source__c,
				Space_Type__c,
				Starter_Source__c,
				Starter_Request_DT__c,
				Starter_Activation_DT__c
			FROM Lead
			WHERE Email = :email AND User_PB_ID__c = NULL AND IsConverted = FALSE
		];
	}

	public static String activateStarterLead(String userId) {
		List<Lead> existingLeads = getExistingLeadsByUserId(Double.valueOf(userId));
		if (existingLeads.size() > 1) {
			throw new ProductboardException(
				'There are multiple Leads associated with the userId ' +
				userId +
				'. Please dedupe the Salesforce data first.'
			);
		} else if (existingLeads.size() < 1) {
			throw new ProductboardException('No Lead associated with the userId ' + userId + ' found.');
		} else {
			Lead lead = existingLeads.get(0);
			lead.Starter_Activation_DT__c = Datetime.now();
			Lead_DAO.updateLead(lead);
			return lead.Id;
		}
	}

	public static List<Contact> getExistingContactsByUserId(Double userId) {
		return [SELECT Id FROM Contact WHERE User_PB_ID__c = :userId];
	}

	public static Lead createOrUpdateTrialRequest(TrialOps.LeadInfo info, Datetime now, IntegrationLog__c il) {
		Lead lead = new Lead();
		String email = info.userEmail.toLowerCase();
		Double userId = Double.valueOf(info.userId);

		if (email == null || email.equals('') || userId == null) {
			il.Description__c += '\nFAILED - Invalid parameters';
			throw new ProductboardException(ApiConstants.MSG_FAILED_GENERAL, ApiConstants.CODE_FAILED_PARAMETERS);
		}

		List<Lead> existingLeads = getExistingLeadsByUserId(userId);
		il.Description__c += '\n- Existing Leads. count: ' + existingLeads.size();

		if (existingLeads.isEmpty()) {
			existingLeads = getExistingLeadsByEmail(email);
			il.Description__c += '\n- Lead found by Email. count: ' + existingLeads.size();
		}

		List<Contact> existingContacts = getExistingContactsByUserId(userId);
		il.Description__c += '\n- Existing Contacts. count: ' + existingContacts.size();

		if (existingContacts.isEmpty()) {
			if (!existingLeads.isEmpty()) {
				lead = existingLeads[0];
				il.Description__c += '\n- Existing Lead. id: ' + lead.id;
			}
			Lead_DAO.upsertLeadRequest(lead, info, now);
			upsert lead;
			il.Description__c += '\n- Lead Upserted. id: ' + lead.id;
		} else {
			il.Description__c += '\n- Existing Contacts. id[0]: ' + existingContacts[0].Id;
		}
		return lead;
	}

	public static Lead createOrUpdateTrialOwner(TrialOps.LeadInfo info, Datetime now, IntegrationLog__c il) {
		Lead lead = new Lead();
		String email = info.userEmail.toLowerCase();
		Double userId = Double.valueOf(info.userId);

		List<Lead> existingLeads = getExistingLeadsByUserId(userId);
		il.Description__c += '\n- Lead found by Id. count: ' + existingLeads.size();
		if (existingLeads.isEmpty()) {
			existingLeads = getExistingLeadsByEmail(email);
			il.Description__c += '\n- Lead found by Email. count: ' + existingLeads.size();
		}

		if (!existingLeads.isEmpty()) {
			lead = existingLeads[0];
			il.Description__c += '\n- Existing lead. id: ' + lead.id;
		}

		Lead_DAO.upsertLeadOwner(lead, info, now);
		upsert lead;
		il.Description__c += '\n- Lead Upserted. id: ' + lead.id;

		return lead;
	}

	public static Lead createOrUpdateTrialUser(String spaceType, String email, Double userId, Datetime now, IntegrationLog__c il) {
		Lead lead = new Lead();
		List<Lead> existingLeads = getExistingLeadsByUserId(userId);
		il.Description__c += '\n- Lead found by Id. count: ' + existingLeads.size();
		if (existingLeads.isEmpty()) {
			existingLeads = getExistingLeadsByEmail(email);
			il.Description__c += '\n- Lead found by Email. count: ' + existingLeads.size();
		}

		if (!existingLeads.isEmpty()) {
			lead = existingLeads.get(0);
			il.Description__c += '\n- Existing lead. id: ' + lead.id;
		}
		Lead_DAO.upsertLeadUser(lead, spaceType, email, userId, now);
		upsert lead;
		il.Description__c += '\n- Lead Upserted. id: ' + lead.id;

		return lead;
	}

	public static void parseLeadFullName(String fullName, Lead lead) {
		// update name

		if (fullName.contains(' ')) {
			if (fullName.substringAfter(' ') == null || fullName.substringAfter(' ').equals('')) {
				lead.LastName = fullName.substringBefore(' ');
			} else {
				lead.FirstName = fullName.substringBefore(' ');
				lead.LastName = fullName.substringAfter(' ');
			}
		} else {
			lead.LastName = fullName;
		}
		lead.Full_Name__c = fullName;
	}

	public static Contact convertLead(Lead l, Id accountId, Id contactId) {
		Contact returnContact;
		if (l.IsConverted == false) {
			Database.LeadConvert ld = new Database.LeadConvert();
			ld.setLeadId(l.Id);
			if (accountId != null)
				ld.setAccountId(accountId);
			if (contactId != null) {
				ld.setContactId(contactId);
			} else {
				List<Contact> existingContacts = Contact_DAO.getContactsByEmail(l.Email);
				if (!existingContacts.isEmpty())
					ld.setContactId(existingContacts[0].Id);
			}
			LeadStatus leadStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted = TRUE LIMIT 1];
			ld.setConvertedStatus(leadStatus.MasterLabel);
			ld.setDoNotCreateOpportunity(true);
			Database.LeadConvertResult Leadconverts = Database.convertLead(ld);

			returnContact = Contact_DAO.getContactbyId2(Leadconverts.getContactId())[0];
		} else {
			returnContact = Contact_DAO.getContactbyId(l.ConvertedContactId)[0];
		}
		return returnContact;
	}

	public static String getSource(String spaceType, String suffix) {
		if (spaceType == 'standalone_portal' || spaceType == 'Standalone Portal') {
			return 'Portal ' + suffix;
		} else if (spaceType == 'starter' || spaceType == 'Starter') {
			return 'Starter ' + suffix;
		} else {
			return 'Trial ' + suffix;
		}
	}
}