global class ConvertLeadPlugin implements Process.Plugin {
    
    global Process.PluginDescribeResult describe() {
        
        // set up plugin metadata
        Process.PluginDescribeResult result = new Process.PluginDescribeResult();
        result.description = 'The LeadConvert Flow Plug-in converts a lead into an account and contact.';
        result.tag = 'Lead Management';
        
        // Create a list that stores both mandatory and optional
        // Collections are not currently supported
        
        result.inputParameters = new List<Process.PluginDescribeResult.InputParameter> {
            // mandatory = true
            new Process.PluginDescribeResult.InputParameter('LeadID', Process.PluginDescribeResult.ParameterType.STRING, true),
            new Process.PluginDescribeResult.InputParameter('AccountID', Process.PluginDescribeResult.ParameterType.STRING, true),
            new Process.PluginDescribeResult.InputParameter('ContactID', Process.PluginDescribeResult.ParameterType.STRING, false)
            };
                    
                    // Create a list that stores *output* parameters sent *to* your flow.
                    result.outputParameters = new List<Process.PluginDescribeResult.OutputParameter>{
                        // Account ID, Contact ID of the converted lead
                        new Process.PluginDescribeResult.OutputParameter('AccountID', Process.PluginDescribeResult.ParameterType.STRING),
                            new Process.PluginDescribeResult.OutputParameter('ContactID', Process.PluginDescribeResult.ParameterType.STRING)
                            };    
                                
                                return result;
    }
    
    
    global Process.PluginResult invoke(Process.PluginRequest request) {
        
        // get parameters
        String leadId = (String) request.inputParameters.get('LeadID');
        String accountId = (String) request.inputParameters.get('AccountID');
        String contactId = (String) request.inputParameters.get('ContactID');
        
        // convert lead
        Contact convertedContact;
        Account convertedAccount;
        
        Database.LeadConvert Leadconvert = new Database.LeadConvert();
        Leadconvert.setLeadId(leadId);        
        Leadconvert.setAccountId(accountId);        
        if (contactId != null) {
            Leadconvert.setContactId(contactId);
        }
        LeadStatus Leads= [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        Leadconvert.setConvertedStatus(Leads.MasterLabel);
        Leadconvert.setDoNotCreateOpportunity(TRUE); 
        Database.LeadConvertResult Leadconverts = Database.convertLead(Leadconvert);
        convertedContact = [SELECT Id,AccountId FROM Contact WHERE Id =:Leadconverts.getContactId()];
        convertedAccount = [SELECT Id, Name FROM Account WHERE Id =:Leadconverts.getAccountId()];
        
        // set result
        Map<String,Object> result = new Map<String,Id>();
        result.put('AccountID', convertedAccount.Id);
        result.put('ContactID', convertedContact.Id);
        
        return new Process.PluginResult(result);
    }
    
}