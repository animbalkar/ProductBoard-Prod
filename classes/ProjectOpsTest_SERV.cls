public class ProjectOpsTest_SERV  {

	public static ProjectOps_DTO_req setUpProjectUpdateInfo(String projectId) {
		ProjectOps_DTO_req info = new ProjectOps_DTO_req();
		info.teamUrl = GeneralConfig_TEST.TEST_PROJECT_NAME_FOR_UPDATE;
		info.projectId = projectId;
		return info;
	}

	public static ProjectOps_DTO_req setUpTrialEndDateInfo(String projectId, Date trialEndDate) {
		ProjectOps_DTO_req info = new ProjectOps_DTO_req();
		info.projectId = projectId;
		info.trialEndDate = trialEndDate;
		return info;
	}

	public static ProjectOps_DTO_req setUpDeleteProjectInfo(String projectpbId) {
		ProjectOps_DTO_req info = new ProjectOps_DTO_req();
		info.projectId = projectpbId;
		return info;
	}
}