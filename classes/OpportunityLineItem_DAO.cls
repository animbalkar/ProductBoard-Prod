public class OpportunityLineItem_DAO  {


	public static List<OpportunityLineItem> getAllOppLineItemsByOppId(Id oppId) {
		List<OpportunityLineItem> lineItems = [SELECT CreatedById,CreatedDate,Description,Discount_Credit__c,Discount_Fixed__c,
		Discount_Length_ms__c,Discount_Percent__c,Discount_Type__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,ListPrice,List_Price_TMP__c,
		Name,OpportunityId,Period__c,PricebookEntryId,Price_Without_Discount__c,Product2Id,ProductCode,Quantity,Remaining_Credit__c,ServiceDate,
		SortOrder,SystemModstamp,TotalPrice,UnitPrice
		FROM OpportunityLineItem
		WHERE OpportunityId = :oppId];
		
		return lineItems;
	}

	public static OpportunityLineItem getOppLineItemByOppId(Id oppId) {
		List<OpportunityLineItem> lineItems = [SELECT CreatedById,CreatedDate,Description,Discount_Credit__c,Discount_Fixed__c,
		Discount_Length_ms__c,Discount_Percent__c,Discount_Type__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,ListPrice,List_Price_TMP__c,
		Name,OpportunityId,Period__c,PricebookEntryId,Price_Without_Discount__c,Product2Id,ProductCode,Quantity,Remaining_Credit__c,ServiceDate,
		SortOrder,SystemModstamp,TotalPrice,UnitPrice
		FROM OpportunityLineItem
		WHERE OpportunityId = :oppId];

		if(lineItems.isEmpty()) {
			throw new ProductboardException('Opp line item with Opp ID ['+ oppId +'] was not found.', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		if(lineItems.size() > 1) {
			throw new ProductboardException('There are more opp line items with Opp ID ['+ oppId +'] in SF.', ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND);
		}
		return lineItems.get(0);
	}

	public static void insertOpportunityLineItem(OpportunityLineItem oppLineItem) {

		try {
			insert oppLineItem;
			System.debug('OpportunityLineItem_DAO: insert - OpportunityLineItem was successfully inserted.');
		}
		catch(DmlException e) {
			System.debug('OpportunityLineItem_DAO: insert - OpportunityLineItem ended with errors');
			throw new ProductboardException('Insert OpportunityLineItem was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}

   
}