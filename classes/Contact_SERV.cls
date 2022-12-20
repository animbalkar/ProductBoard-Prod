public class Contact_SERV {

	public static void parseContactFullName(String fullName, Contact con) {

		if (fullName.contains(' ')) {
			if (fullName.substringAfter(' ') == null || fullName.substringAfter(' ').equals('') || fullName.substringAfter(' ').equals(' ')) {
				con.LastName = fullName.substringBefore(' ');
			} else {
				con.FirstName = fullName.substringBefore(' ');
				con.LastName = fullName.substringAfter(' ');
			}
		}
		else {
			con.LastName = fullName;
			con.FirstName = null;
		}

	}

}