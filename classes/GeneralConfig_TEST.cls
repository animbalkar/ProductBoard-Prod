public class GeneralConfig_TEST {
	public static final List<String> PRODUCT_NAMES = new List<String>{ 'New idea', 'Startup', 'Scaling company', 'Trial', 'Starter' };
	public static final List<String> PRICEBOOK_NAMES = new List<String>{ 'monthly', 'yearly' };
	public static final Map<String, Integer> PRODUCT_PRICES = new Map<String, Integer>{
		'New idea_StandardPrice' => 59,
		'New idea_monthly' => 59,
		'New idea_yearly' => 49,
		'Startup_StandardPrice' => 119,
		'Startup_monthly' => 119,
		'Startup_yearly' => 99,
		'Trial_StandardPrice' => 0,
		'Trial_monthly' => 0,
		'Trial_yearly' => 0,
		'Starter_StandardPrice' => 0,
		'Starter_monthly' => 0,
		'Starter_yearly' => 0,
		'Scaling company_StandardPrice' => 299,
		'Scaling company_monthly' => 299,
		'Scaling company_yearly' => 249
	};
	public static final List<Event_Type__c> EVENT_TYPES = new List<Event_Type__c>{
		new Event_Type__c(Name = 'Activate User', API_Name__c = 'activateUser', Score__c = 20),
		new Event_Type__c(Name = 'Change User Role', API_Name__c = 'changeUserRole', Score__c = 30),
		new Event_Type__c(Name = 'Disable User', API_Name__c = 'disableUser', Score__c = 20),
		new Event_Type__c(Name = 'Downgrade Plan', API_Name__c = 'downgrade', Score__c = null),
		new Event_Type__c(Name = 'New User', API_Name__c = 'newUser', Score__c = 20),
		new Event_Type__c(Name = 'Remove User', API_Name__c = 'removeUser', Score__c = -20),
		new Event_Type__c(Name = 'Upgrade Plan', API_Name__c = 'upgrade', Score__c = null)
	};
	public static final Integer START_DATE_DELAY = -5;
	public static final String TEST_PROJECT_PB_ID = '987654321';
	public static final String TEST_USER_PB_ID = '1000001';
	public static final String TEST_PROJECT_PB_ID2 = '987654322';
	public static final String TEST_MASTER_EMAIL = 'test-email@test-email.test';
	public static final String TEST_NEW_USER_EMAIL = 'test-email1@test1-email.test1';
	public static final String TEST_NEW_USER_EMAIL2 = 'test-email2@test2-email.test2';
	public static final String TEST_PROJECT_NAME = 'test-project.productboard.com';
	public static final String TEST_PROJECT_NAME_FOR_UPDATE = 'name';
	public static final String TEST_PROJECT_NAME_FOR_UPDATE_FULL = 'name.productboard.com';
	public static final String SYSTEM_ACCOUNT_NAME = 'Customers_system_account';
	public static final String TEST_LAST_NAME = 'Name';
	public static final String TEST_COMPANY = 'Test Company';
}