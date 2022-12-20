global class ProjectOps {
	global class ProjectInfo {
		webService String teamUrl;
		webService String projectId;
		webService Date trialEndDate;
		webService String hash;
	}

	webService static String updateProjectName(ProjectInfo info) {
		IntegrationLog__c il = Utils.createIntegrationLog('ProjectOps', 'updateProjectName', JSON.serialize(info));
		ApiResponseDTO response = new ApiResponseDTO();
		System.Savepoint sp = Database.setSavepoint();

		try {
			ProjectOps_SERV.updateProjectName(info.teamUrl, info.projectId, il);
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_SUCCESS,
				ApiConstants.MSG_SUCCESS_PROJECT_NAME_UPDATE,
				null,
				null,
				null
			);
		} catch (ProductboardException e) {
			ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null);
			Database.rollback(sp);
		} catch (Exception e) {
			il.Description__c += '\nFAILED - StackTrace: ' + e.getStackTraceString();
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_FAILED_GENERAL,
				ApiConstants.MSG_FAILED_GENERAL,
				il,
				e.getMessage(),
				null
			);
			Database.rollback(sp);
		} finally {
			Utils.updateIntegrationLog(il, response);
			ApiRequestController.logApiRequest(
				JSON.serialize(info),
				'ProjectInfo',
				il.Success__c,
				il.Method__c,
				il.Description__c,
				response
			);
		}
		return JSON.serialize(response);
	}

	webService static String deleteSpace(ProjectInfo info) {
		IntegrationLog__c il = Utils.createIntegrationLog('ProjectOps', 'deleteSpace', JSON.serialize(info));
		ApiResponseDTO response = new ApiResponseDTO();
		System.Savepoint sp = Database.setSavepoint();

		try {
			Project__c deletedProject = Project_DAO.getProjectByPBIdWithExc(info.projectId);
			il.Description__c += '\n- Project found. id: ' + deletedProject.Id;

			if (deletedProject.Deleted__c) {
				il.Description__c += '\n- Project has been already deleted.';
			} else {
				DeleteProject_SERV.markProjectAndPusAsDeleted(deletedProject, info.hash, il);
			}
			ApiResponseDTO.createResponse(response, ApiConstants.CODE_SUCCESS, ApiConstants.MSG_SUCCESS_PROJECT_DELETE, null, null, null);
		} catch (ProductboardException e) {
			ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null);
			Database.rollback(sp);
		} catch (Exception e) {
			il.Description__c += '\nFAILED - StackTrace: ' + e.getStackTraceString();
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_FAILED_GENERAL,
				ApiConstants.MSG_FAILED_GENERAL,
				il,
				e.getMessage(),
				null
			);
			Database.rollback(sp);
		} finally {
			Utils.updateIntegrationLog(il, response);
			ApiRequestController.logApiRequest(
				JSON.serialize(info),
				'ProjectInfo',
				il.Success__c,
				il.Method__c,
				il.Description__c,
				response
			);
		}

		return JSON.serialize(response);
	}

	webService static String updateTrialEndDate(ProjectInfo info) {
		IntegrationLog__c il = Utils.createIntegrationLog('ProjectOps', 'updateTrialEndDate', JSON.serialize(info));
		ApiResponseDTO response = new ApiResponseDTO();
		System.Savepoint sp = Database.setSavepoint();

		try {
			ProjectOps_SERV.updateTrialEndDate(info.trialEndDate, info.projectId, il);
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_SUCCESS,
				ApiConstants.MSG_SUCCESS_TRIAL_END_DATE_UPDATE,
				null,
				null,
				null
			);
		} catch (ProductboardException e) {
			ApiResponseDTO.createResponse(response, e.status, e.getMessage(), il, null, null);
			Database.rollback(sp);
		} catch (Exception e) {
			il.Description__c += '\nFAILED - StackTrace: ' + e.getStackTraceString();
			ApiResponseDTO.createResponse(
				response,
				ApiConstants.CODE_FAILED_GENERAL,
				ApiConstants.MSG_FAILED_GENERAL,
				il,
				e.getMessage(),
				null
			);
			Database.rollback(sp);
		} finally {
			Utils.updateIntegrationLog(il, response);
			ApiRequestController.logApiRequest(
				JSON.serialize(info),
				'ProjectInfo',
				il.Success__c,
				il.Method__c,
				il.Description__c,
				response
			);
		}

		return JSON.serialize(response);
	}
}