public class PriceBook_DAO {

	public static Pricebook2 getPriceBookByFrequency(String dtoFrequency, String projectFrequency) {
		String frequency;
		if (dtoFrequency == null) {
			frequency = projectFrequency;
		} else {
			frequency = dtoFrequency;
		}
		List<Pricebook2> pbPriceBook = [Select Id, Name from Pricebook2 where Name = :frequency LIMIT 1];
		if (pbPriceBook.isEmpty()) {
			throw new ProductboardException('No PriceBook was found for frequency [ ' + frequency + ' ].', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		return pbPriceBook.get(0);

	}

    public static Pricebook2 getPriceBookById(id pricebookId) {
        Pricebook2 pricebook = [Select Id, Name from Pricebook2 where id = :pricebookId LIMIT 1];
        return pricebook;
    }
	
	public static void insertPriceBooks(List<Pricebook2> priceBooks) {

		try {
			insert priceBooks;
			System.debug('PriceBook_DAO: insert - list of pricebooks was successfully inserted.');
		}
		catch(DmlException e) {
			System.debug('PriceBook_DAO: insert - list of pricebooks ended with errors');
			throw new ProductboardException('Insert list of pricebooks was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}
 }