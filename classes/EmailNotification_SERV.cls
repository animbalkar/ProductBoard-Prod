public class EmailNotification_SERV {

	//*****************************************************************************************************************************************************************
	//SEND EMAIL  
	//*****************************************************************************************************************************************************************    
	public static void sendEmail() {
		// on production use email: hello@productboard.com
		String email = 'michal.mach@enehano.cz';
		Messaging.reserveSingleEmailCapacity(1);
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		String[] toAddresses = new String[] { email };
		mail.setToAddresses(toAddresses);
		mail.setReplyTo('michal.mach@enehano.cz');
		mail.setSenderDisplayName('Productboard');
		mail.setSubject('Account - Contact assignment');

		mail.setHtmlBody('<html><head><title></title></head><body><h2 style="text-align: center;"><span style="color:#008080;"><span style="font-family:lucida sans unicode,lucida grande,sans-serif;">Double account assignment</span></span></h2><hr/>Double assignment to contact was made.<hr/></body></html>');

		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}
}