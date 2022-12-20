@isTest 
private class ExpireTrial_TEST {
	
	@TestSetup
	private static void testSetup() {
		DataFactory_TEST.init();
	}

	@isTest
	private static void testScheduleExpireTrial() {
		ExpireTrialSchedulable sch = new ExpireTrialSchedulable();
		String schTime = '0 0 23 * * ?';
		System.schedule('Expire Trial Test Scheduler',schTime,sch);
	}

	@isTest
	private static void testExpireTrialBatch() {
		Project__c pr = DataFactory_TEST.createTrialProject();
		pr.Trial_End_Date__c = Date.today().addDays(-20);
		update pr;


		ExpireTrialBatch etb = new ExpireTrialBatch();
		database.executeBatch(etb,100);
	}

}