public class UpdateSystemAccountWithClearbit_SERV {

	/*
	 *	----------------- PHASE 1 SERVICE METHODS --------------------------------------------
	 */

	public static Integer updateAccountOnMasterContactsAndProjects(List<Contact> contactsToUpdate, List<Project__c> projectsToUpdate, Integer insertedAccounts, String eachEmail, Integer contactLimit) {
		// load all records		
		Id systemAccountId = Account_DAO.getSystemAccount().Id;
		List<Contact> masterContacts = Contact_DAO.getAllMasterContactsWithClearbitRecordSystemAcc(systemAccountId, contactLimit);
		Integer size = masterContacts.size();
		List<Id> clearbitIds = new List<Id> ();
		List<Id> masterContactsIds = new List<Id> ();
		for (Contact c : masterContacts) {
			masterContactsIds.add(c.Id);
			clearbitIds.add(c.cbit__Clearbit__c);
		}
		List<Project__c> projects = Project_DAO.getProjectsByListOfMasterContactIds(masterContactsIds);
		List<cbit__Clearbit__c> clearbitRecords = Clearbit_DAO.getClearbitRecordsByListOfIds(clearbitIds);
		List<Account> salesforceAccounts = Account_DAO.getAllAccounts();

		List<Contact> masterContactsWithClearbitCompany = getContactsWithClearbitCompany(masterContacts, clearbitRecords);
		size = masterContactsWithClearbitCompany.size();

		Integer tempCOunt = 0;
		for (Contact con : masterContactsWithClearbitCompany) {
			// get account ID to update
			if (tempCOunt <= 49) {
				eachEmail = con.Email;
				Id accountIdToUpdate;
				List<Project__c> masterContactProjects = getProjects(con.Id, projects);
				cbit__Clearbit__c cbit = getClearbitRecord(con.cbit__Clearbit__c, clearbitRecords);
				if (!masterContactProjects.isEmpty()) {
					if (cbit.cbit__CompanyName__c != null) {
						for (Account a : salesforceAccounts) {
							if (a.Name.toUpperCase().equals(cbit.cbit__CompanyName__c.toUpperCase())) {
								accountIdToUpdate = a.Id;
							}
						}
						if (accountIdToUpdate == null) {
							Account insertedAcc = createNewAccount(cbit);
							accountIdToUpdate = insertedAcc.Id;
							salesforceAccounts.add(insertedAcc);
							tempCOunt++;
							insertedAccounts++;
						}
					}

					// add contact and its projects to update queue
					con.AccountId = accountIdToUpdate;
					con.SystemAccScriptUpdated__c = true;
					contactsToUpdate.add(con);
					for (Project__c pr : masterContactProjects) {
						pr.Account_Name__c = accountIdToUpdate;
						projectsToUpdate.add(pr);
					}
				} else {
					con.SystemAccScriptUpdated__c = true;
					contactsToUpdate.add(con);
				}
			} else {
				break;
			}
		}
		return insertedAccounts;
	}

	public static void setSuccessResultPhase1(Map<String, String> result, List<Contact> contactsToUpdate, List<Project__c> projectsToUpdate, Integer insertedAccounts) {
		result.put('Contacts updated', String.valueOf(contactsToUpdate.size()));
		result.put('Projects updated', String.valueOf(projectsToUpdate.size()));
		result.put('Accounts inserted', String.valueOf(insertedAccounts));
		result.put('Success result', 'Update on contacts and projects was successfullly proceeded!');
	}

	public static void setSuccessResultPhase2(Map<String, String> result, List<Contact> contactsToUpdate, List<Opportunity> oppsToUpdate) {
		result.put('Pu contacts updated', String.valueOf(contactsToUpdate.size()));
		result.put('Opps updated', String.valueOf(oppsToUpdate.size()));
		result.put('Success result', 'Update on pu contacts and projects ops was successfullly proceeded!');
	}

	public static void setErrorResultPhase1(Map<String, String> result, Exception e, String eachEmail) {
		result.put('Cause', String.valueOf(e.getCause()));
		result.put('Line Number', String.valueOf(e.getLineNumber()));
		result.put('Exception Type Name', e.getTypeName());
		result.put('Contact Email', eachEmail);
		result.put('Update failed', e.getMessage());
	}

	public static void setErrorResultPhase2(Map<String, String> result, Exception e) {
		result.put('Cause', String.valueOf(e.getCause()));
		result.put('Line Number', String.valueOf(e.getLineNumber()));
		result.put('Exception Type Name', e.getTypeName());
		result.put('Update failed', e.getMessage());
	}

	public static List<Project__c> getProjects(Id contactId, List<Project__c> projects) {
		List<Project__c> contactProjects = new List<Project__c> ();
		for (Project__c pr : projects) {
			if (pr.Master_User_Contact__c.equals(contactId)) {
				contactProjects.add(pr);
			}
		}
		return contactProjects;
	}

	public static cbit__Clearbit__c getClearbitRecord(Id cbitId, List<cbit__Clearbit__c> clearbits) {
		cbit__Clearbit__c clearbitRecord;
		for (cbit__Clearbit__c cb : clearbits) {
			if (cb.Id.equals(cbitId)) {
				clearbitRecord = cb;
			}
		}
		return clearbitRecord;
	}

	public static List<Contact> getContactsWithClearbitCompany(List<Contact> contactsWithClearbit, List<cbit__Clearbit__c> clearbits) {
		List<Contact> markContactAsUpdated = new List<Contact> ();
		for (Integer i = 0; i<contactsWithClearbit.size(); i++) {
			Contact con = contactsWithClearbit.get(i);
			cbit__Clearbit__c cb = getClearbitRecord(con.cbit__Clearbit__c, clearbits);
			if (cb.cbit__CompanyName__c == null) {
				con.SystemAccScriptUpdated__c = true;
				markContactAsUpdated.add(con);
				contactsWithClearbit.remove(i);
			}
		}
		update markContactAsUpdated;
		return contactsWithClearbit;
	}

	public static Account createNewAccount(cbit__Clearbit__c cbit) {
		Account acc = new Account();
		acc.Name = cbit.cbit__CompanyName__c;
		acc.Parent_Company_Website__c = cbit.cbit__CompanyParentDomain__c;
		acc.Company_Description__c = cbit.cbit__CompanyDescription__c;
		acc.Location__c = cbit.cbit__CompanyLocation__c;
		acc.Phone_Numbers__c = cbit.cbit__CompanySitePhoneNumbers__c;
		acc.Email_Addresses__c = cbit.cbit__CompanySiteEmailAddresses__c;
		acc.Time_Zone__c = String.valueOf(cbit.cbit__UtcOffset__c);
		acc.Website = cbit.cbit__CompanyDomain__c;
		acc.NumberOfEmployees = Integer.valueOf(cbit.cbit__CompanyMetricsEmployees__c);
		acc.Sector__c = cbit.cbit__CompanyCategorySector__c;
		acc.Industry__c = cbit.cbit__CompanyCategoryIndustry__c;
		acc.Industry_Group__c = cbit.cbit__CompanyCategoryIndustryGroup__c;
		acc.Sub_industry__c = cbit.cbit__CompanyCategorySubIndustry__c;
		acc.Street__c = cbit.cbit__CompanyGeoStreetName__c;
		acc.Street_Number__c = cbit.cbit__CompanyGeoStreetNumber__c;
		acc.City__c = cbit.cbit__CompanyGeoCity__c;
		acc.Postal_Code__c = cbit.cbit__CompanyGeoPostalCode__c;
		acc.Country__c = cbit.cbit__CompanyGeoCountry__c;
		acc.Country_Code__c = cbit.cbit__CompanyGeoCountryCode__c;
		acc.State__c = cbit.cbit__CompanyGeoState__c;
		acc.State_Code__c = cbit.cbit__CompanyGeoStateCode__c;
		acc.ShippingStreet = cbit.cbit__CompanyGeoStreetName__c + ' ' + cbit.cbit__CompanyGeoStreetNumber__c;
		acc.ShippingCity = cbit.cbit__CompanyGeoCity__c;
		acc.ShippingCountry = cbit.cbit__CompanyGeoCountry__c;
		acc.ShippingState = cbit.cbit__CompanyGeoState__c;
		acc.ShippingPostalCode = cbit.cbit__CompanyGeoPostalCode__c;
		acc.Legal_Name__c = cbit.cbit__CompanyLegalName__c;
		acc.Domain_Aliases__c = cbit.cbit__CompanyDomainAliases__c;
		acc.Tags__c = cbit.cbit__CompanyTags__c;
		acc.Technologies__c = cbit.cbit__CompanyTech__c;
		acc.Founded_Year__c = cbit.cbit__CompanyFoundedYear__c;
		acc.Phone__c = cbit.cbit__CompanyPhone__c;
		acc.Logo__c = cbit.cbit__CompanyLogo__c;
		acc.Raised__c = cbit.cbit__CompanyMetricsRaised__c;
		acc.Fiscal_Year_Ends__c = String.valueOf(cbit.cbit__CompanyMetricsFiscalYearEnd__c);
		acc.Employees_Range__c = cbit.cbit__CompanyMetricsEmployeesRange__c;
		acc.Facebook__c = 'www.facebook.com/' + cbit.cbit__CompanyFacebookHandle__c;
		acc.LinkedIn__c = 'www.linkedin.com/' + cbit.cbit__CompanyLinkedinHandle__c;
		insert acc;
		return acc;
	}

	/*
	 *	----------------- PHASE 2 SERVICE METHODS --------------------------------------------
	 */

	public static void updateAccOnPuContactsAndProjectOpps(List<Contact> puContactsToUpdate, List<Opportunity> oppsToUpdate, Integer pusLimit) {
		Id systemAccId = Account_DAO.getSystemAccount().Id;

		// get pu contacts no masters
		List<Project_User__c> projectUsers = ProjectUser_DAO.getProjectUsersWithLimit(pusLimit);
		List<Id> puContactsIds = new List<Id> ();
		for (Project_User__c pu : projectUsers) {
			puContactsIds.add(pu.Contact__c);
		}
		List<Contact> puContacts = Contact_DAO.getContactbyListOfIds(puContactsIds);

		// get project opportunities
		List<Project__c> projects = getPusProjects(projectUsers);

		List<Id> projectsIds = new List<Id> ();
		List<Id> projectOppsIds = new List<Id> ();
		Set<Id> projectOppsIdsNoDupl = new Set<Id> ();

	/*//projopp 	for (Project__c pr : projects) {
			if (pr.Opportunity__c != null) {
				projectOppsIds.add(pr.Opportunity__c);
				projectsIds.add(pr.Id);
			}
		}
        */

		List<Opportunity> projectOpps = Opportunity_DAO.getOppsByListOfIds(projectOppsIds);
		Integer size = projectOpps.size();

		List<Project_User__c> setPusAsUpdated = new List<Project_User__c> ();
		// set pu contacts for update
		for (Project_User__c pu : projectUsers) {
			pu.SystemAccScriptUpdated__c = true;
			setPusAsUpdated.add(pu);
			if (!pu.Master_User__c) {
				Project__c puProject = getPuProject(pu.Project__c, projects);
				Id accountIdToUpdate = puProject.Account_Name__c;
				if (accountIdToUpdate != null) {
					if (!accountIdToUpdate.equals(systemAccId)) {
						Contact puContact = getPuContact(pu.Contact__c, puContacts);
						if (!puContact.AccountId.equals(accountIdToUpdate)) {
							puContact.AccountId = accountIdToUpdate;
							puContactsToUpdate.add(puContact);
						}
					}
				}
			}
		}

		// set opps for update
	/*//projopp 	for (Project__c pr : projects) {
			Id accountIdToUpdate = pr.Account_Name__c;
			Opportunity prOpp = getProjectOpp(pr.Opportunity__c, projectOpps);
			if (prOpp != null) {
				if (!prOpp.AccountId.equals(accountIdToUpdate) && accountIdToUpdate != null) {
					prOpp.AccountId = accountIdToUpdate;
					projectOppsIdsNoDupl.add(prOpp.Id);
				}
			}
		}

		// set opps for update to list
		for(Id oppId : projectOppsIdsNoDupl) {
			oppsToUpdate.add(getProjectOpp(oppId,projectOpps));
		}
        */
		//oppsToUpdate = Opportunity_DAO.getOppsBySetOfIds(projectOppsIdsNoDupl);
		//size = oppsToUpdate.size();
		//size = 0;
		update setPusAsUpdated;
	}

	public static Project__c getPuProject(Id projectId, List<Project__c> projects) {
		Project__c project;
		for (Project__c pr : projects) {
			if (projectId.equals(pr.Id)) {
				project = pr;
			}
		}
		if (project == null) {
			throw new ProductboardException('Project was not found for the project user.', 1);
		}
		return project;
	}

	public static Contact getPuContact(Id conId, List<Contact> contacts) {
		Contact con;
		for (Contact c : contacts) {
			if (conId.equals(c.Id)) {
				con = c;
			}
		}
		if (con == null) {
			throw new ProductboardException('Contact was not found for the project user.', 1);
		}
		return con;
	}

	public static Opportunity getProjectOpp(Id oppId, List<Opportunity> opps) {
		Opportunity prOpp;
		for (Opportunity opp : opps) {
			if (opp != null) {
				if (oppId != null) {
					if (oppId.equals(opp.Id)) {
						prOpp = opp;
					}
				}
			}


			//throw new ProductboardException('Opp was not found for the project .', 1);
		}
		return prOpp;
	}

	public static List<Project__c> getPusProjects(List<Project_User__c> projectUsersExceptMasters) {
		Set<Id> puProjectsIds = new Set<Id> ();
		List<Id> puProjectIdsInList = new List<Id> ();
		List<Project__c> puProjects = new List<Project__c> ();
		for (Project_User__c pu : projectUsersExceptMasters) {
			puProjectsIds.add(pu.Project__c);
		}
		for (Id prId : puProjectsIds) {
			puProjectIdsInList.add(prId);
		}
		puProjects = Project_DAO.getProjectsByListOfIds(puProjectIdsInList);
		return puProjects;
	}

}