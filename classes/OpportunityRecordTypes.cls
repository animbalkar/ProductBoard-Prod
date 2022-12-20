public class OpportunityRecordTypes  {
	public static final Id self_service = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Self Service').getRecordTypeId();
	public static final Id standard = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
}