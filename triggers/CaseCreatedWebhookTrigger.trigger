trigger CaseCreatedWebhookTrigger on Case (after insert) {
    String supportRecordTypeId = [SELECT Id FROM RecordType WHERE Name = 'Support' LIMIT 1]?.Id;
    if (supportRecordTypeId == NULL) {
        supportRecordTypeId = '012f4000000fWzBAAU';
    }
	if (
        Trigger.new[0].RecordTypeId == supportRecordTypeId // '012f4000000fWzBAAU' case for Support team
       ) {
        String url = 'https://app.productboard.com/api/provision_contract';
    
        String content = Webhook.jsonContent(Trigger.new, Trigger.old);
    
        Webhook.callout(url, content);
    }
}