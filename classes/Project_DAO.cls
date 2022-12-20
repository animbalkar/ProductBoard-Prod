public class Project_DAO {
	public static List<Project__c> getProjectById(Id projectId) {
		return [
			SELECT
				Account_Name__c,
				Active__c,
				Cancelled__c,
				CreatedById,
				CreatedDate,
				Created_Date__c,
				Deleted__c,
				End_Date__c,
				Id,
				IsDeleted,
				LastModifiedById,
				LastModifiedDate,
				LastReferencedDate,
				LastViewedDate,
				Master_User_Contact__c,
				Master_User_Lead__c,
				Name,
				Product_Name__c,
				Project_PB_ID__c,
				Price_Book__c,
				Price_Book__r.name,
				Subscription_Start_Date__c,
				Subscription_End_Date__c,
				SystemModstamp,
				Team_URL__c,
				Total_Project_Score__c,
				Trial_End_Date__c
			FROM Project__c
			WHERE Id = :projectId
		];
	}

	public static List<Project__c> getProjectByProductboardProjectId(String projectPbId) {
		return [
			SELECT
				Account_Name__c,
				Active__c,
				Cancelled__c,
				CreatedById,
				CreatedDate,
				Created_Date__c,
				Deleted__c,
				End_Date__c,
				Id,
				IsDeleted,
				LastModifiedById,
				LastModifiedDate,
				LastReferencedDate,
				LastViewedDate,
				Master_User_Contact__c,
				Master_User_Lead__c,
				Name,
				Product_Name__c,
				Project_PB_ID__c,
				Price_Book__c,
				Subscription_Start_Date__c,
				Subscription_End_Date__c,
				SystemModstamp,
				Team_URL__c,
				Total_Project_Score__c,
				Trial_End_Date__c
			FROM Project__c
			WHERE Project_PB_ID__c = :projectPbId
		];
	}

	public static Project__c getProjectByPBIdWithExc(String projectPbId) {
		List<Project__c> projects = [
			SELECT
				/*allFields*/ Id,
				IsDeleted,
				Name,
				CreatedDate,
				CreatedById,
				LastModifiedDate,
				LastModifiedById,
				SystemModstamp,
				LastViewedDate,
				LastReferencedDate,
				Account_Name__c,
				Master_User_Lead__c,
				Product_Name__c,
				Project_PB_ID__c,
				Team_URL__c,
				Total_Project_Score__c,
				Active__c,
				Cancelled__c,
				Created_Date__c,
				End_Date__c,
				Trial_End_Date__c,
				Deleted__c,
				Master_User_Contact__c,
				Parent_Project__c,
				Description__c,
				Health_status__c,
				Number_of_admins__c,
				Number_of_contributors__c,
				Number_of_editors__c,
				Number_of_viewers__c,
				Account_Not_Found__c,
				PB_Account_Name__c,
				PB_Account_Searched__c,
				Updated__c,
				Project_Activation_Date__c,
				Type__c,
				Number_of_admins_editors__c,
				Status__c,
				Project_Name_Short__c,
				Paid__c,
				Status_Carbon_Copy__c,
				Account_ID__c,
				Counter__c,
				Chartmogul_Plan__c,
				Watchdog_Properly_Active__c,
				Chartmogul_Billing_Cycle__c,
				GoodData_Dashboard__c,
				Chartmogul_MRR__c,
				Chartmogul_URL__c,
				Chartmogul_Status__c,
				Current_Backend_Stage__c,
				Backend_Company_name__c,
				Price_Book__c,
				Subscription_Start_Date__c,
				Subscription_End_Date__c,
				BI_Additional_Info__c,
				BI_Address__c,
				BI_City__c,
				BI_Company_Name__c,
				BI_Country__c,
				BI_Postal_Code__c,
				BI_State__c,
				BI_VAT_Number__c,
				CC_Address__c,
				CC_Billing_Email__c,
				CC_Country__c,
				CC_City__c,
				CC_Postal_Code__c,
				CC_State__c
			FROM Project__c
			WHERE Project_PB_ID__c = :projectPbId
		];
		if (projects.isEmpty()) {
			throw new ProductboardException(
				'Project for project PB ID [' +
				projectPbId +
				'] was not found.',
				ApiConstants.CODE_FAILED_RECORD_NOT_FOUND
			);
		}
		if (projects.size() > 1) {
			throw new ProductboardException(
				'More than 1 projects for ID [' +
				projectPbId +
				'] were found.',
				ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND
			);
		}
		return projects.get(0);
	}

	public static Project__c getProjectByIdWithExc(Id projectId) {
		List<Project__c> projects = [
			SELECT
				Account_Name__c,
				Active__c,
				Cancelled__c,
				CreatedById,
				CreatedDate,
				Created_Date__c,
				Deleted__c,
				End_Date__c,
				Id,
				IsDeleted,
				LastModifiedById,
				LastModifiedDate,
				LastReferencedDate,
				LastViewedDate,
				Master_User_Contact__c,
				Master_User_Lead__c,
				Name,
				Product_Name__c,
				Project_PB_ID__c,
				Price_Book__c,
				Subscription_Start_Date__c,
				Subscription_End_Date__c,
				SystemModstamp,
				Team_URL__c,
				Total_Project_Score__c,
				Trial_End_Date__c
			FROM Project__c
			WHERE Id = :projectId
		];

		if (projects.isEmpty()) {
			throw new ProductboardException(
				'Project for projectId [' +
				projectId +
				'] was not found.',
				ApiConstants.CODE_FAILED_RECORD_NOT_FOUND
			);
		}
		if (projects.size() > 1) {
			throw new ProductboardException(
				'More than 1 projects for projectId [' +
				projectId +
				'] were found.',
				ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND
			);
		}
		return projects.get(0);
	}

	public static List<Project__c> getProjectsByListOfIds(List<Id> projectIds) {
		List<Project__c> projects = [
			SELECT
				Account_Name__c,
				Active__c,
				Cancelled__c,
				CreatedById,
				CreatedDate,
				Created_Date__c,
				Deleted__c,
				End_Date__c,
				Id,
				IsDeleted,
				LastModifiedById,
				LastModifiedDate,
				LastReferencedDate,
				LastViewedDate,
				Master_User_Contact__c,
				Master_User_Lead__c,
				Name,
				Product_Name__c,
				Project_PB_ID__c,
				Price_Book__c,
				Subscription_Start_Date__c,
				Subscription_End_Date__c,
				SystemModstamp,
				Team_URL__c,
				Total_Project_Score__c,
				Trial_End_Date__c
			FROM Project__c
			WHERE Id IN :projectIds
		];
		if (projects.isEmpty()) {
			throw new ProductboardException('No Projects were found for the project user!', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		return projects;
	}

	public static List<Project__c> getProjectsByListOfMasterContactIds(List<Id> masterContactIds) {
		List<Project__c> projects = [
			SELECT
				Account_Name__c,
				Active__c,
				Cancelled__c,
				CreatedById,
				CreatedDate,
				Created_Date__c,
				Deleted__c,
				End_Date__c,
				Id,
				IsDeleted,
				LastModifiedById,
				LastModifiedDate,
				LastReferencedDate,
				LastViewedDate,
				Master_User_Contact__c,
				Master_User_Lead__c,
				Name,
				Product_Name__c,
				Project_PB_ID__c,
				Price_Book__c,
				Subscription_Start_Date__c,
				Subscription_End_Date__c,
				SystemModstamp,
				Team_URL__c,
				Total_Project_Score__c,
				Trial_End_Date__c
			FROM Project__c
			WHERE Master_User_Contact__c IN :masterContactIds
		];
		if (projects.isEmpty()) {
			throw new ProductboardException('No Projects were found.', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		return projects;
	}

	public static void insertProject(Project__c prj) {
		try {
			insert prj;
		} catch (DmlException e) {
			throw new ProductboardException('Insert Project was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}

	public static void updateProject(Project__c prj) {
		try {
			update prj;
		} catch (DmlException e) {
			throw new ProductboardException('Update Project was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}
}