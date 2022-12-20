public class UpdateBillingInformation_SERV {
	public static void updateBillingFields(BillingInfo info, IntegrationLog__c il) {
		Project__c existingProject = Project_DAO.getProjectByPBIdWithExc(info.projectId);
		il.Description__c += '\n- Project found. id: ' + existingProject.id;
		existingProject.CC_Address__c = info.ccAddress;
		existingProject.CC_City__c = info.ccCity;
		existingProject.CC_Postal_Code__c = info.ccPostalCode;
		existingProject.CC_State__c = info.ccState;
		existingProject.CC_Country__c = info.ccCountry;
		existingProject.CC_Billing_Email__c = info.ccBillingEmail;
		existingProject.BI_Company_Name__c = info.biCompanyName;
		existingProject.BI_Address__c = info.biAddress;
		existingProject.BI_City__c = info.biCity;
		existingProject.BI_Postal_Code__c = info.biPostalCode;
		existingProject.BI_State__c = info.biState;
		existingProject.BI_Country__c = info.biCountry;
		existingProject.BI_VAT_Number__c = info.biVATNumber;
		existingProject.BI_Additional_Info__c = info.biAdditionalInfo;
		update existingProject;
		il.Description__c += '\n- Project updated.';
	}
}