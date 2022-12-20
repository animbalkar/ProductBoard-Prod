global class EraseOldIntegrationLogsSchedulable implements Schedulable {
    /**
     * @description Executes the scheduled Apex job. 
     * @param sc contains the job ID
     */ 
    global void execute(SchedulableContext sc) {
        Integer erasePeriodInDaysForStatusTrue = 1; // 0 = today and before
        Integer erasePeriodInDaysForStatusFalse = 1;
        
        EraseOldIntegrationLogs eraseSuccesfullLogs = new EraseOldIntegrationLogs(erasePeriodInDaysForStatusTrue, true);
        EraseOldIntegrationLogs eraseFailedLogs = new EraseOldIntegrationLogs(erasePeriodInDaysForStatusFalse,false);

        database.executebatch(eraseSuccesfullLogs,500);
        database.executebatch(eraseFailedLogs,500);
    }
}