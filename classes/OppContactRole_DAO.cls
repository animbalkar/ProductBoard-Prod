public class OppContactRole_DAO  {

	public static List<OpportunityContactRole> getExistingOppContactRoles(Id oppId, Id conId) {
		List<OpportunityContactRole> contactRoles = [SELECT ContactId,CreatedById,CreatedDate,Id,IsDeleted,IsPrimary,
													LastModifiedById,LastModifiedDate,OpportunityId,Role,SystemModstamp
													FROM OpportunityContactRole
													WHERE OpportunityId = :oppId AND ContactId = :conId];
		return contactRoles;
	}

	public static List<OpportunityContactRole> getExistingOppContactRolesByConId(Id conId) {
		List<OpportunityContactRole> contactRoles = [SELECT ContactId,CreatedById,CreatedDate,Id,IsDeleted,IsPrimary,
													LastModifiedById,LastModifiedDate,OpportunityId,Role,SystemModstamp
													FROM OpportunityContactRole
													WHERE OpportunityId != null AND ContactId = :conId];
		return contactRoles;
	}

	public static List<OpportunityContactRole> getExistingPrimaryOppContactRolesByConId(Id conId) {
		List<OpportunityContactRole> contactRoles = [SELECT ContactId,CreatedById,CreatedDate,Id,IsDeleted,IsPrimary,
													LastModifiedById,LastModifiedDate,OpportunityId,Role,SystemModstamp
													FROM OpportunityContactRole
													WHERE OpportunityId != null AND ContactId = :conId AND IsPrimary = true];
		return contactRoles;
	}

	public static List<OpportunityContactRole> getExistingOppContactRolesByOppId(Id oppId) {
		List<OpportunityContactRole> contactRoles = [SELECT ContactId,CreatedById,CreatedDate,Id,IsDeleted,IsPrimary,
													LastModifiedById,LastModifiedDate,OpportunityId,Role,SystemModstamp
													FROM OpportunityContactRole
													WHERE OpportunityId = :oppId];
		return contactRoles;
	}

	/*
	public static void insertContactRole(OpportunityContactRole conRole) {

		try {
			insert conRole;
			System.debug('OpportunityContactRole_DAO: insert - OpportunityContactRole was successfully inserted.');
		}
		catch(DmlException e) {
			System.debug('OpportunityContactRole_DAO: insert - OpportunityContactRole ended with errors');
			throw new ProductboardException('Insert OpportunityContactRole was ended with errors: ' + e.getMessage(), 1);
		}
	}

	public static void updateContactRole(OpportunityContactRole conRole) {

		try {
			update conRole;
			System.debug('OpportunityContactRole_DAO: update - OpportunityContactRole was successfully updated.');
		}
		catch(DmlException e) {
			System.debug('OpportunityContactRole_DAO: update - OpportunityContactRole ended with errors');
			throw new ProductboardException('Update OpportunityContactRole was ended with errors: ' + e.getMessage(), 1);
		}

	}
	*/
}