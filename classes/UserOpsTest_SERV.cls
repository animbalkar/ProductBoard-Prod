public class UserOpsTest_SERV {


    public static UserEmailInfo setUpUserEmailInfo(String oldEmail, String newEmail) {
        UserEmailInfo info = new UserEmailInfo();
        info.oldEmail = oldEmail;
        info.newEmail = newEmail;
        return info;
    }

	public static UserFullNameInfo setUpUserFullNameInfo(String email, String fullName) {
		UserFullNameInfo info = new UserFullNameInfo();
		info.Email = email;
		info.fullName = fullName;
		return info;
	}

	public static UserOps_DTO_req setUpInfo() {
		UserOps_DTO_req info = new UserOps_DTO_req();
		info.userEmail = 'test@test.test';
		info.fullName = 'First Last';
		info.pbOptIn = 'true';
		return info;
	}

	public static void createOptInTestContact() {
		Account acc = new Account();
		acc.Name = 'test name';
		acc.Website = 'www.test.cz';
		insert acc;
		
		Contact con = new Contact();
		con.LastName = 'Test';
		con.Email = 'test@test.test';
		con.AccountId = acc.Id;
		insert con;
	}


	/*
	public static ProjectOps_DTO_req setUpTrialEndDateInfo(String projectId, Date trialEndDate) {
		ProjectOps_DTO_req info = new ProjectOps_DTO_req();
		info.projectId = projectId;
		info.newTrialEndDate = trialEndDate;
		return info;
	}
	*/
}