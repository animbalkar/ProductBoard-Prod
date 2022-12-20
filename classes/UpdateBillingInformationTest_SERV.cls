public class UpdateBillingInformationTest_SERV {

	public static BillingInfo setUpBillingInfo(String projectId, boolean billingInfoFlag) {
        BillingInfo info = new BillingInfo();
        info.projectId = projectId;
        info.ccAddress = 'Test Street 123';
        info.ccCity = 'Test City';
        info.ccPostalCode = '12300';
        info.ccState = 'Test State';
        info.ccCountry = 'Test Country';
        info.ccBillingEmail = 'test@test.test';
        info.biCompanyName = 'Test Company';
        info.biAddress = 'Company Street 321';
        info.biCity = 'Company City';
        info.biPostalCode = '32100';
        info.biState = 'Company State';
        info.biCountry = 'Company Country';
        info.biVATNumber = '123465789';
        info.biAdditionalInfo = 'Test billing additional information.';

        return info;
    }
}