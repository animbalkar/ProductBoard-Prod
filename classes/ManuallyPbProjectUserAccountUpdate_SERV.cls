public class ManuallyPbProjectUserAccountUpdate_SERV {
	
	public static Contact getContactByProjectUser(List<Contact> contacts, Project_User__c pu) {
		Contact foundContact = null;
		for (Contact c : contacts) {
			if (pu.Contact__c == c.Id) foundContact = c;
		}
		return foundContact;
	}	
}