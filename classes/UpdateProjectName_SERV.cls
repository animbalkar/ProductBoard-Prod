public class UpdateProjectName_SERV {
	public static List<String> updateProjectName(String newProjectName, String projectId, String projectBaseUrl) {
		List<String> returnMessage = new List<String>();
		if (newProjectName == null || projectId == null) {
			returnMessage.add('The API paramaters was not set correctly.');
		} else {
			Project__c existingProject = Project_DAO.getProjectByPBIdWithExc(projectId);
			existingProject.Name = newProjectName + projectBaseUrl;
			existingProject.Team_URL__c = newProjectName + projectBaseUrl;
			update existingProject;
			returnMessage.add('The project name on the project with ID ' + projectId + ' was updated.');
		}
		return returnMessage;
	}
}