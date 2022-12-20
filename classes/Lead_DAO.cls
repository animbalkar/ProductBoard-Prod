public class Lead_DAO {
	public static List<Lead> getUnconvertedLeadsByEmail(String email) {
		return [
			SELECT
				Address,
				AnnualRevenue,
				City,
				City__c,
				Company,
				Company_Category_Industry__c,
				Company_Category_Industry_Group__c,
				Company_Category_Sector__c,
				Company_Category_Sub_Industry__c,
				User_PB_ID__c,
				Company_City__c,
				Company_Country__c,
				Company_Country_Code__c,
				Company_Description__c,
				Company_External_ID__c,
				Company_Indexed_At__c,
				Company_LinkedIn__c,
				Company_Location__c,
				Company_Logo__c,
				Company_Phone__c,
				Company_Postal_Code__c,
				Company_State__c,
				Company_State_Code__c,
				Company_Street__c,
				Company_Street_Number__c,
				Company_Sub_Premise__c,
				Company_Time_Zone__c,
				Company_Type__c,
				Company_UTC_Offset__c,
				ConvertedAccountId,
				ConvertedContactId,
				ConvertedDate,
				ConvertedOpportunityId,
				Country,
				Country__c,
				Country_Code__c,
				CreatedById,
				CreatedDate,
				Email,
				Email_Addresses__c,
				EmailBouncedDate,
				EmailBouncedReason,
				Employees_Range__c,
				Enriched__c,
				Fax,
				FirstName,
				Fiscal_Year_Ends__c,
				Founded_Year__c,
				Full_Name__c,
				Gender__c,
				GeocodeAccuracy,
				HasOptedOutOfEmail,
				Id,
				Indexed_At__c,
				Industry,
				IsAdmin__c,
				IsEditor__c,
				IsViewer__c,
				IsContributor__c,
				IsConverted,
				IsDeleted,
				IsUnreadByOwner,
				Jigsaw,
				JigsawContactId,
				LastActivityDate,
				LastModifiedById,
				LastModifiedDate,
				LastName,
				LastReferencedDate,
				LastViewedDate,
				Latitude,
				LeadSource,
				Legacy_Lead_Source_March_2019__c,
				Legal_Name__c,
				LinkedIn__c,
				Location__c,
				Longitude,
				MasterRecordId,
				MiddleName,
				MobilePhone,
				Name,
				Newsletter_Opt_In__c,
				NumberOfEmployees,
				OwnerId,
				Person_External_ID__c,
				Personal_Website__c,
				Phone,
				Phone_Numbers__c,
				PhotoUrl,
				PostalCode,
				Project_Created_DT__c,
				Raised__c,
				Rating,
				Role__c,
				Salutation,
				Seniority__c,
				State,
				State__c,
				State_Code__c,
				Status,
				Street,
				Suffix,
				SystemModstamp,
				Tags__c,
				Technologies__c,
				Time_Zone__c,
				Title,
				Trial_Request_DT__c,
				Trial_Source__c,
				Trial_Usage_Score__c,
				UTC_Offset__c,
				VAT__c,
				Website
			FROM Lead
			WHERE IsConverted = FALSE AND Email = :email
		];
	}

	public static Lead getLeadByEmail2(String email) {
		List<Lead> leads = [
			SELECT
				Address,
				AnnualRevenue,
				City,
				City__c,
				Company,
				Company_Category_Industry__c,
				Company_Category_Industry_Group__c,
				Company_Category_Sector__c,
				Company_Category_Sub_Industry__c,
				User_PB_ID__c,
				Company_City__c,
				Company_Country__c,
				Company_Country_Code__c,
				Company_Description__c,
				Company_External_ID__c,
				Company_Indexed_At__c,
				Company_LinkedIn__c,
				Company_Location__c,
				Company_Logo__c,
				Company_Phone__c,
				Company_Postal_Code__c,
				Company_State__c,
				Company_State_Code__c,
				Company_Street__c,
				Company_Street_Number__c,
				Company_Sub_Premise__c,
				Company_Time_Zone__c,
				Company_Type__c,
				Company_UTC_Offset__c,
				ConvertedAccountId,
				ConvertedContactId,
				ConvertedDate,
				ConvertedOpportunityId,
				Country,
				Country__c,
				Country_Code__c,
				CreatedById,
				CreatedDate,
				Email,
				Email_Addresses__c,
				EmailBouncedDate,
				EmailBouncedReason,
				Employees_Range__c,
				Enriched__c,
				Fax,
				FirstName,
				Fiscal_Year_Ends__c,
				Founded_Year__c,
				Full_Name__c,
				Gender__c,
				GeocodeAccuracy,
				HasOptedOutOfEmail,
				Id,
				Indexed_At__c,
				Industry,
				IsAdmin__c,
				IsEditor__c,
				IsViewer__c,
				IsContributor__c,
				IsConverted,
				IsDeleted,
				IsUnreadByOwner,
				Jigsaw,
				JigsawContactId,
				LastActivityDate,
				LastModifiedById,
				LastModifiedDate,
				LastName,
				LastReferencedDate,
				LastViewedDate,
				Latitude,
				LeadSource,
				Legacy_Lead_Source_March_2019__c,
				Legal_Name__c,
				LinkedIn__c,
				Location__c,
				Longitude,
				MasterRecordId,
				MiddleName,
				MobilePhone,
				Name,
				Newsletter_Opt_In__c,
				NumberOfEmployees,
				OwnerId,
				Person_External_ID__c,
				Personal_Website__c,
				Phone,
				Phone_Numbers__c,
				PhotoUrl,
				PostalCode,
				Project_Created_DT__c,
				Raised__c,
				Rating,
				Role__c,
				Salutation,
				Seniority__c,
				State,
				State__c,
				State_Code__c,
				Status,
				Street,
				Suffix,
				SystemModstamp,
				Tags__c,
				Technologies__c,
				Time_Zone__c,
				Title,
				Trial_Request_DT__c,
				Trial_Source__c,
				Trial_Usage_Score__c,
				UTC_Offset__c,
				VAT__c,
				Website,
				cbit__Clearbit__c
			FROM Lead
			WHERE Email = :email
		];
		if (leads.isEmpty()) {
			throw new ProductboardException('Lead with email [' + email + '] was not found.', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		if (leads.size() > 1) {
			throw new ProductboardException(
				'More leads with email [' +
				email +
				'] were found.',
				ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND
			);
		}
		return leads.get(0);
	}

	public static List<Lead> getAllLeadsByEmail(String email) {
		return [
			SELECT
				Address,
				AnnualRevenue,
				City,
				City__c,
				Company,
				Company_Category_Industry__c,
				Company_Category_Industry_Group__c,
				Company_Category_Sector__c,
				Company_Category_Sub_Industry__c,
				Company_City__c,
				Company_Country__c,
				Company_Country_Code__c,
				Company_Description__c,
				Company_External_ID__c,
				Company_Indexed_At__c,
				Company_LinkedIn__c,
				Company_Location__c,
				Company_Logo__c,
				Company_Phone__c,
				Company_Postal_Code__c,
				Company_State__c,
				Company_State_Code__c,
				Company_Street__c,
				Company_Street_Number__c,
				Company_Sub_Premise__c,
				Company_Time_Zone__c,
				Company_Type__c,
				Company_UTC_Offset__c,
				ConvertedAccountId,
				ConvertedContactId,
				ConvertedDate,
				ConvertedOpportunityId,
				Country,
				Country__c,
				Country_Code__c,
				CreatedById,
				CreatedDate,
				Email,
				Email_Addresses__c,
				EmailBouncedDate,
				EmailBouncedReason,
				Employees_Range__c,
				Enriched__c,
				Fax,
				FirstName,
				Fiscal_Year_Ends__c,
				User_PB_ID__c,
				Founded_Year__c,
				Full_Name__c,
				Gender__c,
				GeocodeAccuracy,
				HasOptedOutOfEmail,
				Id,
				Indexed_At__c,
				Industry,
				IsAdmin__c,
				IsEditor__c,
				IsViewer__c,
				IsContributor__c,
				IsConverted,
				IsDeleted,
				IsUnreadByOwner,
				Jigsaw,
				JigsawContactId,
				LastActivityDate,
				LastModifiedById,
				LastModifiedDate,
				LastName,
				LastReferencedDate,
				LastViewedDate,
				Latitude,
				LeadSource,
				Legacy_Lead_Source_March_2019__c,
				Legal_Name__c,
				LinkedIn__c,
				Location__c,
				Longitude,
				MasterRecordId,
				MiddleName,
				MobilePhone,
				Name,
				Newsletter_Opt_In__c,
				NumberOfEmployees,
				OwnerId,
				Person_External_ID__c,
				Personal_Website__c,
				Phone,
				Phone_Numbers__c,
				PhotoUrl,
				PostalCode,
				Project_Created_DT__c,
				Raised__c,
				Rating,
				Role__c,
				Salutation,
				Seniority__c,
				State,
				State__c,
				State_Code__c,
				Status,
				Street,
				Suffix,
				SystemModstamp,
				Tags__c,
				Technologies__c,
				Time_Zone__c,
				Title,
				Trial_Request_DT__c,
				Trial_Source__c,
				Trial_Usage_Score__c,
				UTC_Offset__c,
				Trial_End_Date__c,
				VAT__c,
				Website
			FROM Lead
			WHERE Email = :email
		];
	}

	public static List<Lead> getLeadbyId(Id id) {
		return [
			SELECT
				Address,
				AnnualRevenue,
				City,
				City__c,
				Trial_End_Date__c,
				Company,
				Company_Category_Industry__c,
				Company_Category_Industry_Group__c,
				Company_Category_Sector__c,
				Company_Category_Sub_Industry__c,
				Company_City__c,
				Company_Country__c,
				Company_Country_Code__c,
				Company_Description__c,
				Company_External_ID__c,
				Company_Indexed_At__c,
				User_PB_ID__c,
				Company_LinkedIn__c,
				Company_Location__c,
				Company_Logo__c,
				Company_Phone__c,
				Company_Postal_Code__c,
				Company_State__c,
				Company_State_Code__c,
				Company_Street__c,
				Company_Street_Number__c,
				Company_Sub_Premise__c,
				Company_Time_Zone__c,
				Company_Type__c,
				Company_UTC_Offset__c,
				ConvertedAccountId,
				ConvertedContactId,
				ConvertedDate,
				ConvertedOpportunityId,
				Country,
				Country__c,
				Country_Code__c,
				CreatedById,
				CreatedDate,
				Email,
				Email_Addresses__c,
				EmailBouncedDate,
				EmailBouncedReason,
				Employees_Range__c,
				Enriched__c,
				Fax,
				FirstName,
				Fiscal_Year_Ends__c,
				Founded_Year__c,
				Full_Name__c,
				Gender__c,
				GeocodeAccuracy,
				HasOptedOutOfEmail,
				Id,
				Indexed_At__c,
				Industry,
				IsAdmin__c,
				IsEditor__c,
				IsViewer__c,
				IsContributor__c,
				IsConverted,
				IsDeleted,
				IsUnreadByOwner,
				Jigsaw,
				JigsawContactId,
				LastActivityDate,
				LastModifiedById,
				LastModifiedDate,
				LastName,
				LastReferencedDate,
				LastViewedDate,
				Latitude,
				LeadSource,
				Legacy_Lead_Source_March_2019__c,
				Legal_Name__c,
				LinkedIn__c,
				Location__c,
				Longitude,
				MasterRecordId,
				MiddleName,
				MobilePhone,
				Name,
				Newsletter_Opt_In__c,
				NumberOfEmployees,
				OwnerId,
				Person_External_ID__c,
				Personal_Website__c,
				Phone,
				Phone_Numbers__c,
				PhotoUrl,
				PostalCode,
				Project_Created_DT__c,
				Raised__c,
				Rating,
				Role__c,
				Salutation,
				Seniority__c,
				State,
				State__c,
				State_Code__c,
				Status,
				Street,
				Suffix,
				SystemModstamp,
				Tags__c,
				Technologies__c,
				Time_Zone__c,
				Title,
				Trial_Request_DT__c,
				Trial_Source__c,
				Trial_Usage_Score__c,
				UTC_Offset__c,
				VAT__c,
				Website
			FROM Lead
			WHERE Id = :id
		];
	}

	public static List<Lead> getLeadbyId2(Id id) {
		List<Lead> leads = [
			SELECT
				Address,
				AnnualRevenue,
				City,
				City__c,
				Company,
				Company_Category_Industry__c,
				Company_Category_Industry_Group__c,
				Company_Category_Sector__c,
				Company_Category_Sub_Industry__c,
				Company_City__c,
				Company_Country__c,
				Company_Country_Code__c,
				Company_Description__c,
				Company_External_ID__c,
				Company_Indexed_At__c,
				Company_LinkedIn__c,
				Company_Location__c,
				Trial_End_Date__c,
				Company_Logo__c,
				Company_Phone__c,
				Company_Postal_Code__c,
				User_PB_ID__c,
				Company_State__c,
				Company_State_Code__c,
				Company_Street__c,
				Company_Street_Number__c,
				Company_Sub_Premise__c,
				Company_Time_Zone__c,
				Company_Type__c,
				Company_UTC_Offset__c,
				ConvertedAccountId,
				ConvertedContactId,
				ConvertedDate,
				ConvertedOpportunityId,
				Country,
				Country__c,
				Country_Code__c,
				CreatedById,
				CreatedDate,
				Email,
				Email_Addresses__c,
				EmailBouncedDate,
				EmailBouncedReason,
				Employees_Range__c,
				Enriched__c,
				Fax,
				FirstName,
				Fiscal_Year_Ends__c,
				Founded_Year__c,
				Full_Name__c,
				Gender__c,
				GeocodeAccuracy,
				HasOptedOutOfEmail,
				Id,
				Indexed_At__c,
				Industry,
				IsAdmin__c,
				IsEditor__c,
				IsViewer__c,
				IsContributor__c,
				IsConverted,
				IsDeleted,
				IsUnreadByOwner,
				Jigsaw,
				JigsawContactId,
				LastActivityDate,
				LastModifiedById,
				LastModifiedDate,
				LastName,
				LastReferencedDate,
				LastViewedDate,
				Latitude,
				LeadSource,
				Legacy_Lead_Source_March_2019__c,
				Legal_Name__c,
				LinkedIn__c,
				Location__c,
				Longitude,
				MasterRecordId,
				MiddleName,
				MobilePhone,
				Name,
				Newsletter_Opt_In__c,
				NumberOfEmployees,
				OwnerId,
				Person_External_ID__c,
				Personal_Website__c,
				Phone,
				Phone_Numbers__c,
				PhotoUrl,
				PostalCode,
				Project_Created_DT__c,
				Raised__c,
				Rating,
				Role__c,
				Salutation,
				Seniority__c,
				State,
				State__c,
				State_Code__c,
				Status,
				Street,
				Suffix,
				SystemModstamp,
				Tags__c,
				Technologies__c,
				Time_Zone__c,
				Title,
				Trial_Request_DT__c,
				Trial_Source__c,
				Trial_Usage_Score__c,
				UTC_Offset__c,
				VAT__c,
				Website,
				cbit__Clearbit__c
			FROM Lead
			WHERE Id = :id
		];
		if (leads.isEmpty()) {
			throw new ProductboardException(
				'Lead for the project with lead ID [' +
				id +
				'] was not found.',
				ApiConstants.CODE_FAILED_RECORD_NOT_FOUND
			);
		}
		return leads;
	}

	public static List<Lead> getLeadsByListOfProjectUserIds(List<Id> pusIds) {
		List<Lead> leads = [
			SELECT
				Address,
				AnnualRevenue,
				City,
				City__c,
				Company,
				Company_Category_Industry__c,
				Company_Category_Industry_Group__c,
				Company_Category_Sector__c,
				Company_Category_Sub_Industry__c,
				Company_City__c,
				Company_Country__c,
				Company_Country_Code__c,
				Company_Description__c,
				Company_External_ID__c,
				Company_Indexed_At__c,
				Company_LinkedIn__c,
				Company_Location__c,
				Trial_End_Date__c,
				Company_Logo__c,
				Company_Phone__c,
				Company_Postal_Code__c,
				Company_State__c,
				Company_State_Code__c,
				Company_Street__c,
				Company_Street_Number__c,
				Company_Sub_Premise__c,
				Company_Time_Zone__c,
				Company_Type__c,
				Company_UTC_Offset__c,
				ConvertedAccountId,
				ConvertedContactId,
				ConvertedDate,
				ConvertedOpportunityId,
				Country,
				Country__c,
				Country_Code__c,
				User_PB_ID__c,
				CreatedById,
				CreatedDate,
				Email,
				Email_Addresses__c,
				EmailBouncedDate,
				EmailBouncedReason,
				Employees_Range__c,
				Enriched__c,
				Fax,
				FirstName,
				Fiscal_Year_Ends__c,
				Founded_Year__c,
				Full_Name__c,
				Gender__c,
				GeocodeAccuracy,
				HasOptedOutOfEmail,
				Id,
				Indexed_At__c,
				Industry,
				IsAdmin__c,
				IsEditor__c,
				IsViewer__c,
				IsContributor__c,
				IsConverted,
				IsDeleted,
				IsUnreadByOwner,
				Jigsaw,
				JigsawContactId,
				LastActivityDate,
				LastModifiedById,
				LastModifiedDate,
				LastName,
				LastReferencedDate,
				LastViewedDate,
				Latitude,
				LeadSource,
				Legacy_Lead_Source_March_2019__c,
				Legal_Name__c,
				LinkedIn__c,
				Location__c,
				Longitude,
				MasterRecordId,
				MiddleName,
				MobilePhone,
				Name,
				Newsletter_Opt_In__c,
				NumberOfEmployees,
				OwnerId,
				Person_External_ID__c,
				Personal_Website__c,
				Phone,
				Phone_Numbers__c,
				PhotoUrl,
				PostalCode,
				Project_Created_DT__c,
				Raised__c,
				Rating,
				Role__c,
				Salutation,
				Seniority__c,
				State,
				State__c,
				State_Code__c,
				Status,
				Street,
				Suffix,
				SystemModstamp,
				Tags__c,
				Technologies__c,
				Time_Zone__c,
				Title,
				Trial_Request_DT__c,
				Trial_Source__c,
				Trial_Usage_Score__c,
				UTC_Offset__c,
				VAT__c,
				Website
			FROM Lead
			WHERE Id IN :pusIds
		];
		if (leads.isEmpty()) {
			throw new ProductboardException('Lead for the project user was not found.', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		return leads;
	}

	public static void upsertLeadRequest(Lead lead, TrialOps.LeadInfo info, Datetime now) {
		if (lead.Id == null) {
			lead.Email = info.userEmail.toLowerCase();
			lead.Company = 'Not provided';
			lead.LastName = 'Not provided';
			lead.Status = 'New';
			lead.Legacy_Lead_Source_March_2019__c = 'Web Sign Up';
		}

		lead.User_PB_ID__c = Double.valueOf(info.userId);
		if (info.spaceType == 'standalone_portal') {
			lead.Space_Type__c = 'Standalone Portal';
			lead.Portal_Source__c = getSource(info.spaceType, 'Request');
			lead.Portal_Request_DT__c = now;
		} else if (info.spaceType == 'starter') {
			lead.Space_Type__c = 'Starter';
			lead.Starter_Source__c = getSource(info.spaceType, 'Request');
			lead.Starter_Request_DT__c = now;
		} else {
			lead.Space_Type__c = 'Main';
			lead.Trial_Source__c = getSource(info.spaceType, 'Request');
			lead.Trial_Request_DT__c = now;
		}
	}

	public static void upsertLeadOwner(Lead lead, TrialOps.LeadInfo info, Datetime now) {
		if (lead.Id == null) {
			lead.Email = info.userEmail.toLowerCase();
			lead.LastName = 'Not provided';
			lead.Status = 'New';
			lead.Legacy_Lead_Source_March_2019__c = 'Web Sign Up';
		}

		lead.User_PB_ID__c = Double.valueOf(info.userId);
		lead.Project_Created_DT__c = now;

		//assign source and requet DT
		if (info.spaceType == 'standalone_portal') {
			lead.Space_Type__c = 'Standalone Portal';
			lead.Portal_Source__c = getSource(info.spaceType, 'Owner');
			if (lead.Portal_Request_DT__c == null) {
				lead.Portal_Request_DT__c = now;
			}
			lead.Portal_Activation_DT__c = now;
		} else if (info.spaceType == 'starter') {
			lead.Space_Type__c = 'Starter';
			lead.Starter_Source__c = getSource(info.spaceType, 'Owner');
			if (lead.Starter_Request_DT__c == null) {
				lead.Starter_Request_DT__c = now;
			}
			lead.Starter_Activation_DT__c = now;
		} else {
			lead.Space_Type__c = 'Main';
			lead.Trial_Source__c = getSource(info.spaceType, 'Owner');
			if (lead.Trial_Request_DT__c == null) {
				lead.Trial_Request_DT__c = now;
			}
			lead.Trial_Activation_DT__c = now;
			lead.isTrial__c = true;
			//assign Trial EndDate
			if (info.trialEndDate != null) {
				lead.Trial_End_Date__c = info.trialEndDate;
			}
		}

		//assignCompanyName
		if ((lead.Company == null || lead.Company == 'Not provided') && (info.company != null && info.company != '')) {
			lead.Company = info.company;
		} else if ((lead.Company == null || lead.Company == 'Not provided') && (info.company == null || info.company == '')) {
			lead.Company = 'Not provided';
		}

		//assignPhone
		if (info.phone != null && info.phone != '') {
			lead.Phone = info.phone;
		}

		//assignName
		if (info.fullName != null && info.fullName != '') {
			if (lead.Name == 'Not provided' || lead.Name == null || lead.Name == '[[unknown]]') {
				parseLeadFullName(info.fullName, lead);
			} else {
				lead.Full_Name__c = info.fullName;
			}
		}
	}

	public static void upsertLeadUser(Lead lead, String spaceType, String email, Double userId, Datetime now) {
		if (lead.Id == null) {
			lead.Email = email;
			lead.LastName = 'Not provided';
			lead.Company = 'Not provided';
			lead.Status = 'New';
			lead.Legacy_Lead_Source_March_2019__c = 'Account User';
		}

		lead.User_PB_ID__c = Double.valueOf(userId);
		lead.Project_Created_DT__c = now;

		if (spaceType == 'Standalone Portal') {
			lead.Space_Type__c = 'Standalone Portal';
			lead.Portal_Source__c = getSource(spaceType, 'User');
			lead.Portal_Request_DT__c = now;
			lead.Portal_Activation_DT__c = now;
			lead.isTrial__c = true;
		} else if (spaceType == 'Starter') {
			lead.Space_Type__c = 'Starter';
			lead.Starter_Source__c = getSource(spaceType, 'User');
			lead.Starter_Request_DT__c = now;
			lead.Starter_Activation_DT__c = now;
			lead.isTrial__c = true;
		} else {
			lead.Space_Type__c = 'Main';
			if (lead.Trial_Source__c == null || lead.Trial_Source__c.equals('Trial Request')) {
				lead.Trial_Source__c = getSource(spaceType, 'User');
			}
			lead.Trial_Request_DT__c = now;
			lead.Trial_Activation_DT__c = now;
		}
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

	public static void insertLead(Lead ld) {
		try {
			insert ld;
		} catch (DmlException e) {
			throw new ProductboardException('Insert Lead was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}

	public static void updateLead(Lead ld) {
		try {
			update ld;
		} catch (DmlException e) {
			throw new ProductboardException('Update Lead was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
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
}