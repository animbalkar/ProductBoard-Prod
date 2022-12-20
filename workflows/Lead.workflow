<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Correct_Unknown_Last_Name_lead</fullName>
        <field>LastName</field>
        <formula>&quot;[[unknown]]&quot;</formula>
        <name>Correct Unknown Last Name [lead]</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Website</fullName>
        <description>Fills in website by inputting email domain.</description>
        <field>Website</field>
        <formula>&quot;http://www.&quot; &amp; email_domain__c</formula>
        <name>Fill in Website</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LeadStatusWorking</fullName>
        <field>Status</field>
        <literalValue>4.0 Working</literalValue>
        <name>LeadStatus to 4.0 Working</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LeadStatus_to_1_1_Nurturing</fullName>
        <field>Status</field>
        <literalValue>1.1 Nurturing</literalValue>
        <name>LeadStatus to 1.1 Nurturing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LeadStatus_to_3_0_Attempting</fullName>
        <field>Status</field>
        <literalValue>3.0 Attempting</literalValue>
        <name>LeadStatus to 3.0 Attempting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Status_Updated_Date</fullName>
        <description>Update &quot;Lead Status Last Updated&quot; Date field when Lead Status Changes</description>
        <field>Status_Last_Updated__c</field>
        <formula>now()</formula>
        <name>Lead Status Updated Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Acquisition_Program_APEX</fullName>
        <description>Action populating the Acquisition Program field with the value of WF APEX Try Now Form for leads not picked up by the Marketo Hidden Form</description>
        <field>mkto71_Acquisition_Program__c</field>
        <formula>&quot;APEX 2019-03-21 Try Now&quot;</formula>
        <name>Populate Acquisition Program  : APEX</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Push_Newsletter_LS_to_Legacy_LS_field</fullName>
        <description>action that pushes the value of Newsletter from Lead Source to Legacy Lead Source (March 2019) field</description>
        <field>Legacy_Lead_Source_March_2019__c</field>
        <literalValue>Newsletter</literalValue>
        <name>Push Newsletter LS to Legacy LS field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Push_Newsletter_to_Acquisition_Program</fullName>
        <description>Populating acquisition program on leads created via newsletter APEX call</description>
        <field>mkto71_Acquisition_Program__c</field>
        <formula>&quot;WF 2019-03-21 Newsletter&quot;</formula>
        <name>Push &quot;Newsletter&quot; to Acquisition Program</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Alert_Trigger_to_False</fullName>
        <field>Alert_New_Lead_Assigned__c</field>
        <literalValue>0</literalValue>
        <name>Set Alert Trigger to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Status</fullName>
        <description>Set Lead Status to &quot;New&quot;</description>
        <field>Status</field>
        <literalValue>New</literalValue>
        <name>Update Lead Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Marketing_oupt_out</fullName>
        <field>Marketing_Opt_Out__c</field>
        <literalValue>1</literalValue>
        <name>Update Marketing oup tout</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_from_New_to_1_0_New</fullName>
        <field>Status</field>
        <literalValue>1.0 New</literalValue>
        <name>Update Status from New to 1.0 New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_1</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(L1)] - Status New to Lead Status 1.0 New&quot;</formula>
        <name>Workflow Log (L1)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_2</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(L2)] - OutreachStage: Approaching&quot;</formula>
        <name>Workflow Log (L2)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_3</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(L3)] - OutreachStage: Replied&quot;</formula>
        <name>Workflow Log (L3)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_4</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(L4)] - OutreachStage: Unresponsive&quot;</formula>
        <name>Workflow Log (L4)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_5</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(L5)] - Trigger Lead Assignment Alert&quot;</formula>
        <name>Workflow Log (L5)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_6</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(L6)] - Unknown Last Name [lead]&quot;</formula>
        <name>Workflow Log (L6)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_7</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(L7)] - Temp : Newsletter : populate Legacy Lead Source (March 2019)&quot;</formula>
        <name>Workflow Log (L7)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>R_4ec28c50fd0e4b769cb9439e84525e52</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/4ec28c50-fd0e-4b76-9cb9-439e84525e52?t=tbw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lisa.larson@productboard.com</integrationUser>
        <name>R_4ec28c50fd0e4b769cb9439e84525e52</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Zapier_Webhook</fullName>
        <apiVersion>45.0</apiVersion>
        <endpointUrl>https://hooks.zapier.com/hooks/catch/3881934/jdcvwj/</endpointUrl>
        <fields>Company</fields>
        <fields>Full_Name__c</fields>
        <fields>Id</fields>
        <fields>OwnerId</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>jakub@productboard.com</integrationUser>
        <name>Zapier Webhook</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>%5BW%28L1%29%5D Status New to Lead Status 1%2E0 New</fullName>
        <actions>
            <name>Update_Status_from_New_to_1_0_New</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL(Status,&quot;New&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28L2%29%5D OutreachStage%3A Approaching</fullName>
        <actions>
            <name>LeadStatus_to_3_0_Attempting</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( 
Contact_Status_Number__c &lt; 3, 
ISCHANGED( Stage_Outreach__c ) , 
ISPICKVAL(Stage_Outreach__c, &quot;Approaching&quot;) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28L3%29%5D OutreachStage%3A Replied</fullName>
        <actions>
            <name>LeadStatusWorking</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( 
Contact_Status_Number__c &lt; 4, 
ISCHANGED( Stage_Outreach__c ) , 
ISPICKVAL(Stage_Outreach__c, &quot;Replied&quot;) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28L4%29%5D OutreachStage%3A Unresponsive</fullName>
        <actions>
            <name>LeadStatus_to_1_1_Nurturing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( 
Contact_Status_Number__c &lt;= 4, 
ISCHANGED( Stage_Outreach__c ) , 
ISPICKVAL(Stage_Outreach__c, &quot;Unresponsive&quot;) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28L5%29%5D Trigger Lead Assignment Alert</fullName>
        <actions>
            <name>Set_Alert_Trigger_to_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_5</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Zapier_Webhook</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>Alert_New_Lead_Assigned__c = True</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28L6%29%5D Unknown Last Name %5Blead%5D</fullName>
        <actions>
            <name>Correct_Unknown_Last_Name_lead</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Changes &quot;Not Provided&quot; Name to [[unknown]], so clearbit can add/append it.</description>
        <formula>OR(
LastName=&quot;Unknown&quot;,
LastName=&quot;[[unknown]]&quot;,
LastName=&quot;Not provided&quot;,
LastName=&quot;[not provided]&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28L7%29%5D Temp %3A Newsletter %3A populate Legacy Lead Source %28March 2019%29</fullName>
        <actions>
            <name>Push_Newsletter_LS_to_Legacy_LS_field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_7</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Temporary fix - for leads created via the Newsletter email collection form, populate the Legacy Lead Source (March 2019) field with value of Newsletter, because Marketo is overwriting Lead Source of these leads with Website Direct value</description>
        <formula>ISPICKVAL(LeadSource,&quot;Newsletter&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28L9%29%5DSales%2FMarketing Opt Out</fullName>
        <actions>
            <name>Update_Marketing_oupt_out</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.HasOptedOutOfEmail</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Status Last Updated Date Set</fullName>
        <actions>
            <name>Lead_Status_Updated_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>IsChanged( Status )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Rattle_Lead MQL SLA%3A Alert Owner after 4 hours to Follow up</fullName>
        <active>false</active>
        <formula>AND(ISPICKVAL(Status, &quot;0.0 New&quot;), NOT ISBLANK(Lifecycle_Stage_Latest_MQL_Date__c), IsConverted = false)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>R_4ec28c50fd0e4b769cb9439e84525e52</name>
                <type>OutboundMessage</type>
            </actions>
            <offsetFromField>Lead.Lifecycle_Stage_Latest_MQL_Date__c</offsetFromField>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
