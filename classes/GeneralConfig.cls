public class GeneralConfig  {
	public static final Id CREDIT_CARD = Schema.SObjectType.Contract.getRecordTypeInfosByName().get('Credit Card').getRecordTypeId();
	public static final Id CUSTOM_CONTRACT = Schema.SObjectType.Contract.getRecordTypeInfosByName().get('Custom Contract').getRecordTypeId();
}