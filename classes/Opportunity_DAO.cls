public class Opportunity_DAO {

	public static List<Opportunity> getOppsByListOfIds(List<Id> ids) {
		List<Opportunity> opps = [SELECT AccountId, Amount, ARR__c, Budget_Confirmed__c, CampaignId, CloseDate, ContractId, CreatedById,
		                          CreatedDate, Description, Discovery_Completed__c, Fiscal, FiscalQuarter, FiscalYear, ForecastCategory, ForecastCategoryName,
		                          HasOpenActivity, HasOpportunityLineItem, HasOverdueTask, Id, IsClosed, IsDeleted, IsWon, LastActivityDate, LastModifiedById,
		                          LastModifiedDate, LastReferencedDate, LastViewedDate, LeadSource, Loss_Reason__c, MRR__c, Name, NextStep, Opportunity_Internal_ID__c,
		                          OwnerId, Pricebook2Id, Price_Book__c, Probability, RecordTypeId, ROI_Analysis_Completed__c, StageName, Subtype__c,
		                          SyncedQuoteId, SystemModstamp, Type
		                          FROM Opportunity
		                          WHERE Id IN :ids];

		return opps;
	}

	public static List<Opportunity> getOppsBySetOfIds(Set<Id> ids) {
		List<Opportunity> opps = [SELECT AccountId, Amount, ARR__c, Budget_Confirmed__c, CampaignId, CloseDate, ContractId, CreatedById,
		                          CreatedDate, Description, Discovery_Completed__c, Fiscal, FiscalQuarter, FiscalYear, ForecastCategory, ForecastCategoryName,
		                          HasOpenActivity, HasOpportunityLineItem, HasOverdueTask, Id, IsClosed, IsDeleted, IsWon, LastActivityDate, LastModifiedById,
		                          LastModifiedDate, LastReferencedDate, LastViewedDate, LeadSource, Loss_Reason__c, MRR__c, Name, NextStep, Opportunity_Internal_ID__c,
		                          OwnerId, Pricebook2Id, Price_Book__c, Probability, RecordTypeId, ROI_Analysis_Completed__c, StageName, Subtype__c,
		                          SyncedQuoteId, SystemModstamp, Type
		                          FROM Opportunity
		                          WHERE Id IN :ids];

		return opps;
	}

	public static List<Opportunity> getOpportunityByProjectId(Id projId) {
		return [SELECT AccountId, Amount, ARR__c, Budget_Confirmed__c, CampaignId, CloseDate, ContractId, CreatedById,
		                          CreatedDate, Description, Discovery_Completed__c, Fiscal, FiscalQuarter, FiscalYear, ForecastCategory, ForecastCategoryName,
		                          HasOpenActivity, HasOpportunityLineItem, HasOverdueTask, Id, IsClosed, IsDeleted, IsWon, LastActivityDate, LastModifiedById,
		                          LastModifiedDate, LastReferencedDate, LastViewedDate, LeadSource, Loss_Reason__c, MRR__c, Name, NextStep, Opportunity_Internal_ID__c,
		                          OwnerId, Pricebook2Id, Price_Book__c, Probability, RecordTypeId, ROI_Analysis_Completed__c, StageName, Subtype__c,
		                          SyncedQuoteId, SystemModstamp, Type
		                          FROM Opportunity
		                          WHERE Project__c = :projId ORDER BY CreatedDate ASC];
	}

	public static List<Opportunity> getOpenOpportunitiesByProjectId(Id projId) {
		return [
			SELECT OwnerId
			FROM Opportunity
			WHERE Project__c = :projId AND IsClosed = false
			ORDER BY CreatedDate ASC
		];
	}

	public static void insertOpportunity(Opportunity opp) {
		try {
			insert opp;
		}
		catch(DmlException e) {
			throw new ProductboardException('Insert Opportunity was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}

}