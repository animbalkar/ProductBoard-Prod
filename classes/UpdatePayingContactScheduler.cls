global class UpdatePayingContactScheduler implements Schedulable {
	/**
	 * @description Executes the scheduled Apex job. 
	 * @param sc contains the job ID
	 */ 
	global void execute(SchedulableContext sc) {
		updatePayingCustomerOnContact_BATCH batchPhase1 = new updatePayingCustomerOnContact_BATCH('phase1');
		Database.executeBatch(batchPhase1, 300);

		updatePayingCustomerOnContact_BATCH batchPhase2 = new updatePayingCustomerOnContact_BATCH('phase2');
		Database.executeBatch(batchPhase2, 300);
	}
}