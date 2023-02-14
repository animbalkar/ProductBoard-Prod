<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Burn_Account_MRR_at_Creation</fullName>
        <field>MRR_at_Creation__c</field>
        <formula>Account.Project_s_MRR__c</formula>
        <name>Burn Account MRR at Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cancellation_Survey_Request_Date_Delete</fullName>
        <field>Cancellation_Survey_Requested__c</field>
        <name>Cancellation Survey Request Date Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ContactStatusAttempting</fullName>
        <description>Updated Contact Status  to 3.0 Attempting</description>
        <field>Contact_Status__c</field>
        <literalValue>3.0 Attempting</literalValue>
        <name>ContactStatus to 3.0 Attempting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ContactStatusNurture</fullName>
        <field>Contact_Status__c</field>
        <literalValue>1.1 Nurturing</literalValue>
        <name>ContactStatus to Nurture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ContactStatusWorking</fullName>
        <field>Contact_Status__c</field>
        <literalValue>4.0 Working</literalValue>
        <name>ContactStatus to Working</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Correct_Unknown_Last_Name</fullName>
        <field>LastName</field>
        <formula>&quot;[[unknown]]&quot;</formula>
        <name>Correct Unknown Last Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Detail_Apollo</fullName>
        <field>Lead_Source_Detail__c</field>
        <formula>&quot;Apollo&quot;</formula>
        <name>Lead Source Detail - Apollo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Detail_Cognism</fullName>
        <field>Lead_Source_Detail__c</field>
        <formula>&quot;Cognism&quot;</formula>
        <name>Lead Source Detail - Cognism</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Detail_Slintel</fullName>
        <field>Lead_Source_Detail__c</field>
        <formula>&quot;Slintel&quot;</formula>
        <name>Lead Source Detail - Slintel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Purchased_List</fullName>
        <field>LeadSource</field>
        <literalValue>Purchased List</literalValue>
        <name>Lead Source - Purchased List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Sales_Generated</fullName>
        <field>LeadSource</field>
        <literalValue>Sales Generated</literalValue>
        <name>Lead Source - Sales Generated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Status_0_0_New</fullName>
        <field>Stage_Outreach__c</field>
        <literalValue>0.0 New</literalValue>
        <name>Lead Status - 0.0 New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Alert_Trigger_to_False</fullName>
        <field>Alert_New_Contact_Assigned__c</field>
        <literalValue>0</literalValue>
        <name>Set Alert Trigger to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Timestamp_First_No_Activity_Signal</fullName>
        <field>TS_STS_No_Activity_First__c</field>
        <formula>if(isblank(TS_STS_No_Activity_First__c),now(),TS_STS_No_Activity_First__c)</formula>
        <name>Timestamp First &quot;No Activity&quot; Signal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Timestamp_Latest_No_Activity_Signal</fullName>
        <field>TS_STS_No_Activity_Latest__c</field>
        <formula>now()</formula>
        <name>Timestamp Latest &quot;No Activity&quot; Signal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Timestamp_Smart_Touched_Time</fullName>
        <field>TS_Time_Smart_Touched_manual_first__c</field>
        <formula>now()</formula>
        <name>Timestamp Smart Touched Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Marketing_Opt_Out</fullName>
        <field>Marketing_Opt_Out__c</field>
        <literalValue>1</literalValue>
        <name>Update Marketing Opt Out</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_1</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C1)] - Contact is created&quot;</formula>
        <name>Workflow Log (C1)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_10</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C10)] - Unknown LastName [contact]&quot;</formula>
        <name>Workflow Log (C10)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_2</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C2)] - OutreachStage: Approaching&quot;</formula>
        <name>Workflow Log (C2)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_3</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C3)] - OutreachStage: Replied&quot;</formula>
        <name>Workflow Log (C3)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_4</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C4)] - OutreachStage: Unresponsive&quot;</formula>
        <name>Workflow Log (C4)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_5</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C5)] - Trigger New Contact Assignment Alert&quot;</formula>
        <name>Workflow Log (C5)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_6</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C6)] - Empty Lead Source Alert&quot;</formula>
        <name>Workflow Log (C6)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_7</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C7)] - Smart Touch Signal - Not Activity [Timestamp]&quot;</formula>
        <name>Workflow Log (C7)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_8</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C8)] - Timestamp Smart Touched Time&quot;</formula>
        <name>Workflow Log (C8)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_9</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C9)] - Message: Smart Touch Signal - Not Activity&quot;</formula>
        <name>Workflow Log (C9)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_C12</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C12)] - Set Lead Source: Sales Generated; Lead Source Detail: Apollo&quot;</formula>
        <name>Workflow Log (C12)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_C13</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C13)] - Set Lead Source: Sales Generated; Lead Source Detail: Slintel&quot;</formula>
        <name>Workflow Log (C13)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_C14</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C14)] - Set Lead Source: Sales Generated; Lead Source Detail: Cognism&quot;</formula>
        <name>Workflow Log (C14)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_C15</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C15)] - Set Lead Source: Sales Generated&quot;</formula>
        <name>Workflow Log (C15)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_C16</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(C16)] - Set Lead Source: Purchased List&quot;</formula>
        <name>Workflow Log (C16)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Alert_on_Empty_Lead_Source</fullName>
        <apiVersion>45.0</apiVersion>
        <endpointUrl>https://hooks.zapier.com/hooks/catch/3881934/jr1vs6/</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>jakub@productboard.com</integrationUser>
        <name>Alert on Empty Lead Source</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Contact_Webhook_Info_to_Zapier</fullName>
        <apiVersion>45.0</apiVersion>
        <endpointUrl>https://hooks.zapier.com/hooks/catch/3881934/jdx8n0/</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>jakub@productboard.com</integrationUser>
        <name>Contact Webhook Info to Zapier</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>GF_Survey_SurveyJun162020_65a2d769</fullName>
        <apiVersion>39.0</apiVersion>
        <endpointUrl>https://www.getfeedback.com/campaigns/L3tP3dRH/transactional_send</endpointUrl>
        <fields>AccountId</fields>
        <fields>Account_ID_Long_Contact__c</fields>
        <fields>Email</fields>
        <fields>FirstName</fields>
        <fields>Id</fields>
        <fields>LastName</fields>
        <fields>Primary_Project_for_Cancellation_Survey__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>lika@productboard.com</integrationUser>
        <name>GetFeedback_Cancellation_Survey</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>STS_No_Activity_Alert_to_Slack</fullName>
        <apiVersion>45.0</apiVersion>
        <endpointUrl>https://hooks.zapier.com/hooks/catch/3881934/jklbnq/</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>jakub@productboard.com</integrationUser>
        <name>STS - No Activity - Alert to Slack -</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>%5BW%28C1%29%5D Contact is created</fullName>
        <actions>
            <name>Burn_Account_MRR_at_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>isblank( MRR_at_Creation__c )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C1%29%5D GF Cancellation Survey Send</fullName>
        <actions>
            <name>Cancellation_Survey_Request_Date_Delete</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>GF_Survey_SurveyJun162020_65a2d769</name>
            <type>OutboundMessage</type>
        </actions>
        <actions>
            <name>Cancellation_Request_Sent</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>contains</operation>
            <value>productboard</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Cancellation_Survey_Requested__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C10%29%5D Unknown LastName %5Bcontact%5D</fullName>
        <actions>
            <name>Correct_Unknown_Last_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_10</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Updates Unknown LastName to allow for Add/Append</description>
        <formula>OR( 
LastName=&quot;Unknown&quot;, 
LastName=&quot;Not provided&quot;, 
LastName=&quot;[not provided]&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C11%29%5DSales%2FMarketing opt out</fullName>
        <actions>
            <name>Update_Marketing_Opt_Out</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.HasOptedOutOfEmail</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C12%29%5D Lead Source - Apollo</fullName>
        <actions>
            <name>Lead_Source_Detail_Apollo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Source_Sales_Generated</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_C12</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.LeadSource</field>
            <operation>equals</operation>
            <value>Apollo</value>
        </criteriaItems>
        <description>Workflow rule that splits up LeadSource inputs from Apollo to Lead Source + Lead Source Detail</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C13%29%5D Lead Source - Slintel</fullName>
        <actions>
            <name>Lead_Source_Detail_Slintel</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Source_Sales_Generated</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_C13</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.LeadSource</field>
            <operation>equals</operation>
            <value>Slintel</value>
        </criteriaItems>
        <description>Workflow rule that splits up LeadSource inputs from Apollo to Lead Source + Lead Source Detail</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C14%29%5D Lead Source - Cognism</fullName>
        <actions>
            <name>Lead_Source_Detail_Cognism</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Source_Sales_Generated</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_C14</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.LeadSource</field>
            <operation>equals</operation>
            <value>Cognism</value>
        </criteriaItems>
        <description>Workflow rule that splits up LeadSource inputs from Apollo to Lead Source + Lead Source Detail</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C15%29%5D Lead Source - 6sense - Sales Intelligence</fullName>
        <actions>
            <name>Lead_Source_Sales_Generated</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Status_0_0_New</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_C15</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Detail__c</field>
            <operation>equals</operation>
            <value>6sense</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.contactSourceType6sense__c</field>
            <operation>equals</operation>
            <value>Sales Intelligence</value>
        </criteriaItems>
        <description>Workflow rule that sets Lead Source from 6sense based on Contact Source Type</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C16%29%5D Lead Source - 6sense - Orchestration</fullName>
        <actions>
            <name>Lead_Source_Purchased_List</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Status_0_0_New</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_C16</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Detail__c</field>
            <operation>equals</operation>
            <value>6sense</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.contactSourceType6sense__c</field>
            <operation>equals</operation>
            <value>Orchestration</value>
        </criteriaItems>
        <description>Workflow rule that sets Lead Source from 6sense based on Contact Source Type</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C2%29%5D OutreachStage%3A Approaching</fullName>
        <actions>
            <name>ContactStatusAttempting</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
   Contact_Status_Number__c  &lt; 3,
   ISCHANGED( Stage_Outreach__c ) ,
   ISPICKVAL(Stage_Outreach__c, &quot;Approaching&quot;)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C3%29%5D OutreachStage%3A Replied</fullName>
        <actions>
            <name>ContactStatusWorking</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
   Contact_Status_Number__c  &lt; 4,
   ISCHANGED( Stage_Outreach__c ) ,
   ISPICKVAL(Stage_Outreach__c, &quot;Replied&quot;)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C4%29%5D OutreachStage%3A Unresponsive</fullName>
        <actions>
            <name>ContactStatusNurture</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
    Contact_Status_Number__c  &lt;= 4,
   ISCHANGED( Stage_Outreach__c ) ,
   ISPICKVAL(Stage_Outreach__c, &quot;Unresponsive&quot;)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C5%29%5D Trigger New Contact Assignment Alert</fullName>
        <actions>
            <name>Set_Alert_Trigger_to_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_5</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Contact_Webhook_Info_to_Zapier</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Alert_New_Contact_Assigned__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C6%29%5D Empty Lead Source Alert</fullName>
        <actions>
            <name>Workflow_Log_6</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Alert_on_Empty_Lead_Source</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>and(
ischanged( LeadSource ),
ISPICKVAL(LeadSource,&quot;&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C7%29%5D Smart Touch Signal - Not Activity %5BTimestamp%5D</fullName>
        <actions>
            <name>Timestamp_First_No_Activity_Signal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Timestamp_Latest_No_Activity_Signal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_7</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Listener for &quot;No Activity&quot; Smart Touch signal</description>
        <formula>and(
ischanged(Smart_Touch_Signal_No_Activity__c),
not(isblank(Smart_Touch_Signal_No_Activity__c))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C8%29%5D Timestamp Smart Touched Time</fullName>
        <actions>
            <name>Timestamp_Smart_Touched_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_8</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>and( Smart_Touched_manual__c = True,
Selected_to_Smart_Touch_Experiment_Group__c &lt;&gt; &quot;Control Group&quot;
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28C9%29%5D Message%3A Smart Touch Signal - Not Activity</fullName>
        <actions>
            <name>Workflow_Log_9</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>STS_No_Activity_Alert_to_Slack</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <description>Outbound message to Slack for &quot;No Activity&quot; Smart Touch signal.</description>
        <formula>and(
ischanged(Smart_Touch_Signal_No_Activity__c),
not(isblank(Smart_Touch_Signal_No_Activity__c)),
ISPICKVAL( Business_Segment__c , &quot;2. Smart Touch&quot;),
Selected_to_Smart_Touch_Experiment_Group__c = &quot;experiment&quot;
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Cancellation_Request_Sent</fullName>
        <assignedToType>creator</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Cancellation Request Sent</subject>
    </tasks>
</Workflow>
