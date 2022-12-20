@isTest 
private class EraseOldIntegrationLogs_TEST {

    @testSetup
    static void testSetup() {
        List<IntegrationLog__c> ilList = new List<IntegrationLog__c>();
        for (Integer i = 0; i < 3; i++){
            IntegrationLog__c ilSuc = new IntegrationLog__c();
            ilSuc.Class__c = 'EventsOps';
            ilSuc.Success__c = true;
            ilSuc.Method_Parameters__c = 'param1: "' + i + '"';
            ilSuc.Description__c = 'Logs description inserted.';
            ilSuc.Method__c ='addNewUser';
            ilList.add(ilSuc);

            IntegrationLog__c ilFai = new IntegrationLog__c();
            ilFai.Class__c = 'EventsOps';
            ilFai.Success__c = false;
            ilFai.Method_Parameters__c = 'param1: "' + i + '"';
            ilFai.Description__c = 'Logs description inserted.';
            ilFai.Method__c ='addNewUser';
            ilList.add(ilFai);
        }
        insert ilList;
        System.debug('ilList--->' + ilList );
    }

    @isTest
    private static void eraseSuccesfullLogs() {
        System.Test.startTest(); 
        EraseOldIntegrationLogs myBatch = new EraseOldIntegrationLogs(0,true);
        Id batchId = Database.executeBatch(myBatch);
        System.Test.stopTest();
        //zkontrolovat jestli 0 v erase old znamena vsechny.. nebo je problem s casem
        List<IntegrationLog__c> resultSuccesful = [SELECT id,Method__c FROM IntegrationLog__c WHERE Success__c = true];
        List<IntegrationLog__c> resultFailed = [SELECT id,Method__c FROM IntegrationLog__c WHERE Success__c = false];
        System.debug('resultSuccesful--->' + resultSuccesful);
        System.debug('resultFailed--->' + resultFailed);
        System.assertEquals(1, resultSuccesful.size());
        System.assertEquals('eraseSuccesfulLogs', resultSuccesful[0].Method__c);
        System.assertEquals(3, resultFailed.size());
    }

    @isTest
    private static void eraseFailedLogs() {
        System.Test.startTest(); 
        EraseOldIntegrationLogs myBatch = new EraseOldIntegrationLogs(0,false);
        Id batchId = Database.executeBatch(myBatch);
        System.Test.stopTest();

        List<IntegrationLog__c> resultSuccesful = [SELECT id,Method__c FROM IntegrationLog__c WHERE Success__c = true];
        List<IntegrationLog__c> resultFailed = [SELECT id,Method__c FROM IntegrationLog__c WHERE Success__c = false];
        System.debug('resultSuccesful--->' + resultSuccesful);
        System.debug('resultFailed--->' + resultFailed);

        System.assertEquals(0, resultFailed.size());
        System.assertEquals('eraseFailedLogs', resultSuccesful[3].Method__c);
        System.assertEquals(4, resultSuccesful.size());

    }
}