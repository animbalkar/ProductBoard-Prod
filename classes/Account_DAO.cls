public class Account_DAO  {
	
	public static Account getAccountById(Id accId) {
		List<Account> accounts = [SELECT AccountSource,Legacy_Account_Source_March_2019__c,Account_External_ID__c,Additional_Billing_Info__c,BillingAddress,BillingCity,
		BillingCountry,BillingGeocodeAccuracy,BillingLatitude,BillingLongitude,BillingPostalCode,BillingState,BillingStreet,cbit__ClearbitDomain__c,
		cbit__ClearbitReady__c,cbit__Clearbit__c,cbit__CreatedByClearbit__c,City__c,Company_Description__c,Country_Code__c,Country__c,CreatedById,
		CreatedDate,Customer_Life_Cycle_Stage__c,Customer_Type_Changed__c,Customer_Type_VIP_assigned__c,Customer_Type__c,Description,Description_Author__c,
		Domain_Aliases__c,Email_Addresses__c,Email_Provider__c,Employees_Range__c,Facebook__c,Fiscal_Year_Ends__c,Founded_Year__c,Id,Indexed_At__c,
		Industry,Industry_Group__c,Industry__c,IsDeleted,Jigsaw,JigsawCompanyId,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,
		LastViewedDate,Legal_Name__c,LinkedIn__c,Location__c,Logo__c,MasterRecordId,Name,NumberOfEmployees,OwnerId,ParentId,Parent_Company_Website__c,
		Phone,Phone_Numbers__c,Phone__c,PhotoUrl,Postal_Code__c,Raised__c,Referenceable__c,Reference_type__c,Sector__c,ShippingAddress,ShippingCity,
		ShippingCountry,ShippingGeocodeAccuracy,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStreet,SicDesc,State_Code__c,
		State__c,Street_Number__c,Street__c,Sub_industry__c,Sub_premise__c,Success_Manager__c,SystemModstamp,Tags__c,Technologies__c,Ticker__c,
		Time_Zone__c,Type,UTC_Offset__c,VAT__c,Website,Website_Heading__c,Website_Title__c, MRR__c, ARR__c
		FROM Account
		WHERE Id = :accId];

		if(accounts.isEmpty()) {
			throw new ProductboardException('Account with ID ['+ accId +'] was not found.', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		if(accounts.size() > 1) {
			throw new ProductboardException('There are more accounts with ID ['+ accId +'] in SF.', ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND);
		}
		return accounts.get(0);
	}

	public static Account getSystemAccount() {
		List<Account> accounts = [SELECT AccountSource,Legacy_Account_Source_March_2019__c,Account_External_ID__c,Additional_Billing_Info__c,BillingAddress,BillingCity,
		BillingCountry,BillingGeocodeAccuracy,BillingLatitude,BillingLongitude,BillingPostalCode,BillingState,BillingStreet,cbit__ClearbitDomain__c,
		cbit__ClearbitReady__c,cbit__Clearbit__c,cbit__CreatedByClearbit__c,City__c,Company_Description__c,Country_Code__c,Country__c,CreatedById,
		CreatedDate,Customer_Life_Cycle_Stage__c,Customer_Type_Changed__c,Customer_Type_VIP_assigned__c,Customer_Type__c,Description,Description_Author__c,
		Domain_Aliases__c,Email_Addresses__c,Email_Provider__c,Employees_Range__c,Facebook__c,Fiscal_Year_Ends__c,Founded_Year__c,Id,Indexed_At__c,
		Industry,Industry_Group__c,Industry__c,IsDeleted,Jigsaw,JigsawCompanyId,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,
		LastViewedDate,Legal_Name__c,LinkedIn__c,Location__c,Logo__c,MasterRecordId,Name,NumberOfEmployees,OwnerId,ParentId,Parent_Company_Website__c,
		Phone,Phone_Numbers__c,Phone__c,PhotoUrl,Postal_Code__c,Raised__c,Referenceable__c,Reference_type__c,Sector__c,ShippingAddress,ShippingCity,
		ShippingCountry,ShippingGeocodeAccuracy,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStreet,SicDesc,State_Code__c,
		State__c,Street_Number__c,Street__c,Sub_industry__c,Sub_premise__c,Success_Manager__c,SystemModstamp,Tags__c,Technologies__c,Ticker__c,
		Time_Zone__c,Type,UTC_Offset__c,VAT__c,Website,Website_Heading__c,Website_Title__c, MRR__c, ARR__c
		FROM Account
		WHERE Name = 'Customers_system_account'];

		if(accounts.isEmpty()) {
			throw new ProductboardException('System account [ Customers_system_account ] was not found.', ApiConstants.CODE_FAILED_RECORD_NOT_FOUND);
		}
		if(accounts.size() > 1) {
			throw new ProductboardException('There is more than one system account [ Customers_system_account ] in SF.', ApiConstants.CODE_FAILED_MORE_RECORDS_FOUND);
		}
		return accounts.get(0);
	}

	public static List<Account> getAllAccounts() {
		List<Account> accounts = [SELECT AccountSource,Legacy_Account_Source_March_2019__c,Account_External_ID__c,Additional_Billing_Info__c,BillingAddress,BillingCity,
		BillingCountry,BillingGeocodeAccuracy,BillingLatitude,BillingLongitude,BillingPostalCode,BillingState,BillingStreet,cbit__ClearbitDomain__c,
		cbit__ClearbitReady__c,cbit__Clearbit__c,cbit__CreatedByClearbit__c,City__c,Company_Description__c,Country_Code__c,Country__c,CreatedById,
		CreatedDate,Customer_Life_Cycle_Stage__c,Customer_Type_Changed__c,Customer_Type_VIP_assigned__c,Customer_Type__c,Description,Description_Author__c,
		Domain_Aliases__c,Email_Addresses__c,Email_Provider__c,Employees_Range__c,Facebook__c,Fiscal_Year_Ends__c,Founded_Year__c,Id,Indexed_At__c,
		Industry,Industry_Group__c,Industry__c,IsDeleted,Jigsaw,JigsawCompanyId,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,
		LastViewedDate,Legal_Name__c,LinkedIn__c,Location__c,Logo__c,MasterRecordId,Name,NumberOfEmployees,OwnerId,ParentId,Parent_Company_Website__c,
		Phone,Phone_Numbers__c,Phone__c,PhotoUrl,Postal_Code__c,Raised__c,Referenceable__c,Reference_type__c,Sector__c,ShippingAddress,ShippingCity,
		ShippingCountry,ShippingGeocodeAccuracy,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStreet,SicDesc,State_Code__c,
		State__c,Street_Number__c,Street__c,Sub_industry__c,Sub_premise__c,Success_Manager__c,SystemModstamp,Tags__c,Technologies__c,Ticker__c,
		Time_Zone__c,Type,UTC_Offset__c,VAT__c,Website,Website_Heading__c,Website_Title__c, MRR__c, ARR__c
		FROM Account];
				
		return accounts;
	}

	public static void insertAccount(Account acc) {

		try {
			insert acc;
			System.debug('Account_DAO: insert - account was successfully inserted.');
		}
		catch(DmlException e) {
			System.debug('Account_DAO: insert - account ended with errors');
			throw new ProductboardException('Insert account was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}

	
	public static void updateAccount(Account acc) {

		try {
			update acc;
			System.debug('Account_DAO: update - account was successfully updated.');
		}
		catch(DmlException e) {
			System.debug('Account_DAO: update - account ended with errors');
			throw new ProductboardException('Update account was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}

	}

	

	public static Account getAccountByName(String accName){
		List<Account> accs = [SELECT AccountSource,Legacy_Account_Source_March_2019__c,Account_External_ID__c,Additional_Billing_Info__c,BillingAddress,BillingCity,
		BillingCountry,BillingGeocodeAccuracy,BillingLatitude,BillingLongitude,BillingPostalCode,BillingState,BillingStreet,cbit__ClearbitDomain__c,
		cbit__ClearbitReady__c,cbit__Clearbit__c,cbit__CreatedByClearbit__c,City__c,Company_Description__c,Country_Code__c,Country__c,CreatedById,
		CreatedDate,Customer_Life_Cycle_Stage__c,Customer_Type_Changed__c,Customer_Type_VIP_assigned__c,Customer_Type__c,Description,Description_Author__c,
		Domain_Aliases__c,Email_Addresses__c,Email_Provider__c,Employees_Range__c,Facebook__c,Fiscal_Year_Ends__c,Founded_Year__c,Id,Indexed_At__c,
		Industry,Industry_Group__c,Industry__c,IsDeleted,Jigsaw,JigsawCompanyId,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,
		LastViewedDate,Legal_Name__c,LinkedIn__c,Location__c,Logo__c,MasterRecordId,Name,NumberOfEmployees,OwnerId,ParentId,Parent_Company_Website__c,
		Phone,Phone_Numbers__c,Phone__c,PhotoUrl,Postal_Code__c,Raised__c,Referenceable__c,Reference_type__c,Sector__c,ShippingAddress,ShippingCity,
		ShippingCountry,ShippingGeocodeAccuracy,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStreet,SicDesc,State_Code__c,
		State__c,Street_Number__c,Street__c,Sub_industry__c,Sub_premise__c,Success_Manager__c,SystemModstamp,Tags__c,Technologies__c,Ticker__c,
		Time_Zone__c,Type,UTC_Offset__c,VAT__c,Website,Website_Heading__c,Website_Title__c
		FROM Account WHERE Name = :accName];

		return accs.get(0);
	}

}