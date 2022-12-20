public class PriceBookEntry_DAO  {

	public static PricebookEntry getPriceBookByProductAndPriceBook(Id productId, Id priceBookId) {
		List<PricebookEntry> pbPricebookEntry = [SELECT Id, ProductCode, Product2Id, UnitPrice FROM PricebookEntry WHERE Product2Id = :productId AND Pricebook2Id = :priceBookId];
		if (pbPricebookEntry.isEmpty()) {
			throw new ProductboardException('No PriceBookEntry was found for productId [ ' + productId + ' ] and  priceBookId [ ' + priceBookId + ' ].', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		return pbPricebookEntry.get(0);

	}

	public static void insertPriceBookEntry(PricebookEntry entry) {

		try {
			insert entry;
		}
		catch(DmlException e) {
			throw new ProductboardException('Insert PricebookEntry was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}

	public static void insertPriceBookEntries(List<PricebookEntry> entries) {

		try {
			insert entries;
		}
		catch(DmlException e) {
			throw new ProductboardException('Insert PriceBookEntries was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}

}