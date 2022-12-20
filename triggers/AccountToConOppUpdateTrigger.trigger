/* 05052019 
Created by Jakub Hančin as an ad-hoc task by Jakub Kubiš from PB for certain Process Builders that handover this trigger.*/

trigger AccountToConOppUpdateTrigger on Account (after insert, after update)  { 

    Map<id, String> accIdWithOppValueMap = new Map<Id, String>();
    Map<id, String> accIdWithConValueMap = new Map<Id, String>();

	for(Account a : Trigger.new){
		if(a!=null){
            String oppNewVal = Trigger.newMap.get(a.Id).Opportunity_Apex_Trigger_Field__c;
            String conNewVal = Trigger.newMap.get(a.Id).Contact_Apex_Trigger_Field__c;
			if(Trigger.oldMap == null || Trigger.oldMap.get(a.Id)==null || oppNewVal != Trigger.oldMap.get(a.Id).Opportunity_Apex_Trigger_Field__c){
                accIdWithOppValueMap.put(a.id, oppNewVal);   
			}
			if(Trigger.oldMap == null || Trigger.oldMap.get(a.Id) == null || conNewVal != Trigger.oldMap.get(a.Id).Contact_Apex_Trigger_Field__c){
                accIdWithConValueMap.put(a.id, conNewVal); 
			}
		}
        
	}
    if(!accIdWithOppValueMap.isEmpty()) {
        AccountToOppUpdateBatch myOppBatch = new AccountToOppUpdateBatch(accIdWithOppValueMap); 
        database.executeBatch(myOppBatch, 50);
    }

    if(!accIdWithConValueMap.isEmpty()) {
        AccountToConUpdateBatch myConBatch = new AccountToConUpdateBatch(accIdWithConValueMap); 
        database.executeBatch(myConBatch, 50);
    }
    
}