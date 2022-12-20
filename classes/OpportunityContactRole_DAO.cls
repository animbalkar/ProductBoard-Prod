public class OpportunityContactRole_DAO  {

	public static void insertOpportunityContactRole(OpportunityContactRole role) {

		try {
			insert role;
			System.debug('OpportunityContactRole_DAO: insert - OpportunityContactRole was successfully inserted.');
		}
		catch(DmlException e) {
			System.debug('OpportunityContactRole_DAO: insert - OpportunityContactRole ended with errors');
			throw new ProductboardException('Insert OpportunityContactRole was ended with errors: ' + e.getMessage(), ApiConstants.CODE_FAILED_DML_ERROR);
		}
	}

}