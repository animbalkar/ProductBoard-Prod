global class ExpireTrialSchedulable implements Schedulable {
	/**
	 * @description Executes the scheduled Apex job. 
	 * @param sc contains the job ID
	 */ 
	global void execute(SchedulableContext sc) {
		ExpireTrialBatch et = new ExpireTrialBatch();
		Database.executeBatch(et, 500);
	}
}