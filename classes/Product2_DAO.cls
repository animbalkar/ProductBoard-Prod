public class Product2_DAO {
	public static List<Product2> getProduct2ById(Id product2Id) {
		return [
			SELECT
				Admins__c,
				Contributors__c,
				CreatedById,
				CreatedDate,
				Description,
				DisplayUrl,
				Editors__c,
				ExternalDataSourceId,
				ExternalId,
				Family,
				Id,
				IsActive,
				IsDeleted,
				LastModifiedById,
				LastModifiedDate,
				LastReferencedDate,
				LastViewedDate,
				Name,
				ProductCode,
				Products__c,
				QuantityUnitOfMeasure,
				Response_Time__c,
				/*StockKeepingUnit,*/ Support_Hours__c,
				Support__c,
				SystemModstamp,
				Viewers__c
			FROM Product2
			WHERE Id = :product2Id
		];
	}

	public static Product2 getProduct2ById2(Id product2Id) {
		List<Product2> products = [
			SELECT
				Admins__c,
				Contributors__c,
				CreatedById,
				CreatedDate,
				Description,
				DisplayUrl,
				Editors__c,
				ExternalDataSourceId,
				ExternalId,
				Family,
				Id,
				IsActive,
				IsDeleted,
				LastModifiedById,
				LastModifiedDate,
				LastReferencedDate,
				LastViewedDate,
				Name,
				ProductCode,
				Products__c,
				QuantityUnitOfMeasure,
				Response_Time__c,
				/*StockKeepingUnit,*/ Support_Hours__c,
				Support__c,
				SystemModstamp,
				Viewers__c
			FROM Product2
			WHERE Id = :product2Id
		];

		if (products.isEmpty()) {
			throw new ProductboardException(
				'No product with ID [ ' +
				product2Id +
				' ] was found.',
				ApiConstants.CODE_FAILED_RECORD_NOT_FOUND
			);
		}
		if (products.size() > 1) {
			throw new ProductboardException(
				'More than 1 product with ID [ ' +
				product2Id +
				' ] was found.',
				ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND
			);
		}
		return products.get(0);
	}

	public static Product2 getProduct2ByIdEventsOps(Id product2Id) {
		Product2 returnProduct = null;
		List<Product2> products = [
			SELECT
				Admins__c,
				Contributors__c,
				CreatedById,
				CreatedDate,
				Description,
				DisplayUrl,
				Editors__c,
				ExternalDataSourceId,
				ExternalId,
				Family,
				Id,
				IsActive,
				IsDeleted,
				LastModifiedById,
				LastModifiedDate,
				LastReferencedDate,
				LastViewedDate,
				Name,
				ProductCode,
				Products__c,
				QuantityUnitOfMeasure,
				Response_Time__c,
				/*StockKeepingUnit,*/ Support_Hours__c,
				Support__c,
				SystemModstamp,
				Viewers__c
			FROM Product2
			WHERE Id = :product2Id
		];

		if (products.size() > 1) {
			throw new ProductboardException(
				'More than 1 product with ID [ ' +
				product2Id +
				' ] was found.',
				ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND
			);
		}
		if (products.size() == 1) {
			returnProduct = products.get(0);
		}
		return returnProduct;
	}

	public static Product2 getTrialProduct() {
		Product2 trial = [SELECT Id, Name, Family FROM Product2 WHERE Name = 'Trial' LIMIT 1];
		return trial;
	}

	public static Product2 getStarterProduct() {
		Product2 starter = [SELECT Id, Name, Family FROM Product2 WHERE Name = 'Starter' LIMIT 1];
		return starter;
	}

	public static Product2 getProductByPlanAndVersion(String plan, String planVersion, Id productId) {
		List<Product2> pbProduct;
		if (plan != null && planVersion != null) {
			pbProduct = [SELECT Id, Name, Family FROM Product2 WHERE Name = :plan AND Family = :planVersion AND IsActive = TRUE LIMIT 1];
		} else if (plan != null && planVersion == null) {
			pbProduct = [SELECT Id, Name, Family FROM Product2 WHERE Name = :plan AND Family = 'Custom Plans' AND IsActive = TRUE LIMIT 1];
		} else {
			pbProduct = [SELECT Id, Name, Family FROM Product2 WHERE Id = :productId AND IsActive = TRUE LIMIT 1];
		}
		if (pbProduct.isEmpty()) {
			throw new ProductboardException(
				'No product was found for plan [ ' +
				plan +
				' ] and plan version [ ' +
				planVersion +
				' ].',
				ApiConstants.CODE_FAILED_RECORD_NOT_FOUND
			);
		}

		return pbProduct.get(0);
	}

	public static void insertProducts(List<Product2> prods) {
		try {
			insert prods;
			System.debug('Product2_DAO: insert - List of products was successfully inserted.');
		} catch (DmlException e) {
			System.debug('Product2_DAO: insert - List of products ended with errors');
			throw new ProductboardException(
				'Insert list of products was ended with errors: ' + e.getMessage(),
				ApiConstants.CODE_FAILED_DML_ERROR
			);
		}
	}
}