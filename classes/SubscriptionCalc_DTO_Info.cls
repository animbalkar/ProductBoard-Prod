public class SubscriptionCalc_DTO_Info {
	public Subscription_DTO_Req info;

	public Double actualUnitPrice;
	public Double newUnitPrice;

	public Double actualTotal;
	public Double newTotal;
	public Double finalPrice;
	public Double priceWithoutDiscount;

	public Long billingPeriod;
	public Long actualPeriod;
	public Long newPeriod;
	public Double actualRatio;
	public Double newRatio;

	public Boolean isDiscount;
	public Boolean isDiscountActual;
	public Boolean isInfinityDiscount;
	public Datetime discountEndDate;
	public Long newDiscountRemainingLength;
	public String discountType;
	public String discountSubtype;
	public Double fixDiscount;
	public Double percentDiscount;

	public String actualPeriodType;
	public String newPeriodType;
	public Integer periodLength;
	public Integer users;
	public String action;

	public Datetime now;
	public Boolean isNewAsset;
	public Boolean isCancelAsset;
	public Boolean isUserOpps;
	public Boolean isUserOppsUp;
	public Boolean isRenewal;

	public String newAssetName;

	public Double remainingFix;
	public Double remainingCredit;

	public Asset calcAsset;
	public Project__c calcProject;
	public Pricebook2 calcProjectActualPricebook;
	public Contract calcContract;
	public Product2 calcProduct;
	public Pricebook2 calcPriceBook;
	public PricebookEntry calcPriceBookEntry;

	public List<Asset> allActiveFutureAssets;
	public List<Project_User__c> allProjectUsers;

	public Id eventTypeId;
	public String eventType;

	public SubscriptionCalc_DTO_Info(String pbProjectId) {
		System.debug('SubscriptionCalc_DTO_Info: init sObjects for DowngradeUpgrade');
		this.init();
		this.setProject(pbProjectId);
	}

	public SubscriptionCalc_DTO_Info(Subscription_DTO_Req info, String action, Datetime now) {
		//init parameters
		this.info = info;
		this.action = action;
		this.now = now;

		this.init();
		this.isUserOpps();

		//init objects
		if (this.action.equals('DowngradeUpgrade')) {
			this.initObjectsForDowngradeUpgrade();
			this.initVariablesForDowngardeUpgrade();
			//ace this.isNewAsset = false;
		} else if (this.action.equals('ChangePeriod_DowngradeUpgrade')) {
			//ace this.isNewAsset = true;
			this.initObjectsForDowngradeUpgrade();
			this.initVariablesForChangePeriod();
		} else if (this.action.equals('ChangePeriod')) {
			//ace this.isNewAsset = true;
			this.initObjectsForDowngradeUpgrade();
			this.initVariablesForChangePeriod();
		} else if (this.action.equals('Cancel')) {
			//ace this.isCancelAsset = true;
			this.initObjectsForCancel();
		} else if (this.isUserOpps) {
			//ace this.isNewAsset = false;
			this.initObjectsForDowngradeUpgrade();
			this.initVariablesForUserOps();
		}
	}

	private void setProject(String pbProjectId) {
		this.calcProject = Project_DAO.getProjectByPBIdWithExc(pbProjectId);
		system.debug('prDAO -->' + Project_DAO.getProjectByPBIdWithExc(pbProjectId));
	}

	private void setProject(Id projectId) {
		this.calcProject = Project_DAO.getProjectByIdWithExc(projectId);
		if (calcProject.Price_Book__c != null) {
			this.calcProjectActualPricebook = PriceBook_DAO.getPriceBookById(calcProject.Price_Book__c);
			system.debug(calcProject.Price_Book__c);
		}
	}

	private void setAllProjectUsers(Id projectId) {
		this.allProjectUsers = ProjectUser_DAO.getProjectUsersByProjectId(projectId);
	}

	//find Product plan for change
	private void setPlanProduct(String plan, String planVersion, Id productId) {
		System.debug('Product ID for renewed asset: ' + productId);
		calcProduct = Product2_DAO.getProductByPlanAndVersion(plan, planVersion, productId);
	}
	//find Pricebook for change
	private void setPlanPricebook(String dtoFrequency, String assetFrequency) {
		calcPriceBook = PriceBook_DAO.getPriceBookByFrequency(dtoFrequency, assetFrequency);
	}
	//find Pricebook for change
	private void setPlanPricebookEntry(Id productId, Id priceBookId) {
		calcPriceBookEntry = PriceBookEntry_DAO.getPriceBookByProductAndPriceBook(productId, priceBookId);
	}

	private void isUserOpps() {
		if (
			this.action.equals('AddUser') ||
			this.action.equals('RemoveUser') ||
			this.action.equals('ChangeRoleUp') ||
			this.action.equals('ChangeRoleDown') ||
			this.action.equals('EnableUser') ||
			this.action.equals('DisableUser')
		) {
			if (this.action.equals('AddUser') || this.action.equals('ChangeRoleUp') || this.action.equals('EnableUser')) {
				this.isUserOppsUp = true;
			}
			this.isUserOpps = true;
		}
	}

	private void init() {
		this.isDiscount = false;
		this.isDiscountActual = false;
		this.isInfinityDiscount = false;
		this.isNewAsset = false;
		this.isCancelAsset = false;
		this.isUserOpps = false;
		this.isUserOppsUp = false;
		this.isRenewal = false;

		this.fixDiscount = 0;
		this.percentDiscount = 0;
		this.remainingFix = 0;
		this.remainingCredit = 0;
		this.newDiscountRemainingLength = 0;

		this.actualTotal = 0;
		this.newTotal = 0;
		this.finalPrice = 0;

		System.debug('SubscriptionCalc_DTO_Info: init calc parameters');
	}

	private void setLengthOfPeriod(Boolean forActual) {
		this.actualPeriodType = this.calcProjectActualPricebook.Name;

		if (this.info == null || this.info.frequency == null) {
			this.newPeriodType = this.calcProjectActualPricebook.Name;
		} else {
			this.newPeriodType = this.info.frequency;
		}

		if (forActual) {
			if (this.actualPeriodType.equals('monthly'))
				this.periodLength = 1;
			if (this.actualPeriodType.equals('yearly'))
				this.periodLength = 12;
		} else {
			if (this.newPeriodType.equals('monthly'))
				this.periodLength = 1;
			if (this.newPeriodType.equals('yearly'))
				this.periodLength = 12;
		}
		System.debug('SubscriptionCalc_DTO_Info: setup period length');
	}

	private void initObjectsForDowngradeUpgrade() {
		System.debug('SubscriptionCalc_DTO_Info: init sObjects for DowngradeUpgrade');
		this.setProject(this.info.projectId);
		this.setPlanProduct(this.info.plan, this.info.planVersion, this.calcProject.Product_Name__c);
		this.setPlanPricebook(this.info.frequency, this.calcProjectActualPricebook.Name);
		this.setPlanPricebookEntry(this.calcProduct.Id, this.calcPriceBook.Id);
	}

	private void initObjectsForCancel() {
		System.debug('SubscriptionCalc_DTO_Info: init sObjects for Cancel');
		this.setProject(this.info.projectId);
		this.setAllProjectUsers(this.calcProject.Id);
	}

	private void initVariablesForDowngardeUpgrade() {
		System.debug('SubscriptionCalc_DTO_Info: init variables for DowngradeUpgrade');
		this.setLengthOfPeriod(true);
	}

	private void initVariablesForChangePeriod() {
		System.debug('SubscriptionCalc_DTO_Info: init variables for DowngradeUpgrade');
		this.setLengthOfPeriod(false);
	}
	private void initVariablesForUserOps() {
		System.debug('SubscriptionCalc_DTO_Info: init variables for UserOps');
		this.setLengthOfPeriod(true);
	}

	private void initVariablesForRenewal() {
		System.debug('SubscriptionCalc_DTO_Info: init variables for Renewal');
		this.setLengthOfPeriod(false);
	}
}