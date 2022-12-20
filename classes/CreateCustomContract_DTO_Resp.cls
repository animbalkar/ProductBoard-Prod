public class CreateCustomContract_DTO_Resp  {
	@AuraEnabled public Id newContractId { get; set; }
	@AuraEnabled public Id actualQuoteId { get; set; }
	@AuraEnabled public Id oppId { get; set; }
	//public Project__c project { get; set; }

	@AuraEnabled public Boolean success;
	@AuraEnabled public String screenMessage { get; set; }
	@AuraEnabled public Boolean disableContractButton { get; set; }
	@AuraEnabled public Boolean contractExists { get; set; }

	@AuraEnabled public String quoteStatusImage { get; set; }
	@AuraEnabled public String quoteSyncImage { get; set; }
	@AuraEnabled public String docuStatusImage { get; set; }
	@AuraEnabled public String contractExistsImage { get; set; } 

	public CreateCustomContract_DTO_Resp() {}
}