public class ApiConstants {
	public static final Integer CODE_SUCCESS = 200;
	public static final String MSG_SUCCESS_USER_EMAIL_UPDATE = 'Email updated successfully';
	public static final String MSG_SUCCESS_USER_OPT_IN_UPDATE = 'Opt-In updated successfully';
	public static final String MSG_SUCCESS_USER_NAME_UPDATE = 'User name updated successfully';
	public static final String MSG_SUCCESS_PROJECT_NAME_UPDATE = 'Project name updated successfully';
	public static final String MSG_SUCCESS_TRIAL_END_DATE_UPDATE = 'Project trial end date updated successfully';
	public static final String MSG_SUCCESS_PROJECT_DELETE = 'Project delted successfully';
	public static final String MSG_SUCCESS_BILLING_INFO_UPDATE = 'Billing information updated successfully';
	public static final String MSG_SUCCESS_LEAD_CREATION = 'Lead created successfully';
	public static final String MSG_SUCCESS_LEAD_UPDATE = 'Lead updated successfully';
	public static final String MSG_SUCCESS_NEW_PROJECT_CREATION = 'New project created successfully';
	public static final String MSG_SUCCESS_NEW_SUBSCRIPTION = 'New subscription added successfully';
	public static final String MSG_SUCCESS_SUBSCRIPTION_CANCELATION = 'Subscription canceled successfully';
	public static final String MSG_SUCCESS_SUBSCRIPTION_CHANGE = 'Subscription changed successfully';
	public static final String MSG_SUCCESS_USER_NEW = 'User added successfully';
	public static final String MSG_SUCCESS_USER_REMOVE = 'User removed successfully';
	public static final String MSG_SUCCESS_USER_CHANGE = 'User changed successfully';
	public static final String MSG_SUCCESS_USER_FREEZE = 'User frozen successfully';
	public static final String MSG_SUCCESS_USER_UNFREEZE = 'User unfrozen successfully';

	public static final Integer CODE_FAILED_GENERAL = 400;
	public static final String MSG_FAILED_GENERAL = 'Something went wrong';

	public static final Integer CODE_FAILED_PARAMETERS = 401;
	public static final String MSG_FAILED_PARAMETERS = 'Invalid parameters';

	public static final Integer CODE_FAILED_RECORD_NOT_FOUND = 402;
	public static final Integer CODE_FAILED_MORE_RECORDS_FOUND = 403;
	public static final Integer CODE_FAILED_DML_ERROR = 404;

	public static final Integer CODE_FAILED_PROJECT_NOT_DELETED = 405;
	public static final String MSG_FAILED_PROJECT_NOT_DELETED = 'Project is not in Trial or has an active subscription';

	public static final Integer CODE_FAILED_PROJECT_USER_NOT_FOUND = 406;
	public static final String MSG_FAILED_PROJECT_USER_NOT_FOUND = 'Project user not found';
}