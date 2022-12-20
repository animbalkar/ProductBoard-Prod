@isTest
private class DAO_TEST {
	@testSetup
	static void initsObjects() {
		DataFactory_TEST.init();
	}

	@isTest
	private static void emailNotificationServ() {
		EmailNotification_SERV.sendEmail();
	}

	@isTest
	private static void pricebookEntryDao() {
		try {
			PricebookEntry ent = new PricebookEntry();
			PriceBookEntry_DAO.insertPriceBookEntry(ent);
		} catch (Exception e) {
		}

		try {
			PricebookEntry ent = new PricebookEntry();
			List<PricebookEntry> entries = new List<PricebookEntry>();
			entries.add(ent);
			PriceBookEntry_DAO.insertPriceBookEntries(entries);
		} catch (Exception e) {
		}
	}

	@isTest
	private static void oppContactRoleDao() {
		OpportunityContactRole role = new OpportunityContactRole();
		try {
			OpportunityContactRole_DAO.insertOpportunityContactRole(role);
		} catch (Exception e) {
		}

		OppContactRole_DAO.getExistingOppContactRoles(null, null);
		OppContactRole_DAO.getExistingOppContactRolesByConId(null);
		OppContactRole_DAO.getExistingOppContactRolesByConId(null);
		OppContactRole_DAO.getExistingPrimaryOppContactRolesByConId(null);
	}

	@isTest
	private static void accountDao() {
		try {
			Account_DAO.insertAccount(new Account());
		} catch (ProductboardException e) {
		}

		try {
			Account_DAO.updateAccount(new Account());
		} catch (Exception e) {
		}

		try {
			Account acc = Account_DAO.getSystemAccount();
		} catch (ProductboardException e) {
		}

		Account acc1 = new Account();
		acc1.Name = 'Test';
		insert acc1;

		Account accGet = Account_DAO.getAccountById(acc1.Id);

		Account acc = Account_DAO.getSystemAccount();

		List<Account> accs = Account_DAO.getAllAccounts();
		Account acc2 = Account_DAO.getAccountById(acc1.Id);

		try {
			Account accError = Account_DAO.getAccountById(null);
		} catch (ProductboardException e) {
		}
	}

	@isTest
	private static void opportunityDao() {
		List<Opportunity> opps = Opportunity_DAO.getOppsBySetOfIds(null);
		try {
			List<Opportunity> opp = Opportunity_DAO.getOpenOpportunitiesByProjectId(null);
		} catch (Exception e) {
		}

		try {
			Opportunity_DAO.getOppsByListOfIds(null);
		} catch (Exception e) {
		}

		try {
			Opportunity_DAO.insertOpportunity(new Opportunity());
		} catch (Exception e) {
		}
	}

	@isTest
	private static void testSubscriptionOps() {
		Account acc = SubscriptionOps.createAccountWithCompanyName('Test company name', 'Test company name - user input');

		Lead l = new Lead(LastName = 'Last', Company = 'Not provided', Email = GeneralConfig_TEST.TEST_MASTER_EMAIL);
		insert l;
		Contact c = new Contact(LastName = 'Last', AccountId = acc.Id, Email = GeneralConfig_TEST.TEST_MASTER_EMAIL);
		insert c;
		Contact con = SubscriptionOps.convertOrReturnContactToLead(l, null, 'Test company name - user input');
	}

	@isTest
	private static void projectUserDao() {
		try {
			ProjectUser_DAO.insertProjectUser(new Project_User__c());
		} catch (Exception e) {
		}
		List<Project_User__c> pus = ProjectUser_DAO.getProjectUsersByLeadEmail(GeneralConfig_TEST.TEST_MASTER_EMAIL);
		try {
			pus = ProjectUser_DAO.getProjectUsersWithLimit(2);
		} catch (Exception e) {
		}

		try {
			pus = ProjectUser_DAO.getProjectUsersByListOfProjectIds(null);
		} catch (Exception e) {
		}

		try {
			ProjectUser_DAO.updateProjectUser(new Project_User__c());
		} catch (Exception e) {
		}
	}

	@isTest
	private static void projectDao() {
		List<Project__c> pr = Project_DAO.getProjectById(null);
		pr = Project_DAO.getProjectByProductboardProjectId(null);

		try {
			Project_DAO.getProjectByPBIdWithExc(null);
		} catch (Exception e) {
		}
		try {
			Project_DAO.getProjectsByListOfIds(new List<Id>());
		} catch (Exception e) {
		}
		try {
			Project_DAO.getProjectsByListOfMasterContactIds(new List<Id>());
		} catch (Exception e) {
		}

		try {
			Project_DAO.insertProject(new Project__c());
		} catch (Exception e) {
		}
		try {
			Project_DAO.updateProject(new Project__c());
		} catch (Exception e) {
		}
	}

	@isTest
	private static void contactDao() {
		List<Contact> cons = Contact_DAO.getContactbyId(null);

		try {
			Contact_DAO.getContactByPbUserId(null);
		} catch (Exception e) {
		}

		try {
			Contact_DAO.getContactbyListOfIds(new List<Id>());
		} catch (Exception e) {
		}

		try {
			Contact_DAO.getContactByEmail2(null);
		} catch (Exception e) {
		}

		try {
			Contact_DAO.getContactbyId2(null);
		} catch (Exception e) {
		}

		try {
			Contact_DAO.getAllMasterContactsWithClearbitRecordSystemAcc(null, 20);
		} catch (Exception e) {
		}

		try {
			Contact_DAO.insertContact(new Contact());
		} catch (Exception e) {
		}

		try {
			Contact_DAO.updateContact(new Contact());
		} catch (Exception e) {
		}
	}

	@isTest
	private static void productDao() {
		List<Product2> products = Product2_DAO.getProduct2ById(null);
		try {
			Product2_DAO.getProduct2ById2(null);
		} catch (Exception e) {
		}

		try {
			Product2_DAO.getProductByPlanAndVersion(null, null, null);
		} catch (Exception e) {
		}

		try {
			List<Product2> prods = new List<Product2>();
			Product2 pr = new Product2();
			prods.add(pr);
			Product2_DAO.insertProducts(prods);
		} catch (Exception e) {
		}
	}

	@isTest
	private static void pricebookDao() {
		try {
			List<Pricebook2> pric = new List<Pricebook2>();
			Pricebook2 pr = new Pricebook2();
			pric.add(pr);
			PriceBook_DAO.insertPriceBooks(pric);
		} catch (Exception e) {
		}

		try {
			PriceBook_DAO.getPriceBookByFrequency(null, null);
		} catch (Exception e) {
		}
	}

	@isTest
	private static void leadDao() {
		Lead l = new Lead(LastName = 'Ptacek', Company = 'company');
		Lead_DAO.insertLead(l);

		try {
			Lead getLead = Lead_DAO.getLeadByEmail2(null);
		} catch (Exception e) {
		}

		l.Email = GeneralConfig_TEST.TEST_MASTER_EMAIL;
		Lead_DAO.updateLead(l);

		Lead getLead = Lead_DAO.getLeadByEmail2(GeneralConfig_TEST.TEST_MASTER_EMAIL);

		getLead = Lead_DAO.getLeadbyId2(getLead.Id).get(0);

		Lead owner = new Lead();
		Lead_DAO.upsertLeadOwner(
			owner,
			createRequest('main', GeneralConfig_TEST.TEST_NEW_USER_EMAIL, '2', 'test company', null, null, null),
			System.now()
		);
		upsert owner;
	}

	@isTest
	private static void leadDaoNonExistentEmail() {
		try {
			Lead l = Lead_DAO.getLeadByEmail2('none');
		} catch (Exception e) {
		}
	}

	@isTest
	private static void leadDaoMoreSameEmails() {
		try {
			Lead firstTest = new Lead(LastName = 'Michael', Company = 'Ikebano', Email = 'test@test.test');
			Lead secondTest = new Lead(LastName = 'Silvia', Company = 'Ikebano', Email = 'test@test.test');
			Lead thirdTest = new Lead(LastName = 'Andrew', Company = 'Ikebano', Email = 'test@test.test');
			Lead fourthTest = new Lead(LastName = 'Thomas', Company = 'Ikebano', Email = 'test@test.test');
			Lead_DAO.insertLead(firstTest);
			Lead_DAO.insertLead(secondTest);
			Lead_DAO.insertLead(thirdTest);
			Lead_DAO.insertLead(fourthTest);
			Lead l = Lead_DAO.getLeadByEmail2('test@test.test');
			System.assertEquals(l.Email, 'test@test.test');
		} catch (Exception e) {
		}
	}

	@isTest
	private static void leadDaoGetAllLeadsByEmailsTest() {
		try {
			Lead firstTest = new Lead(LastName = 'Ivan', Company = 'Ikebano', Email = 'test@test.test');
			Lead_DAO.insertLead(firstTest);
			List<Lead> listL = Lead_DAO.getAllLeadsByEmail('test@test.test');
			System.assertNotEquals(listL.size(), 0);
		} catch (Exception e) {
		}
	}

	@isTest
	private static void leadDaoGetUncovertedLeadsByEmailTest() {
		try {
			Lead first = new Lead(LastName = 'Ibrahim', Company = 'Elefano', isConverted = false, Email = 'g@g.com');
			Lead_DAO.insertLead(first);
			List<Lead> listOfUL = Lead_DAO.getUnconvertedLeadsByEmail('g@g.com');
			System.assertNotEquals(listOfUL.size(), 0);
		} catch (Exception e) {
		}
	}

	@isTest
	private static void leadDaoGetLeadByIdTest() {
		try {
			Lead first = new Lead(LastName = 'Smith', Company = 'Akebono', Email = 'j@j.com');
			Lead_DAO.insertLead(first);
			List<Lead> listOfUL = Lead_DAO.getLeadbyId(Lead_DAO.getLeadByEmail2('j@j.com').Id);
			System.assertNotEquals(0, listOfUL.size());
			List<Lead> newListOfUL = Lead_DAO.getLeadbyId2(null);
			System.assertEquals(0, listOfUL.size());
		} catch (Exception e) {
		}
	}

	@isTest
	private static void leadDaoGetLeadsPUIDS() {
		List<Id> pusIds = new List<Id>();
		List<Lead> retrievedLeadList = new List<Lead>();
		try {
			retrievedLeadList = Lead_DAO.getLeadsByListOfProjectUserIds(pusIds);
		} catch (Exception e) {
		}
		Lead firstTest = new Lead(LastName = 'Michael', Company = 'Ikebano', Email = 'test@test.test');
		Lead_DAO.insertLead(firstTest);
		pusIds.add(Lead_DAO.getLeadByEmail2('test@test.test').Id);
		try {
			retrievedLeadList = Lead_DAO.getLeadsByListOfProjectUserIds(pusIds);
		} catch (Exception e) {
		}
		System.assertEquals(retrievedLeadList.size(), 1);
	}

	@isTest
	private static void LeadDaoTrialRequestTest() {
		Lead lead = new Lead();
		Lead_DAO.upsertLeadRequest(lead, createRequest('main', 'sample@sample.com', '112233', null, null, null, null), System.now());
		upsert lead;
		System.assertEquals(lead.Email, 'sample@sample.com');
	}

	@isTest
	private static void LeadDaoTrialOwnerPlusUserTest() {
		Lead l = new Lead();
		Lead_DAO.upsertLeadOwner(l, createRequest('main', 'owner@owner.com', '112233', null, null, null, null), System.now());
		upsert l;
		System.assertEquals(l.Email, 'owner@owner.com');
		System.assertEquals(l.Company, 'Not provided');

		Lead k = new Lead();
		Lead_DAO.upsertLeadOwner(k, createRequest('main', 'company@owner.com', '1142233', 'Telerano', null, null, null), System.now());
		upsert k;
		System.assertEquals(k.Email, 'company@owner.com');
		System.assertEquals(k.Company, 'Telerano');

		Lead m = new Lead();
		Lead_DAO.upsertLeadUser(m, 'main', 'user@user.com', 112233, System.now());
		upsert m;
		System.assertEquals(m.Email, 'user@user.com');
		System.assertEquals(m.Company, 'Not provided');
		System.assertEquals(m.LastName, 'Not provided');
	}

	@isTest
	private static void LeadDaoInsertAndUpdateWithErrorsTest() {
		Lead l = new Lead();
		try {
			Lead_DAO.insertLead(l);
		} catch (Exception e) {
		}
		try {
			Lead_DAO.updateLead(l);
		} catch (Exception e) {
		}
	}

	@isTest
	private static void LeadServGetUnconvertedLeadsBEWLSTest() {
		Lead newL = new Lead(LastName = 'Smith', Company = 'Akebono', Email = 'j@j.com');
		try {
			Lead_DAO.insertLead(newL);
		} catch (Exception e) {
		}

		List<Lead> listOfL = Lead_SERV.getUnconvertedLeadsByEmailWithoutLeadSource('j@j.com', 'someNotCorrectLeadSource');
		System.assertEquals(listOfL.size(), 1);

		Lead anotherNewL = new Lead(LastName = 'Polacck', Company = 'Tegehano', Email = 'e@e.com', LeadSource = 'someSource');
		try {
			Lead_DAO.insertLead(anotherNewL);
		} catch (Exception e) {
		}

		List<Lead> listOfAnotherL = Lead_SERV.getUnconvertedLeadsByEmailWithoutLeadSource('e@e.com', 'someNotCorrectLeadSource');
		System.assertEquals(listOfAnotherL.size(), 1);
	}

	@IsTest
	private static void LeadServTrialUserAndRequestTest() {
		IntegrationLog__c il = new IntegrationLog__c();
		Lead l = Lead_SERV.createOrUpdateTrialRequest(createRequest('main', 's@s.com', '112233', null, null, null, null), System.now(), il);
		Lead m = Lead_SERV.createOrUpdateTrialRequest(
			createRequest('main', 'test@mail.com', '112233', null, null, null, null),
			System.now(),
			il
		);
		Lead n = Lead_SERV.createOrUpdateTrialRequest(createRequest('main', 's@s.com', '112233', null, null, null, null), System.now(), il);

		Lead newL = new Lead(LastName = 'Smith', Company = 'Akebono', Email = 'j@j.com', IsConverted = false);
		try {
			Lead_DAO.insertLead(newL);
		} catch (Exception e) {
		}
		newL = Lead_SERV.createOrUpdateTrialRequest(createRequest('main', 'j@j.com', '11223344', null, null, null, null), System.now(), il);

		l = Lead_SERV.createOrUpdateTrialUser('main', 'none@none.com', 112233, System.now(), il);
		newL = Lead_SERV.createOrUpdateTrialUser('main', 'j@j.com', 11223344, System.now(), il);
	}

	@isTest
	private static void LeadServTrialOwnerTest() {
		IntegrationLog__c il = new IntegrationLog__c();
		Lead a = Lead_SERV.createOrUpdateTrialOwner(
			createRequest('main', 't@t.com', '11789', 'Not provided', '', 'Not provided', Date.valueOf(System.now())),
			System.now(),
			il
		);
		try {
			Lead_DAO.insertLead(a);
		} catch (Exception e) {
		}

		a = Lead_SERV.createOrUpdateTrialOwner(
			createRequest('main', 't@t.com', '11789', 'Feperomo', '421548659865', 'Thomas Angelo', Date.valueOf(System.now())),
			System.now(),
			il
		);
	}

	@isTest
	private static void LeadServParsTest() {
		Lead l = new Lead(LastName = 'Angelo', FirstName = 'Thomas', Company = 'Hefedano', Email = 't@a.com');
		Lead_SERV.parseLeadFullName('Thomas Angelo', l);
		Lead_SERV.parseLeadFullName('Thomas ', l);
		Lead_SERV.parseLeadFullName('Thomas', l);
	}

	@isTest
	private static void LeadServConvertTest() {
		Account a = new Account(Name = 'Angelo');
		try {
			Account_DAO.insertAccount(a);
		} catch (Exception e) {
		}
		Contact c = new Contact(LastName = 'Angelo', AccountId = a.Id);
		Lead l = new Lead(LastName = 'Angelo', FirstName = 'Thomas', Company = 'Hefedano', Email = 't@a.com');
		try {
			Lead_DAO.insertLead(l);
			Contact_DAO.insertContact(c);
		} catch (Exception e) {
		}
		c = Lead_SERV.convertLead(l, a.Id, c.Id);

		Account b = new Account(Name = 'Salieri');
		try {
			Account_DAO.insertAccount(b);
		} catch (Exception e) {
		}
		Contact cont = new Contact(LastName = 'Salieri', AccountId = b.Id, Email = 's@lh.com');

		Lead d = new Lead(LastName = 'Salieri', FirstName = 'Don', Company = 'LostHeaven', Email = 's@lh.com');
		try {
			Lead_DAO.insertLead(d);
			Contact_DAO.insertContact(cont);
		} catch (Exception e) {
		}
		Contact e = Lead_SERV.convertLead(d, b.Id, d.Id);
	}

	@isTest
	private static void LeadServConvertAlreadyConvertedTest() {
		Account a = new Account(Name = 'Angelo');
		try {
			Account_DAO.insertAccount(a);
		} catch (Exception e) {
		}
		Contact c = new Contact(LastName = 'Angelo', AccountId = a.Id);
		Lead l = new Lead(LastName = 'Angelo', FirstName = 'Thomas', Company = 'Hefedano', Email = 't@a.com', IsConverted = true);
		try {
			Lead_DAO.insertLead(l);
			Contact_DAO.insertContact(c);
		} catch (Exception e) {
		}
		try {
			c = Lead_SERV.convertLead(l, a.Id, c.Id);
		} catch (Exception e) {
		}
	}

	@IsTest
	private static void projectUserDaoTest() {
		Project__c p = DataFactory_TEST.createProjectWithAssetNoDiscount('Startup', 'monthly', 1);
		List<Project_User__c> pList = ProjectUser_DAO.getProjectUsersByProjectId(p.Id);
		try {
			pList = ProjectUser_DAO.getProjectUsersByProjectId2(p.Id);
		} catch (Exception e) {
		}

		try {
			pList = ProjectUser_DAO.getProjectUsersByProjectId2(null);
		} catch (Exception e) {
		}

		pList = ProjectUser_DAO.getProjectUsersWithLimit(3);
	}

	public static TrialOps.LeadInfo createRequest(
		String spaceType,
		String userEmail,
		String userId,
		String company,
		String phone,
		String fullName,
		Date trialEndDate
	) {
		TrialOps.LeadInfo req = new TrialOps.LeadInfo();
		req.spaceType = spaceType;
		req.userEmail = userEmail;
		req.userId = userId;
		req.company = company;
		req.phone = phone;
		req.fullName = fullName;
		req.trialEndDate = trialEndDate;
		return req;
	}
}