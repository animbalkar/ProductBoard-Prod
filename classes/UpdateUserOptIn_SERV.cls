public class UpdateUserOptIn_SERV  {

	public static List<String> updateUserPbOptIn(String fullName, String email, String pbOptIn, List<String> returnMessage) {
		String userFullName;
		String userEmail;
		Boolean userPbOptIn;
		
		if(email == null || pbOptIn == null || fullName == null) {
			throw new ProductboardException('Invalid parameters!', 1);
		} else {
			userEmail = email.toLowerCase();
			userPbOptIn = Boolean.valueOf(pbOptIn);
			userFullName = fullName;
		}

		Contact userContact = Contact_DAO.getContactByEmail2(userEmail);

		updateContact(userContact, userFullName, userPbOptIn);
		returnMessage.add('User contact updated.');

		return returnMessage;
	}


	public static void updateContact(Contact userContact, String fullName, Boolean optIn) {
		Contact_SERV.parseContactFullName(fullName, userContact);
		userContact.Productboard_Opt_in__c = optIn;
		update userContact;
	}


}