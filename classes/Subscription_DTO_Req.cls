global class Subscription_DTO_Req {
	//Base info        
		WebService String userEmail;
		WebService String projectId;
		WebService Integer amountOfUsers;
		WebService String frequency; // pricebook - na základě toho budeme počítat slevu
		WebService String plan; // = produkt
		WebService String planVersion; // = product family
		WebService String discountValue; // = credit, percentní sleva
		WebService String discountType; // credit, amount_off, percent_off
		webService String discountSubtype;
		WebService String discountLength; // pouze uložit do Discount Length a Remaining Length
		WebService String stripeInvoiceId;

		//Credit card 
		WebService boolean billingInfoFlag;
		WebService String ccAddress;
		WebService String ccCity;
		WebService String ccPostalCode;
		WebService String ccState;
		WebService String ccCountry;
		WebService String ccBillingEmail;

		//Billing info
		WebService String biCompanyName;
		WebService String biAddress;
		WebService String biCity;
		WebService String biPostalCode;
		WebService String biState;
		WebService String biCountry;
		WebService String biVATNumber;
		WebService String biAdditionalInfo;		
}