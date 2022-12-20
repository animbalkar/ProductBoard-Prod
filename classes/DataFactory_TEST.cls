@isTest
public class DataFactory_TEST {
	/* -------------------------------------------------------------------------------------------------
	 *
	 *	BASE OBJECTS: PRODUCTS, PRICEBOOKS, PRICEBOOK ENTRIES
	 *
	 * -------------------------------------------------------------------------------------------------
	 */

	public static void init() {
		List<Product2> pbProducts = createTestProducts(GeneralConfig_TEST.PRODUCT_NAMES);
		List<Pricebook2> pbPricebooks = createTestPricebooks(GeneralConfig_TEST.PRICEBOOK_NAMES);
		List<PricebookEntry> pbPricebookEntries = createTestPricebookEntries(pbPricebooks, pbProducts);
		createSystemAccount(GeneralConfig_TEST.SYSTEM_ACCOUNT_NAME);
	}

	/* -------------------------------------------------------------------------------------------------
	 *
	 *	create api requests
	 *
	 * -------------------------------------------------------------------------------------------------
	 */

	public static ProjectOps.ProjectInfo createProjectInfo(String projectId, String teamUrl, Date trialEndDate, String hash) {
		ProjectOps.ProjectInfo info = new ProjectOps.ProjectInfo();
		info.projectId = projectId;
		info.teamUrl = teamUrl;
		info.trialEndDate = trialEndDate;
		info.hash = hash;
		return info;
	}

	public static Subscription_DTO_Req setSubscriptionInfo(String projectPbId, String em, Integer users, String frequency, String plan) {
		Subscription_DTO_Req info = new Subscription_DTO_Req();
		info.projectId = projectPbId;
		info.userEmail = em.toLowerCase();
		info.amountOfUsers = users;
		info.frequency = frequency;
		info.plan = plan;
		info.planVersion = '4';
		//CC INFO
		info.billingInfoFlag = false;
		info.ccAddress = 'Test Street 000';
		info.ccCity = 'Test City';
		info.ccPostalCode = '00000';
		info.ccState = 'Test State';
		info.ccCountry = 'Test Country';
		info.ccBillingEmail = em;
		return info;
	}

	public static Subscription_DTO_Req setCancelSubscriptionInfo(String em, String projectPbId) {
		Subscription_DTO_Req info = new Subscription_DTO_Req();
		info.projectId = projectPbId;
		info.userEmail = em;
		return info;
	}
	public static Subscription_DTO_Req setChangePlanInfo(String frequency, String projectPbId, String plan, String planVersion) {
		Subscription_DTO_Req info = new Subscription_DTO_Req();
		info.projectId = projectPbId;
		info.frequency = frequency;
		info.plan = plan;
		info.planVersion = planVersion;
		return info;
	}

	public static EventsOps.EventInfo createEventsInfo(
		String eventType,
		String userId,
		String userEmail,
		String projectId,
		String userRole
	) {
		EventsOps.EventInfo info = new EventsOps.EventInfo();
		info.eventType = eventType;
		info.userId = userId;
		info.userEmail = userEmail;
		info.projectId = projectid;
		info.userRole = userRole;
		return info;
	}

	public static UserOps_DTO_req createUserInfo(String userId, String userEmail, String fullName, String pbOptIn) {
		UserOps_DTO_req info = new UserOps_DTO_req();
		info.fullName = fullName;
		info.pbOptIn = pbOptIn;
		info.userEmail = userEmail;
		info.userId = userId;
		return info;
	}

	/* -------------------------------------------------------------------------------------------------
	 *
	 *	TEST OBJECTS: ACCOUNT, CONTACT, PU, PROJECT, TRIAL OPP, OPP WITH ITEM, CONTRACT, ASSET, QUOTE
	 *
	 * -------------------------------------------------------------------------------------------------
	 */

	public static Account createTestAccount() {
		Account acc = new Account();
		acc.Name = 'Test Account';

		Account_DAO.insertAccount(acc);
		return acc;
	}

	public static Account createTestAccount(String accName) {
		Account acc = new Account();
		acc.Name = accName;

		Account_DAO.insertAccount(acc);
		return acc;
	}

	public static Contact createTestContact(Id accountId) {
		Contact cont = new Contact();
		cont.FirstName = 'Jakub';
		cont.LastName = 'Dařbuján';
		cont.Accountid = accountId;
		cont.Trial_End_Date__c = Date.today().addDays(30);
		cont.Email = GeneralConfig_TEST.TEST_MASTER_EMAIL;
		cont.user_PB_ID__c = double.valueOf(GeneralConfig_TEST.TEST_USER_PB_ID);
		Contact_DAO.insertContact(cont);
		return cont;
	}

	public static Project_User__c createTestProjectUser(Contact con, Project__c pr, Boolean isMaster, String role) {
		Project_User__c pu = new Project_User__c();
		pu.Name = con.Email;
		pu.Active__c = true;
		pu.Contact__c = con.Id;
		pu.Master_User__c = isMaster;
		pu.Project__c = pr.Id;
		pu.Project_Role__c = role;
		pu.User_Score__c = 0;
		pu.User_Added_Date__c = Datetime.now();
		pu.User_Status__c = 'Current';
		ProjectUser_DAO.insertProjectUser(pu);
		return pu;
	}

	public static Project__c createProject(Id accountId, Id contactId, Id productId) {
		Project__c pr = new Project__c();
		pr.Name = GeneralConfig_TEST.TEST_PROJECT_NAME;
		pr.Team_URL__c = GeneralConfig_TEST.TEST_PROJECT_NAME;
		pr.Account_Name__c = accountId;
		pr.Trial_End_Date__c = Date.today().addDays(30);
		pr.Master_User_Contact__c = contactId;
		pr.Project_PB_ID__c = GeneralConfig_TEST.TEST_PROJECT_PB_ID;
		pr.Active__c = true;
		//pr.Opportunity__c = oppId;
		pr.Created_Date__c = Datetime.now();
		pr.Product_Name__c = productId;
		insert pr;
		return pr;
	}

	public static Opportunity createTrialOpportunity(Id accountId, Id contactId, Id projId) {
		Opportunity opp = new Opportunity();
		opp.Project__c = projId;
		opp.AccountId = accountId;
		opp.Name = 'Test Opp';
		opp.RecordTypeId = OpportunityRecordTypes.self_service;
		opp.StageName = 'Free Trial';
		opp.Type = 'New Business';
		opp.Subtype__c = 'System';
		opp.CloseDate = Date.today().addDays(30);
		Opportunity_DAO.insertOpportunity(opp);

		setOpportunityContactRole(opp.Id, contactId);
		return opp;
	}

	public static Lead createTestLead(String userId, String userEmail) {
		Lead testLead = new Lead();
		testLead.LastName = 'Last';
		testLead.Email = userEmail;
		testLead.Company = 'Test Company';
		testLead.User_PB_ID__c = double.valueOf(userId);
		insert testLead;
		return testLead;
	}

	public static Opportunity createOpportunityWithLineItem(
		Id accountId,
		Id contactId,
		Id productId,
		id projId,
		String frequency,
		Double quantity,
		Integer months
	) {
		Pricebook2 priceBook = PriceBook_DAO.getPriceBookByFrequency(frequency, null);

		// OPP
		Opportunity opp = new Opportunity();
		opp.Project__c = projId;
		opp.AccountId = accountId;
		opp.Name = 'Test Opp';
		opp.RecordTypeId = OpportunityRecordTypes.self_service;
		opp.StageName = 'Free Trial';
		opp.Type = 'New Business';
		opp.Subtype__c = 'System';
		opp.Pricebook2Id = priceBook.Id;
		opp.CloseDate = Date.today();
		Opportunity_DAO.insertOpportunity(opp);

		// CONTACT ROLE
		setOpportunityContactRole(opp.Id, contactId);

		// LINE ITEM
		PricebookEntry pricebookEntry = PriceBookEntry_DAO.getPriceBookByProductAndPriceBook(productId, priceBook.Id);
		OpportunityLineItem lineItem = new OpportunityLineItem();
		lineItem.PricebookEntryId = pricebookEntry.Id;
		lineItem.OpportunityId = opp.Id;
		lineItem.Product2Id = productId;
		lineItem.Quantity = quantity;
		lineItem.Period__c = priceBook.Name;
		lineItem.List_Price_TMP__c = pricebookEntry.UnitPrice;
		lineItem.Price_Without_Discount__c = quantity * pricebookEntry.UnitPrice * months;
		lineItem.TotalPrice = lineItem.Price_Without_Discount__c;
		OpportunityLineItem_DAO.insertOpportunityLineItem(lineItem);

		opp.StageName = 'Closed Won';
		opp.Agreement_Type__c = 'Custom';
		update opp;

		return opp;
		// MM !!!!!!   NEED TO PREPARE LOGIC FOR LINE ITEM WITH DISCOUNTS
	}

	public static void createQuoteLineItem(Id quoteId, Id productId) {
		Pricebook2 priceBook = PriceBook_DAO.getPriceBookByFrequency('monthly', null);
		PricebookEntry entry = PriceBookEntry_DAO.getPriceBookByProductAndPriceBook(productId, priceBook.Id);

		QuoteLineItem item = new QuoteLineItem();
		item.Quantity = 3;
		item.UnitPrice = 100;
		item.PricebookEntryId = entry.Id;
		item.Product2Id = productId;
		item.QuoteId = quoteId;
		insert item;
	}

	public static Project__c addSubscriptionToProject(Project__c pr, id ProductId, String period, Integer months) {
		Pricebook2 priceBook = PriceBook_DAO.getPriceBookByFrequency(period, null);
		PricebookEntry entry = PriceBookEntry_DAO.getPriceBookByProductAndPriceBook(productId, priceBook.Id);

		Datetime now = Datetime.now();
		pr.Price_Book__c = priceBook.id;
		pr.Subscription_Start_Date__c = now.addDays(GeneralConfig_TEST.START_DATE_DELAY);
		pr.Subscription_End_Date__c = pr.Subscription_Start_Date__c.addMonths(months);
		update pr;
		return pr;
	}

	public static void setOpportunityContactRole(Id oppId, Id conId) {
		OpportunityContactRole role = new OpportunityContactRole();
		role.ContactId = conId;
		role.OpportunityId = oppId;
		role.IsPrimary = true;
		OpportunityContactRole_DAO.insertOpportunityContactRole(role);
	}

	/* -------------------------------------------------------------------------------------------------
	 *
	 *	PROJECTS: TRIAL, NO DISCOUNT, WITH DISCOUNT	  -  SUBSCRIPTIONS
	 *
	 * -------------------------------------------------------------------------------------------------
	 */

	public static Project__c createTrialProject() {
		Account acc = createTestAccount();
		Contact con = createTestContact(acc.Id);
		Product2 prod = Product2_DAO.getTrialProduct();
		Project__c pr = createProject(acc.Id, con.Id, prod.Id);
		Opportunity opp = createTrialOpportunity(acc.Id, con.Id, pr.id);
		Project_User__c pu = createTestProjectUser(con, pr, true, 'admin');
		return pr;
	}

	public static Project__c createStarterProject() {
		Account acc = createTestAccount();
		Contact con = createTestContact(acc.Id);
		Product2 prod = Product2_DAO.getStarterProduct();
		Project__c pr = createProject(acc.Id, con.Id, prod.Id);
		Project_User__c pu = createTestProjectUser(con, pr, true, 'admin');
		return pr;
	}

	public static Project__c createProjectWithAssetNoDiscount(String subsPlan, String subsFrequency, Double quantity) {
		String plan = subsPlan;
		String planVersion = setPlanVersion(plan);
		String frequency = subsFrequency;
		Integer months = setMonths(frequency);

		Account acc = createTestAccount();
		Contact con = createTestContact(acc.Id);
		Product2 prod = Product2_DAO.getProductByPlanAndVersion(plan, planVersion, null);
		Project__c pr = createProject(acc.Id, con.Id, prod.Id);
		Opportunity opp = createOpportunityWithLineItem(acc.Id, con.Id, prod.Id, pr.id, frequency, quantity, months);
		Project_User__c pu = createTestProjectUser(con, pr, true, 'admin');
		//add subscription
		Project__c prWithSub = addSubscriptionToProject(pr, prod.id, frequency, months);

		return prWithSub;
	}

	public static Project__c createProjectWithAssetWithDiscount(
		String subsPlan,
		String subsFrequency,
		Double quantity,
		String discountType,
		Integer discountLength,
		String discountSubtype,
		Double creditAmount,
		Double fixedAmount,
		Double percentAmount
	) {
		String plan = subsPlan;
		String planVersion = setPlanVersion(plan);
		String frequency = subsFrequency;
		Integer months = setMonths(frequency);

		Account acc = createTestAccount();
		Contact con = createTestContact(acc.Id);
		Product2 prod = Product2_DAO.getProductByPlanAndVersion(plan, planVersion, null);
		Project__c pr = createProject(acc.Id, con.Id, prod.Id);
		Opportunity opp = createOpportunityWithLineItem(acc.Id, con.Id, prod.Id, pr.Id, frequency, quantity, months);
		Project_User__c pu = createTestProjectUser(con, pr, true, 'admin');
		//addSubscription
		Project__c prWithSub = addSubscriptionToProject(pr, prod.id, frequency, months);

		return pr;
	}

	/* -------------------------------------------------------------------------------------------------
	 *
	 *	PRIVATE METHODS
	 *
	 * -------------------------------------------------------------------------------------------------
	 */

	private static void setDefaultAssetFields(Asset ass, Integer months) {
		Datetime now = Datetime.now();
		ass.Name = 'Test asset';
		ass.Active__c = true;
		ass.Eligible_for_Renewal__c = true;
		ass.Billing_Start_Date__c = now.addDays(GeneralConfig_TEST.START_DATE_DELAY);
		ass.Billing_End_Date__c = ass.Billing_Start_Date__c.addMonths(months);
		ass.Status = 'Purchased';
	}

	private static Double countAssetFinalPrice(Asset ass, Integer months) {
		Double priceWithoutDiscount = ass.Price_Without_Discount__c;
		Double remainingCredit = ass.Remaining_Credit__c;
		Double remainingFixed = ass.Discount_Fixed_Rest_Below_Zero__c;
		String discountType = ass.Discount_Type__c;
		String subType = ass.Discount_Subtype__c;

		if (discountType.equals('credit')) {
			if (ass.Discount_Credit__c > priceWithoutDiscount) {
				ass.FinalPrice__c = 0;
				ass.Remaining_Credit__c = ass.Discount_Credit__c - priceWithoutDiscount;
			} else {
				ass.FinalPrice__c = priceWithoutDiscount - ass.Discount_Credit__c;
				ass.Remaining_Credit__c = 0;
			}
		}
		if (discountType.equals('amount_off')) {
			ass.FinalPrice__c = (ass.List_Price__c * ass.Quantity * months) - ass.Discount_Fixed__c;
			if (ass.FinalPrice__c < 0) {
				ass.Discount_Fixed_Rest_Below_Zero__c = Math.abs(ass.FinalPrice__c);
				ass.FinalPrice__c = 0;
			}
		}
		if (discountType.equals('percent_off')) {
			ass.FinalPrice__c = (ass.List_Price__c * (1 - (ass.Discount_Percent__c * 0.01))) * ass.Quantity * months;
		}
		return ass.FinalPrice__c;
	}

	private static List<Product2> createTestProducts(List<String> productNames) {
		List<Product2> pbProducts = new List<Product2>();
		for (Integer i = 0; i < productNames.size(); i++) {
			Product2 prd = new Product2();
			prd.Name = productNames.get(i);
			if (prd.Name.equals('Scaling company')) {
				prd.Family = 'Custom Plans';
			} else {
				prd.Family = '4';
			}
			prd.isActive = true;
			pbProducts.add(prd);
		}
		Product2_DAO.insertProducts(pbProducts);
		return pbProducts;
	}
	private static List<Pricebook2> createTestPricebooks(List<String> pricebookNames) {
		List<Pricebook2> pbPricebooks = new List<Pricebook2>();
		for (Integer i = 0; i < pricebookNames.size(); i++) {
			PriceBook2 pb2 = new PriceBook2();
			pb2.Name = pricebookNames.get(i);
			pb2.IsActive = true;
			pbPricebooks.add(pb2);
		}
		PriceBook_DAO.insertPriceBooks(pbPricebooks);
		return pbPricebooks;
	}

	private static List<PricebookEntry> createTestPricebookEntries(List<Pricebook2> pbPricebooks, List<Product2> pbProducts) {
		List<PricebookEntry> pbPricebookEntries = new List<PricebookEntry>();

		for (Product2 prd : pbProducts) {
			PricebookEntry standardPrice = new PricebookEntry();
			standardPrice.Pricebook2Id = Test.getStandardPricebookId();
			standardPrice.Product2Id = prd.id;
			standardPrice.UnitPrice = GeneralConfig_TEST.PRODUCT_PRICES.get(prd.Name + '_StandardPrice');
			standardPrice.isactive = true;
			PriceBookEntry_DAO.insertPriceBookEntry(standardPrice);

			for (Pricebook2 pb2 : pbPricebooks) {
				PricebookEntry pbe = new PricebookEntry();
				pbe.Pricebook2Id = pb2.id;
				pbe.Product2Id = prd.id;
				pbe.UnitPrice = GeneralConfig_TEST.PRODUCT_PRICES.get(prd.Name + '_' + pb2.Name);
				pbe.isactive = true;
				pbe.UseStandardPrice = false;
				pbPricebookEntries.add(pbe);
			}
		}
		PriceBookEntry_DAO.insertPriceBookEntries(pbPricebookEntries);
		return pbPricebookEntries;
	}

	public static String setPlanVersion(String plan) {
		String planVersion = null;
		if (!plan.equals('Scaling company')) {
			planVersion = '4';
		}
		return planVersion;
	}

	public static Integer setMonths(String frequency) {
		Integer months;
		if (frequency.equals('yearly')) {
			months = 12;
		}
		if (frequency.equals('monthly')) {
			months = 1;
		}
		return months;
	}

	public static void createSystemAccount(String systemAccountName) {
		Account systemAcc = new Account();
		systemAcc.Name = systemAccountName;
		Account_DAO.insertAccount(systemAcc);
	}
}