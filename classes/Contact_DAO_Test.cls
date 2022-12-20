@IsTest
public class Contact_DAO_Test {
	@TestSetup
	static void init() {
		DataFactory_TEST.init();
		Account acc = DataFactory_TEST.createTestAccount();
		Contact con = DataFactory_TEST.createTestContact(acc.Id); // GeneralConfig_TEST.TEST_MASTER_EMAIL
		Product2 prod = [SELECT Id FROM Product2 LIMIT 1];
		Project__c proj = DataFactory_TEST.createProject(acc.Id, con.Id, prod.Id);
		Project_User__c pu = DataFactory_TEST.createTestProjectUser(con, proj, true, 'admin');
	}

	@IsTest
	static void testGetContactsByEmail() {
		List<Contact> contacts = Contact_DAO.getContactsByEmail(GeneralConfig_TEST.TEST_MASTER_EMAIL);
		System.assertEquals(1, contacts.size());
	}

	@IsTest
	static void testGetContactByEmail2Success() {
		Contact contact = Contact_DAO.getContactByEmail2(GeneralConfig_TEST.TEST_MASTER_EMAIL);
		System.assertEquals(GeneralConfig_TEST.TEST_MASTER_EMAIL, contact.Email);
	}

	@IsTest
	static void testGetContactByEmail2Error() {
		Boolean errorThrown;
		try {
			Contact contact = Contact_DAO.getContactByEmail2('mail');
		} catch (Exception ex) {
			errorThrown = true;
		}
		System.assert(errorThrown);
	}

	@isTest
	static void testGetContactByPbUserIdSuccess() {
		Contact contact = Contact_DAO.getContactByPbUserId(double.valueOf(GeneralConfig_TEST.TEST_USER_PB_ID));
		System.assertEquals(double.valueOf(GeneralConfig_TEST.TEST_USER_PB_ID), contact.User_PB_ID__c);
	}

	@isTest
	static void testGetContactByPbUserIdError() {
		Boolean errorThrown;
		try {
			Contact contact = Contact_DAO.getContactByPbUserId(11112);
		} catch (Exception ex) {
			errorThrown = true;
		}
		System.assert(errorThrown);
	}

	@IsTest
	static void testGetContactbyId() {
		List<Contact> contacts = Contact_DAO.getContactbyId([SELECT Id FROM Contact LIMIT 1].Id);
		System.assertEquals(1, contacts.size());
	}

	@IsTest
	static void testGetContactbyId2Success() {
		Id conId = [SELECT Id FROM Contact LIMIT 1].Id;
		List<Contact> contacts = Contact_DAO.getContactbyId2(conId);
		System.assertEquals(1, contacts.size());
	}

	@IsTest
	static void testGetContactbyId2Error() {
		Boolean errorThrown;
		try {
			List<Contact> contacts = Contact_DAO.getContactbyId2(null);
		} catch (Exception ex) {
			errorThrown = true;
		}
		System.assert(errorThrown);
	}

	@IsTest
	static void testGetContactbyListOfIdsSuccess() {
		List<Id> ids = new List<Id>();
		ids.add([SELECT Id FROM Contact LIMIT 1].Id);
		List<Contact> contacts = Contact_DAO.getContactbyListOfIds(ids);
		System.assertEquals(1, contacts.size());
	}

	@IsTest
	static void testGetContactsByIdsSuccess() {
		List<Id> ids = new List<Id>();
		ids.add([SELECT Id FROM Contact LIMIT 1].Id);
		List<Contact> contacts = Contact_DAO.getContactsByIds(ids);
		System.assertEquals(1, contacts.size());
	}

	@IsTest
	static void testGetContactbyListOfIdsError() {
		Boolean errorThrown;
		try {
			List<Contact> contacts = Contact_DAO.getContactbyListOfIds(new List<Id>());
		} catch (Exception ex) {
			errorThrown = true;
		}
		System.assert(errorThrown);
	}

	@IsTest
	static void testGetMasterContactByProjectSuccess() {
		Project__c proj = [SELECT Master_User_Contact__c FROM Project__c LIMIT 1];
		Contact contact = Contact_DAO.getMasterContactByProject(proj);
		System.assertEquals(proj.Master_User_Contact__c, contact.Id);
	}

	@IsTest
	static void testGetMasterContactByProjectError() {
		Boolean errorThrown;
		try {
			Contact contact = Contact_DAO.getMasterContactByProject(null);
		} catch (Exception ex) {
			errorThrown = true;
		}
		System.assert(errorThrown);
	}

	@IsTest
	static void testGetMasterContactByProjectNoExcSuccess() {
		Project__c proj = [SELECT Master_User_Contact__c FROM Project__c LIMIT 1];
		Contact contact = Contact_DAO.getMasterContactByProjectNoExc(proj);
		System.assertEquals(proj.Master_User_Contact__c, contact.Id);
	}

	@IsTest
	static void testUpdateContactSuccess() {
		Contact con = [SELECT Id FROM Contact LIMIT 1];
		con.Email = 'a@a.cz';
		Contact_DAO.updateContact(con);
		System.assertEquals('a@a.cz', [SELECT Email FROM Contact WHERE Id = :con.Id].Email);
	}

	@IsTest
	static void testUpdateContactError() {
		Boolean errorThrown;
		try {
			Contact_DAO.updateContact(null);
		} catch (Exception ex) {
			errorThrown = true;
		}
		System.assert(errorThrown);
	}
	@IsTest
	static void testGetContactbyId2MultipleRecordsError() {
		Boolean errorThrown;
		Account acc = [SELECT id FROM account LIMIT 1];
		Contact con = DataFactory_TEST.createTestContact(acc.Id);
		try {
			Contact contact = Contact_DAO.getContactByEmail2(con.email);
		} catch (Exception ex) {
			errorThrown = true;
		}
		System.assert(errorThrown);
	}
	/*
	getContactByPbUserId //2 se stejnym
	getMasterContactByProject // send roject with null master cosnts
	getContactsByPbUsers // success i error
	*/
}