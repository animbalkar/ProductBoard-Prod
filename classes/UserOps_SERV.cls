public class UserOps_SERV {
 

	public static void updateUserPbOptIn(String fullName, Double userId, String pbOptIn, IntegrationLog__c il) {
        List<Lead> leads = [SELECT Id
                            FROM Lead
                            WHERE User_PB_ID__c = :userId AND IsConverted = false];		
        il.Description__c += '\n- Leads found. count: ' + leads.size();

        List<Contact> contacts = [SELECT Id
                                    FROM Contact
                                    WHERE User_PB_ID__c = :userId];		
        il.Description__c += '\n- Contacts found. count: ' + contacts.size();

        for(Lead lead : leads){
            lead.Productboard_Opt_in__c = Boolean.valueOf(pbOptIn);
            il.Description__c += '\n- Lead set for update. id: ' + lead.Id;
        }

        for(Contact con : contacts){
            if(fullName != null) Contact_SERV.parseContactFullName(fullName, con);
            con.Productboard_Opt_in__c = Boolean.valueOf(pbOptIn);
            il.Description__c += '\n- Contact set for update. id: ' + con.Id;
        }

        if(!leads.isEmpty()){
            update leads;
        }
        if(!contacts.isEmpty()){
            update contacts;
        }
	}

	public static void updateUserFullName(String fullName, Double userId, IntegrationLog__c il) {
        List<Lead> existingLeads = [SELECT Id
                                    FROM Lead
                                    WHERE User_PB_ID__c = :userId];
        il.Description__c += '\n- Existing Leads. count: ' + existingLeads.size();
        List<Contact> existingContacts = [SELECT Id
                                            FROM Contact
                                            WHERE User_PB_ID__c = :userId];
        il.Description__c += '\n- Existing Contacts. count: ' + existingContacts.size();
        if (existingLeads.isEmpty() && existingContacts.isEmpty()) {
            il.Description__c += '\n- No leads or contacts were found';
        } else {
            if (!existingLeads.isEmpty()) {
                for (Lead l : existingLeads) {
                    Lead_SERV.parseLeadFullName(fullName,l);
                    il.Description__c += '\n- Lead to update. id: ' + l.Id;
                }
                update existingLeads;
                il.Description__c += '\n- Leads Updated.';
            }
            if (!existingContacts.isEmpty()) {
                for(contact c : existingContacts){
                    Contact_SERV.parseContactFullName(fullName, c);
                    il.Description__c += '\n- Contact to update. id: ' + c.Id;
                }
                update existingContacts;
                il.Description__c += '\n- Contacts Updated.';
            }
        }	
	}
	
	public static void updateUserEmail(String newEmail, Double userId, IntegrationLog__c il) {
        List<Project_User__c> existingProjectUsers = [SELECT Id 
                                                        FROM Project_User__c
                                                        WHERE Contact__r.User_PB_ID__c = :userId];
        il.Description__c += '\n- ProjectUsers found. count: ' + existingProjectUsers.size();
        List<Lead> existingLeads = [SELECT Id 
                                    FROM Lead
                                    WHERE User_PB_ID__c = :userId];
        il.Description__c += '\n- Leads found. count: ' + existingLeads.size();
        List<Contact> existingContacts = [SELECT Id 
                                            FROM Contact
                                            WHERE User_PB_ID__c = :userId];
        il.Description__c += '\n- Contacts found. count: ' + existingContacts.size();
        if (existingLeads.isEmpty() && existingContacts.isEmpty() && existingProjectUsers.isEmpty()) {
            il.Description__c += '\n- No leads, contacts or project users were found';
        } else {  
            // PROJECT USERS UPDATE
            for (Project_User__c pu : existingProjectUsers) {
                pu.Name = newEmail;
                il.Description__c += '\n- ProjectUser to updated. id: ' + pu.Id;
            }
            update existingProjectUsers; 
            // LEADS UPDATE 
            for (Lead l : existingLeads) {
                l.Email = newEmail;
                il.Description__c += '\n- Lead to updated. id: ' + l.Id;
            }
            update existingLeads;
            // CONTACTS UPDATE
            for (Contact c : existingContacts) {
                c.Email = newEmail;
                il.Description__c += '\n- Contact to updated. id: ' + c.Id;
            }
            update existingContacts;               
        }
    }

}