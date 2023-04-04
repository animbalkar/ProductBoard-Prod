<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_CS_Leads_of_new_High_Touch_Accounts</fullName>
        <description>Alert CS Leads of new High Touch Accounts</description>
        <protected>false</protected>
        <recipients>
            <recipient>ami.heller@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>boge.sotirovski@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dorota.ziakova@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>gillian.kershaw@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kate.villanueva@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>keith.wong@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>layla.selick@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ligia.augusto@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>samantha.chikmoroff@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>taylor.mcguire@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/New_Account_for_CS_Team</template>
    </alerts>
    <alerts>
        <fullName>Alert_CS_of_Stage_3_50K_Deal</fullName>
        <description>Alert CS of Stage 3 $50K+ Deal</description>
        <protected>false</protected>
        <recipients>
            <recipient>allison.jones@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ami.heller@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>billy.robins@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>boge.sotirovski@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>john@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kate.villanueva@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>layla.selick@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>samantha.chikmoroff@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sarah.judge@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/CS_Alert_50K_opp_Stage_3</template>
    </alerts>
    <alerts>
        <fullName>Closed_Lost_Opp</fullName>
        <ccEmails>e4e2p2d6e4y8i6v8@productboard.slack.com</ccEmails>
        <description>Closed Lost Opp</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/Opp_Lost_Alert</template>
    </alerts>
    <alerts>
        <fullName>Contract_Churn_Reasons_to_Slack</fullName>
        <ccEmails>cs-customers-churned-aaaacmx4bulbb6ay24jjy3mcqi@productboard.slack.com</ccEmails>
        <description>Contract Churn Reasons to Slack</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>john@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/Contract_Churn_Response</template>
    </alerts>
    <alerts>
        <fullName>Deal_Won_Notification</fullName>
        <ccEmails>hubert@productboard.com,</ccEmails>
        <ccEmails>customersuccess@productboard.com,</ccEmails>
        <ccEmails>oxygen-revenue-aaaaaavft6pgjcfyrpvya5c6ia@productboard.slack.com,</ccEmails>
        <ccEmails>lisa.larson@productboard.com</ccEmails>
        <description>Deal Won Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>CSM_Manager_Tier_3_4</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>CSM_Tier_3_4</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Head_of_Sales</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>darcy.doyle@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michael.solomon@productboard.com.mm</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>SDR__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/Opp_Won_Alert_New</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_Primary_Partner_Contact</fullName>
        <description>Email Alert to Primary Partner Contact</description>
        <protected>false</protected>
        <recipients>
            <field>Services_Partner_SA__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>allison.jones@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ami.heller@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Partner_Opp_Notification</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_SA</fullName>
        <description>Email Alert to SA Assigned</description>
        <protected>false</protected>
        <recipients>
            <recipient>ami.heller@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>boge.sotirovski@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Solution_Architect__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SA_Opp_Notification</template>
    </alerts>
    <alerts>
        <fullName>New_Trial_Alert_SMB_AEs</fullName>
        <description>New Trial Alert - SMB AEs</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/New_Trial_Alert_SDRs</template>
    </alerts>
    <alerts>
        <fullName>New_Trial_Alert_to_SDRs</fullName>
        <description>New Trial Alert to SDRs</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>kaeli.finlayson@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mike.liranzo@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/New_Trial_Alert_SDRs</template>
    </alerts>
    <alerts>
        <fullName>Renewal_Opportunity_Won</fullName>
        <ccEmails>cs-customers-renewed-aaaacla6n4h3h3fthbmrgvzcei@productboard.slack.com,</ccEmails>
        <description>Renewal Opportunity Won</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/Renewals_Won_Alert</template>
    </alerts>
    <alerts>
        <fullName>Renewal_Provisioning</fullName>
        <ccEmails>t-renewals-provisioni-aaaafvwrgw77mrmzngfnqcztma@productboard.slack.com</ccEmails>
        <description>Renewal Provisioning</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/Renewal_Provisioning_Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Burn_in_Closed_Lost_Date</fullName>
        <field>Date_Closed_won__c</field>
        <formula>TODAY()</formula>
        <name>Burn in Closed Lost Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Burn_in_Date_Pipeline_Added</fullName>
        <description>Burns in the date when the opp was transferred to a pipeline.</description>
        <field>Date_Pipeline_Added__c</field>
        <formula>TODAY()</formula>
        <name>Burn in Date Pipeline Added</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Burn_in_Date_Transferred_to_0_1_or_above</fullName>
        <description>Burns in Date Transferred to 0.1 or above</description>
        <field>Date_Transferred_to_0_1__c</field>
        <formula>TODAY()</formula>
        <name>Burn in Date Transferred to 0.1 or above</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Burn_in_Date_Transferred_to_0_2_or_above</fullName>
        <description>Burns in Date Transferred to 0.2 or above</description>
        <field>Date_Transferred_to_0_2__c</field>
        <formula>TODAY()</formula>
        <name>Burn in Date Transferred to 0.2 or above</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Burn_in_Date_Transferred_to_1_0_or_above</fullName>
        <field>Date_Transferred_to_1_0__c</field>
        <formula>TODAY()</formula>
        <name>Burn in Date Transferred to 1.0 or above</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Burn_in_Date_Transferred_to_2_0_or_above</fullName>
        <field>Date_Transferred_to_2_0__c</field>
        <formula>TODAY()</formula>
        <name>Burn in Date Transferred to 2.0 or above</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Burn_in_Date_Transferred_to_3_0_or_above</fullName>
        <field>Date_Transferred_to_3_0__c</field>
        <formula>today()</formula>
        <name>Burn in Date Transferred to 3.0 or above</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Burn_in_Date_Transferred_to_4_0_or_above</fullName>
        <field>Date_Transferred_to_4_0__c</field>
        <formula>TODAY()</formula>
        <name>Burn in Date Transferred to 4.0 or above</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Burn_in_Date_Transferred_to_5_0_or_above</fullName>
        <field>Date_Transferred_to_5_0__c</field>
        <formula>TODAY()</formula>
        <name>Burn in Date Transferred to 5.0 or above</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_from</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Standard</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>SS -&gt; STD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_Base_Stage</fullName>
        <field>StageName</field>
        <literalValue>0.0 New</literalValue>
        <name>Change to Base Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_Type_to_Std</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Standard</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change to Type to Std</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_Lost_Close_Date_to_Today_s_Date</fullName>
        <description>Updates close date to today&apos;s date when opportunity is closed lost.</description>
        <field>CloseDate</field>
        <formula>TODAY()</formula>
        <name>Close Lost Close Date to Today&apos;s Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Duplicate_Created_Date</fullName>
        <description>Duplicates Created Date to Created Date (TEMP)</description>
        <field>Trial_Start_Date__c</field>
        <formula>CreatedDate</formula>
        <name>FU: Duplicate Created Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Date_Self_Service_Subscribed</fullName>
        <field>Date_Self_Service_Subscribed__c</field>
        <formula>today()</formula>
        <name>Fill in Date Self Service Subscribed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Opportunity_Date_Assigned</fullName>
        <description>Fills in Opportunity Date assigned to Today</description>
        <field>Opportunity_Date_Assigned__c</field>
        <formula>today()</formula>
        <name>Fill in Opportunity Date Assigned</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_Burn_in_Snapshot</fullName>
        <field>Stage_Num_Snapshot__c</field>
        <formula>Stage_Numeric__c</formula>
        <name>Stage # Burn in (Snapshot)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Test_Update_Stage</fullName>
        <field>Admin_Test_Field__c</field>
        <formula>Stage_Numeric__c</formula>
        <name>Test: Update Stage #</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateNextStep</fullName>
        <field>Next_Step_Last_Updated__c</field>
        <formula>Today()</formula>
        <name>UpdateNextStep</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Amount_to36k</fullName>
        <field>Amount</field>
        <formula>36000</formula>
        <name>Update Amount to $36K</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Close_Date_Today</fullName>
        <field>CloseDate</field>
        <formula>TODAY()</formula>
        <name>Update Close Date Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Close_Date_to_Today</fullName>
        <field>CloseDate</field>
        <formula>Today()</formula>
        <name>Update Close Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_Sales_Closed</fullName>
        <field>Date_Sales_Closed__c</field>
        <formula>today()</formula>
        <name>Update Date Sales Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_Self_Service_Subscribed</fullName>
        <description>Updates the date the opp subscribed self service</description>
        <field>Date_Self_Service_Subscribed__c</field>
        <formula>today()</formula>
        <name>Update Date Self Service Subscribed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Max_Stage_Achieved</fullName>
        <field>Max_Stage_Achieved__c</field>
        <formula>Stage_Numeric__c</formula>
        <name>Update Max Stage Achieved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opp_Date_Assigned</fullName>
        <description>Updates Opportunity Date Assigned to Today</description>
        <field>Opportunity_Date_Assigned__c</field>
        <formula>today()</formula>
        <name>Update Opp Date Assigned</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Sales_Touched</fullName>
        <field>Sales_Touched__c</field>
        <literalValue>1</literalValue>
        <name>Update Sales Touched</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stage_to_0_2</fullName>
        <description>Updates Opp Stage to 0.2 after filling in DM Date</description>
        <field>StageName</field>
        <literalValue>0.2 Replied</literalValue>
        <name>Update Stage to 0.2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Start_Date</fullName>
        <field>Service_Start_Date__c</field>
        <formula>CloseDate</formula>
        <name>Update Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status</fullName>
        <field>Approval_Status__c</field>
        <literalValue>In Review</literalValue>
        <name>Update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_to_Draft</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Draft</literalValue>
        <name>Update Status to Draft</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Workflow_Log_W_O29</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O29)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Update Workflow Log [W(O29)]</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O1)] - Opp Routed To Sales&quot;</formula>
        <name>Workflow Log (O1)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_1</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O2)] - Burn Account MRR at opp Creation&quot;</formula>
        <name>Workflow Log (O2)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_10</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O11)] - Move to 0.2 after filling in DM Date&quot;</formula>
        <name>Workflow Log (O11)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_11</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O12)] - Stage # Burn in (Snapshot)&quot;</formula>
        <name>Workflow Log (O12)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_12</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;[W(O13)] Date Stamps Stage 0.1&quot;</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_13</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O14)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_14</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O15)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_15</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O16)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_16</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O17)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_17</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O18)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_18</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O19)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_19</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O20)] - Update Next Steps Last Updated Field&quot;</formula>
        <name>Workflow Log (O20)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_2</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O3)] - Burn in Opportunity Date Assigned&quot;</formula>
        <name>Workflow Log (O3)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_20</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O21)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_21</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O22)] - Fill Date Assigned after Changing Owner by Sales Person&quot;</formula>
        <name>Workflow Log (O22)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_22</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O23)] - Date Self Service Subscribed&quot;</formula>
        <name>Workflow Log (O23)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_23</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O24)] - Watchdog - Date Assigned Check&quot;</formula>
        <name>Workflow Log (O24)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_24</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O25)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_25</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O26)] - Fill in Opportunity Date Assigned&quot;</formula>
        <name>Workflow Log (O26)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_26</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O27)] - Closed Won Owned by Sales&quot;</formula>
        <name>Workflow Log (27)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_27</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O28)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_3</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O4)] - Duplicate Created Date&quot;</formula>
        <name>Workflow Log (O4)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_4</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O5)] - Burn in Initial DM date&quot;</formula>
        <name>Workflow Log (O4)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_5</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O6)] - Mark Sales Touched&quot;</formula>
        <name>Workflow Log (O6)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_6</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O7)] - Opp Won&quot;</formula>
        <name>Workflow Log (O7)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_7</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O8)] - Burn in Date Pipeline Added&quot;</formula>
        <name>Workflow Log (O8)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_8</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O9)] - Closed Lost Date when Sales Closed&quot;</formula>
        <name>Workflow Log (O9)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_O10</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(O10)] - Max Stage Achieved when Opp Created &gt; 0 Stage&quot;</formula>
        <name>Workflow Log (O10)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Notify_CSMs</fullName>
        <apiVersion>44.0</apiVersion>
        <description>Notifies CSMs on Slack that a new deal with ARR&gt;6k was closed won.</description>
        <endpointUrl>https://hooks.zapier.com/hooks/catch/3881934/cd1cu6/</endpointUrl>
        <fields>ARR__c</fields>
        <fields>CloseDate</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Owner_Email__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>jakub@productboard.com</integrationUser>
        <name>Notify CSMs</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Notify_CSMs_on_Slack</fullName>
        <apiVersion>44.0</apiVersion>
        <description>Notifies CSMs on Opp Closed Won by Sales</description>
        <endpointUrl>https://hooks.zapier.com/hooks/catch/3881934/cd1cu6/</endpointUrl>
        <fields>ARR__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Owner_Email__c</fields>
        <fields>StageName</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>jakub@productboard.com</integrationUser>
        <name>Notify CSMs on Slack</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Notify_Owner</fullName>
        <apiVersion>43.0</apiVersion>
        <endpointUrl>https://hooks.zapier.com/hooks/catch/3745656/l8fe2w/</endpointUrl>
        <fields>Account_Name__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>OwnerId</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>noah@productboard.com</integrationUser>
        <name>Notify Owner</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_0f8ff12abc754491b7812af58734369e</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/0f8ff12a-bc75-4491-b781-2af58734369e?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>R_0f8ff12abc754491b7812af58734369e</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_3a36a9cabd274bafbe696d07f3267a41</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/3a36a9ca-bd27-4baf-be69-6d07f3267a41?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lisa.larson@productboard.com</integrationUser>
        <name>R_3a36a9cabd274bafbe696d07f3267a41</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_3cd5e1ea68cd40358804005dc9aac337</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/3cd5e1ea-68cd-4035-8804-005dc9aac337?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>R_3cd5e1ea68cd40358804005dc9aac337</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_438955b421e54d268a682c12855e85df</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/438955b4-21e5-4d26-8a68-2c12855e85df?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lisa.larson@productboard.com</integrationUser>
        <name>R_438955b421e54d268a682c12855e85df</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_477675e422b94dd9b4ac51187a0da59c</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/477675e4-22b9-4dd9-b4ac-51187a0da59c?t=tbw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lisa.larson@productboard.com</integrationUser>
        <name>R_477675e422b94dd9b4ac51187a0da59c</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_4a0c54d17187453788eb17d7e2c8e9a0</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/4a0c54d1-7187-4537-88eb-17d7e2c8e9a0?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>R_4a0c54d17187453788eb17d7e2c8e9a0</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_4fb526e1cfed4ccba11656969bcbff1f</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/4fb526e1-cfed-4ccb-a116-56969bcbff1f?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>R_4fb526e1cfed4ccba11656969bcbff1f</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_661dbe85ef364e0ca0022bf6109a656c</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/661dbe85-ef36-4e0c-a002-2bf6109a656c?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>R_661dbe85ef364e0ca0022bf6109a656c</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_68c931a723d045328bcce01fd23e0073</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/68c931a7-23d0-4532-8bcc-e01fd23e0073?t=tbw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lisa.larson@productboard.com</integrationUser>
        <name>R_68c931a723d045328bcce01fd23e0073</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_6d5ad247c36146d9927590f9f6a332fa</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/6d5ad247-c361-46d9-9275-90f9f6a332fa?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lisa.larson@productboard.com</integrationUser>
        <name>R_6d5ad247c36146d9927590f9f6a332fa</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_705a80e010c045d4887417c0dd9d80aa</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/705a80e0-10c0-45d4-8874-17c0dd9d80aa?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>R_705a80e010c045d4887417c0dd9d80aa</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_8b4b5c3a228a401eacbe9dda2d3e7856</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/8b4b5c3a-228a-401e-acbe-9dda2d3e7856?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lisa.larson@productboard.com</integrationUser>
        <name>R_8b4b5c3a228a401eacbe9dda2d3e7856</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_e8ace45897d94d2e9fe0c5888e6e6b71</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/e8ace458-97d9-4d2e-9fe0-c5888e6e6b71?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lisa.larson@productboard.com</integrationUser>
        <name>R_e8ace45897d94d2e9fe0c5888e6e6b71</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_f6c13974c42f4563a41afa37227b040e</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/f6c13974-c42f-4563-a41a-fa37227b040e?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>R_f6c13974c42f4563a41afa37227b040e</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_f70fbaa3a07f45bba253730614e36712</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/f70fbaa3-a07f-45bb-a253-730614e36712?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>R_f70fbaa3a07f45bba253730614e36712</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>R_ffb0ddef976d4739b13c29291b20c0c4</fullName>
        <apiVersion>49.0</apiVersion>
        <endpointUrl>https://server.gorattle.com/api/v1/sfdc/om/ffb0ddef-976d-4739-b13c-29291b20c0c4?t=aw</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>R_ffb0ddef976d4739b13c29291b20c0c4</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Send_Opportunity_Info</fullName>
        <apiVersion>53.0</apiVersion>
        <description>POC for space contract provisioning automation</description>
        <endpointUrl>https://pb-sf.mocklab.io/opportunity/receiver</endpointUrl>
        <fields>ARR__c</fields>
        <fields>Amendment_Type__c</fields>
        <fields>Amount</fields>
        <fields>ContractId</fields>
        <fields>Contract_Type__c</fields>
        <fields>Id</fields>
        <fields>Opportunity_Type_Name__c</fields>
        <fields>Prior_ARR__c</fields>
        <fields>Product_Plan__c</fields>
        <fields>Product_Type__c</fields>
        <fields>Project_Name__c</fields>
        <fields>Project_PB_ID__c</fields>
        <fields>Project_Subscription_End_Date__c</fields>
        <fields>Project_Subscription_Start_Date__c</fields>
        <fields>RevOps_Contract_Effective_start_date__c</fields>
        <fields>RevOps_Contract_Signed_Date__c</fields>
        <fields>RevOps_Contract_URL__c</fields>
        <fields>Subspaces__c</fields>
        <fields>TotalOpportunityQuantity</fields>
        <fields>Won_ARR__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>vojtech.kudrnac@productboard.com</integrationUser>
        <name>Send Opportunity Info</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>TrayOnOpportunityOwnerIdChan_2qBUU</fullName>
        <apiVersion>37.0</apiVersion>
        <endpointUrl>https://d242f52d-945b-4d98-9684-557c07feb333-4ebf415037d4425.trayapp.io</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>TrayOnOpportunityOwnerIdChan_2qBUU</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>TrayOnOpportunityOwnerIdChan_Z19nMeH</fullName>
        <apiVersion>37.0</apiVersion>
        <endpointUrl>https://d242f52d-945b-4d98-9684-557c07feb333-2f7bfe2ce41de7d.trayapp.io</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>lika@productboard.com</integrationUser>
        <name>TrayOnOpportunityOwnerIdChan_Z19nMeH</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Watchdog_Zapier_Update_Max_Stage</fullName>
        <apiVersion>44.0</apiVersion>
        <description>Zapier Webhook send.</description>
        <endpointUrl>https://hooks.zapier.com/hooks/catch/3881934/ev60gq/</endpointUrl>
        <fields>Id</fields>
        <fields>Max_Stage_Achieved__c</fields>
        <fields>Name</fields>
        <fields>StageName</fields>
        <fields>Stage_Num_Snapshot__c</fields>
        <fields>Stage_Numeric__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>jakub@productboard.com</integrationUser>
        <name>Watchdog Zapier Update - Max Stage</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Zapier_Outbound_Message</fullName>
        <apiVersion>44.0</apiVersion>
        <description>Sends Outbound message to Zapier</description>
        <endpointUrl>https://hooks.zapier.com/hooks/catch/3881934/ev4r25/</endpointUrl>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Opportunity_Date_Assigned__c</fields>
        <fields>OwnerId</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>jakub@productboard.com</integrationUser>
        <name>Zapier Outbound Message</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>%5BW%28O1%29%5D Opp Routed To Sales</fullName>
        <actions>
            <name>Change_from</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_to_Base_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Notify_Owner</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>AND(
OR(
NOT(ISNULL( Opportunity_Date_Assigned__c )),
 Owner.Profile.Name = &quot;SDR&quot;
),
 Max_Stage_Achieved__c &lt;0.1,
 not(ISPICKVAL( StageName ,&quot;Closed Won&quot;)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O10%29%5D Record IS NEW</fullName>
        <actions>
            <name>Update_Max_Stage_Achieved</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_O10</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Initially Enter Max Stage Achieved</description>
        <formula>ISNew() &amp;&amp;  Stage_Numeric__c &gt; 0</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O11%29%5D Move to 0%2E2 after filling in DM Date</fullName>
        <actions>
            <name>Update_Stage_to_0_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_10</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Moves opp stage to 0.2 after filling in DM Date from stages 0.0 or 0.1.</description>
        <formula>and(
NOT(ISBLANK( DM_Date__c)),
Stage_Numeric__c &lt;= 0.1)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O12%29%5D Stage %23 Snapshot</fullName>
        <actions>
            <name>Stage_Burn_in_Snapshot</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_11</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(
isblank(Stage_Num_Snapshot__c ),
ischanged( StageName )
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O13%29%5D Burn In Stage Change 0%2E1</fullName>
        <actions>
            <name>Burn_in_Date_Transferred_to_0_1_or_above</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_12</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Burns in Date when stage was changed to 0.1 or above for the first time.</description>
        <formula>AND(
Not(IsClosed), 

 ISBLANK(Date_Transferred_to_0_1__c ),
 ISCHANGED( Stage_Num_Snapshot__c ),
 Stage_Num_Snapshot__c &gt;= 0.1,
 Max_Stage_Achieved__c &lt;= Stage_Num_Snapshot__c,
 PRIORVALUE(Max_Stage_Achieved__c) &lt;0.1,

 NOT(RecordType.DeveloperName = &quot;Self Service&quot;), 
 $User.Username &lt;&gt; &quot;technical-pb@enehano.cz&quot;
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O14%29%5D Burn In Stage Change 0%2E2</fullName>
        <actions>
            <name>Burn_in_Date_Transferred_to_0_2_or_above</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_13</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Burns in Date when stage was changed to 0.2 or above for the first time.</description>
        <formula>AND( 
NOT(IsClosed), 

ISBLANK( Date_Transferred_to_0_2__c ), 
ISCHANGED( Stage_Num_Snapshot__c ), 
Stage_Num_Snapshot__c &gt;= 0.2, 
Max_Stage_Achieved__c &lt;= Stage_Num_Snapshot__c, 
PRIORVALUE(Max_Stage_Achieved__c) &lt;0.2, 

NOT(RecordType.DeveloperName = &quot;Self Service&quot;), 
$User.Username &lt;&gt; &quot;technical-pb@enehano.cz&quot; 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O15%29%5D Burn In Stage Change 1%2E0</fullName>
        <actions>
            <name>Burn_in_Date_Transferred_to_1_0_or_above</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_14</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Burns in Date when stage was changed to 1.0 or above for the first time.</description>
        <formula>AND( 
NOT(IsClosed), 

ISBLANK(  Date_Transferred_to_1_0__c ), 
ISCHANGED( Stage_Num_Snapshot__c ), 
Stage_Num_Snapshot__c &gt;= 1, 
Max_Stage_Achieved__c &lt;= Stage_Num_Snapshot__c, 
PRIORVALUE(Max_Stage_Achieved__c) &lt;1, 

NOT(RecordType.DeveloperName = &quot;Self Service&quot;), 
$User.Username &lt;&gt; &quot;technical-pb@enehano.cz&quot; 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O16%29%5D Burn In Stage Change 2%2E0</fullName>
        <actions>
            <name>Burn_in_Date_Transferred_to_2_0_or_above</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_15</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Burns in Date when stage was changed to 2.0 or above for the first time.</description>
        <formula>AND(Not(IsClosed), 

ISBLANK(  Date_Transferred_to_2_0__c ), 
ISCHANGED( Stage_Num_Snapshot__c ), 
Stage_Num_Snapshot__c &gt;= 2, 
Max_Stage_Achieved__c &lt;= Stage_Num_Snapshot__c, 
PRIORVALUE(Max_Stage_Achieved__c) &lt;2, 

NOT(RecordType.DeveloperName = &quot;Self Service&quot;), 
$User.Username &lt;&gt; &quot;technical-pb@enehano.cz&quot; 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O17%29%5D Burn In Stage Change 3%2E0</fullName>
        <actions>
            <name>Burn_in_Date_Transferred_to_3_0_or_above</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_16</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Burns in Date when stage was changed to 3.0 or above for the first time.</description>
        <formula>AND( 
NOT(IsClosed), 

ISBLANK(  Date_Transferred_to_3_0__c ), 
ISCHANGED( Stage_Num_Snapshot__c ), 
Stage_Num_Snapshot__c &gt;= 3, 
Max_Stage_Achieved__c &lt;= Stage_Num_Snapshot__c, 
PRIORVALUE(Max_Stage_Achieved__c) &lt;3, 

NOT(RecordType.DeveloperName = &quot;Self Service&quot;), 
$User.Username &lt;&gt; &quot;technical-pb@enehano.cz&quot; 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O18%29%5D Burn In Stage Change 4%2E0</fullName>
        <actions>
            <name>Burn_in_Date_Transferred_to_4_0_or_above</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_17</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Burns in Date when stage was changed to 4.0 or above for the first time.</description>
        <formula>AND( 
NOT(IsClosed), 

ISBLANK(  Date_Transferred_to_4_0__c ), 
ISCHANGED( Stage_Num_Snapshot__c ), 
Stage_Num_Snapshot__c &gt;= 4, 
Max_Stage_Achieved__c &lt;= Stage_Num_Snapshot__c, 
PRIORVALUE(Max_Stage_Achieved__c) &lt;4, 

NOT(RecordType.DeveloperName = &quot;Self Service&quot;), 
$User.Username &lt;&gt; &quot;technical-pb@enehano.cz&quot; 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O19%29%5D Burn In Stage Change 5%2E0</fullName>
        <actions>
            <name>Burn_in_Date_Transferred_to_5_0_or_above</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_18</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Burns in Date when stage was changed to 5.0 or above for the first time.</description>
        <formula>AND( 
NOT(IsClosed), 
ISBLANK( Date_Transferred_to_5_0__c ), 
ISCHANGED( Stage_Num_Snapshot__c ), 
Stage_Num_Snapshot__c &gt;= 5, 
Max_Stage_Achieved__c &lt;= Stage_Num_Snapshot__c, 
PRIORVALUE(Max_Stage_Achieved__c) &lt;5, 

NOT(RecordType.DeveloperName = &quot;Self Service&quot;), 
$User.Username &lt;&gt; &quot;technical-pb@enehano.cz&quot; 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O20%29%5D Update Next Steps Last Updated Field</fullName>
        <actions>
            <name>UpdateNextStep</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_19</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Triggers when a rep updates the Next Step field and stamps Today()</description>
        <formula>ISCHANGED( NextStep )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O22%29%5D Fill Date Assigned after Changing Owner by Sales Person</fullName>
        <actions>
            <name>Update_Opp_Date_Assigned</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_21</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Fills in date assigned after changing Owner by Sales Person. Only applies when Owner was not from profile sales.</description>
        <formula>AND(
 ISCHANGED( OwnerId ),
 Owner.Profile.Name = &quot;Sales&quot;,
 ISBLANK(Opportunity_Date_Assigned__c)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O23%29%5D Burn in Date Self Service Subscribed</fullName>
        <actions>
            <name>Fill_in_Date_Self_Service_Subscribed</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_22</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Burns in the date when the Opportunity Self Service Subscribed, i.e. was moved to Closed Won by Tehcnical User.</description>
        <formula>AND( 
ISPICKVAL(StageName, &quot;Closed Won&quot;),
ISBLANK(  Date_Self_Service_Subscribed__c ), 

$User.Username  = &quot;technical-pb@enehano.cz&quot; 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O24%29%5D Watchdog - Date Assigned Check</fullName>
        <actions>
            <name>Workflow_Log_23</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Zapier_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <description>Checks whether all assigned opps have correctly inputed Date Assigned</description>
        <formula>AND(
OR(Owner.Profile.Name = &quot;Sales&quot;, $User.Username = &quot;jakub@productboard.com&quot;),
IsBlank(Opportunity_Date_Assigned__c)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O26%29%5D Fill in Opportunity Date Assigned</fullName>
        <actions>
            <name>Fill_in_Opportunity_Date_Assigned</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_25</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>If and opportunity is created by Sales Person and has missing Date Assigned, fill in Date Assigned.</description>
        <formula>AND(
 isblank(Opportunity_Date_Assigned__c),
  or(Owner.Profile.Name =&quot;Solution Sales&quot;,
     Owner.Profile.Name =&quot;Smart Touch Sales&quot;),
 Owner.IsActive
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O27%29%5D Closed Won Owned by Sales</fullName>
        <actions>
            <name>Workflow_Log_26</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Notify_CSMs</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <description>Notifies CSMs that a deal with ARR&gt;6k was closed by Sales Team</description>
        <formula>and(
  ISPICKVAL( StageName ,&quot;Closed Won&quot;),
  ARR__c &gt;6000,
 or(Owner.Profile.Name = &quot;Sales&quot;,  Owner.Alias =&quot;kubo&quot;)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O28%29%5D Opp Lost</fullName>
        <actions>
            <name>Closed_Lost_Opp</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>When Opportunity is lost, not by Technical User.</description>
        <formula>and( 
ISPICKVAL( StageName , &quot;Closed Lost&quot;),
Amount &gt; 5000,
$User.Alias &lt;&gt; &quot;techuser&quot;, Not( IsPickVal($User.Team__c ,&quot;System/Automation&quot;)),
Not( IsPickVal($User.Team__c ,&quot;Operations&quot;)), $User.Alias &lt;&gt; &quot;Lika&quot; )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O28%29%5D Stage 3 Over %2450K</fullName>
        <actions>
            <name>Alert_CS_of_Stage_3_50K_Deal</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.ARR__c</field>
            <operation>greaterOrEqual</operation>
            <value>50000</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>3.0 Prove,4.0 Proposal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>notEqual</operation>
            <value>Renewal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O29%29%5D Burn in Date Sales Closed</fullName>
        <actions>
            <name>Update_Date_Sales_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Workflow_Log_W_O29</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( 
ISPICKVAL(StageName, &quot;Closed Won&quot;),
ISBLANK(Date_Sales_Closed__c), 
or($User.ProfileId = &quot;00ef4000001EevO&quot;,  $User.Alias =&quot;kubo&quot;)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O4%29%5D Duplicate Created Date</fullName>
        <actions>
            <name>FU_Duplicate_Created_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Trial_Start_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Duplicates &quot;Created Date&quot; for NEW Opportunities, if Created_Date_TEMP is empty.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O6%29%5D Mark Sales Touched</fullName>
        <actions>
            <name>Update_Sales_Touched</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_5</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Marks an opportunity as Sales Touched.</description>
        <formula>AND( 
ISCHANGED(StageName) ,
OR(
ISPICKVAL(StageName,&quot;0.1 Contacted&quot;),
ISPICKVAL(StageName,&quot;0.2 Replied&quot;),
ISPICKVAL(StageName,&quot;1.0 Initial Scoping&quot;),
ISPICKVAL(StageName,&quot;2.0 Consult&quot;),
ISPICKVAL(StageName,&quot;3.0 Prove&quot;),
ISPICKVAL(StageName,&quot;4.0 Proposal&quot;),
ISPICKVAL(StageName,&quot;5.0 Closing&quot;)
),
$User.Email &lt;&gt; &quot;technical-pb@enehano.cz&quot;
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O7%29%5D Opp Won</fullName>
        <actions>
            <name>Deal_Won_Notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Close_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When Opportunity is won, not by Technical User.</description>
        <formula>AND( 
 IsWon, 
 $User.Alias &lt;&gt; &quot;techuser&quot;, 
 NOT( IsPickVal($User.Team__c ,&quot;System/Automation&quot;)),
 Not( IsPickVal($User.Team__c ,&quot;RevOps&quot;)), 
 $User.Alias &lt;&gt; &quot;Lauren&quot;,  
 ISCHANGED( StageName ),

OR(
AND( 
 Account.Suggested_Segmentation_employees__c &lt;&gt; &quot;ESB&quot;,
 Amount &gt;= 1000 ),
 Account.Suggested_Segmentation_employees__c = &quot;ESB&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O8%29%5D Burn in Date Pipeline Added</fullName>
        <actions>
            <name>Burn_in_Date_Pipeline_Added</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_7</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Burns in the date when the opp was transferred to a pipeline.</description>
        <formula>AND( 
NOT(RecordType.DeveloperName = &quot;Self Service&quot;),
ISBLANK(Date_Pipeline_Added__c ), 
Max_Stage_Achieved__c &gt;= 1,
DATEVALUE (CreatedDate) &gt;= DATE (2018,09,01),
$User.Email &lt;&gt; &quot;technical-pb@enehano.cz&quot; 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28O9%29%5D Burn in Closed Won%2FLost Date when Sales Closed</fullName>
        <actions>
            <name>Update_Close_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_8</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Stage changes to Closed Won/Lost and has empty Closed Won/Lost Date</description>
        <formula>AND(
OR(
ISPICKVAL(StageName, &quot;Closed Lost&quot;)
),
ISBLANK( Date_Closed_won__c), 
$User.Email &lt;&gt; &quot;technical-pb@enehano.cz&quot; 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%3AO29%5D New Trial Alert to SDRs</fullName>
        <actions>
            <name>New_Trial_Alert_to_SDRs</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Owner_Team__c</field>
            <operation>contains</operation>
            <value>SDR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>0.0 New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>equals</operation>
            <value>Technical User</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%3AO31%5D New Trial Alert to SMB AEs</fullName>
        <actions>
            <name>New_Trial_Alert_SMB_AEs</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Owner_Team__c</field>
            <operation>contains</operation>
            <value>SMB-AE</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>0.0 New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>equals</operation>
            <value>Technical User</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%3AO32%5D Email Alert to Partner Contact</fullName>
        <actions>
            <name>Email_Alert_to_Primary_Partner_Contact</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Partner__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Services_Partner_SA_Checkbox__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%3AO33%5D Email Alert to SA Assigned</fullName>
        <actions>
            <name>Email_Alert_to_SA</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Solution_Architect__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BWO%5D035%3A Update Amount if Blank</fullName>
        <actions>
            <name>Update_Amount_to36k</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>2.0 Consult</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>lessThan</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Account_Employee_Segment__c</field>
            <operation>contains</operation>
            <value>MidMarket,Enterprise</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contract Churn</fullName>
        <actions>
            <name>Contract_Churn_Reasons_to_Slack</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <description>Contract churn response</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opp Won - New Contract</fullName>
        <active>false</active>
        <description>Opportunity is moved to stage Closed Won by non-technical user and requires a new contract provisioning (only New Business, Upsell and POC)</description>
        <formula>and( IsWon, TEXT(Type) = &quot;New Business&quot; || TEXT(Type) = &quot;Expansion - Upsell&quot; || TEXT(Type) = &quot;POC&quot;, $User.Alias &lt;&gt; &quot;techuser&quot;, Not( IsPickVal($User.Team__c ,&quot;System/Automation&quot;)),
Not( IsPickVal($User.Team__c ,&quot;Operations&quot;)), $User.Alias &lt;&gt; &quot;Lika&quot;, ISCHANGED( StageName ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Rattle_Opportunity Escalation 10 Days Past the Due date</fullName>
        <active>false</active>
        <formula>AND(AND(NOT OR(ISPICKVAL(StageName, &quot;Closed Won&quot;), ISPICKVAL(StageName, &quot;Closed Lost&quot;)), NOT ISPICKVAL(Type, &quot;Renewal&quot;)), OR(LOWER(Owner_Team__c) = &quot;mm-ae&quot;, LOWER(Owner_Team__c) = &quot;en-ae&quot;, LOWER(Owner_Team__c) = &quot;smb-ae&quot;, LOWER(Owner_Team__c) = &quot;esb-ae&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>R_68c931a723d045328bcce01fd23e0073</name>
                <type>OutboundMessage</type>
            </actions>
            <offsetFromField>Opportunity.CloseDate</offsetFromField>
            <timeLength>10</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Rattle_Opportunity%3A Close Date In the Past %283 days%29</fullName>
        <active>false</active>
        <formula>AND(AND(NOT OR(ISPICKVAL(StageName, &quot;Closed Won&quot;), ISPICKVAL(StageName, &quot;Closed Lost&quot;)), NOT ISPICKVAL(Type, &quot;Renewal&quot;), Max_Stage_Achieved__c &gt;= 1), OR(LOWER(Owner_Team__c) = &quot;mm-ae&quot;, LOWER(Owner_Team__c) = &quot;en-ae&quot;, LOWER(Owner_Team__c) = &quot;smb-ae&quot;, LOWER(Owner_Team__c) = &quot;esb-ae&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>R_477675e422b94dd9b4ac51187a0da59c</name>
                <type>OutboundMessage</type>
            </actions>
            <offsetFromField>Opportunity.CloseDate</offsetFromField>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Rattle_Opportunity%3A Close Date Pushed to Next Month</fullName>
        <actions>
            <name>R_3cd5e1ea68cd40358804005dc9aac337</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>AND(AND(ISCHANGED(CloseDate), IF(YEAR((PRIORVALUE(CloseDate)))= YEAR((CloseDate))           ,MCEILING(MONTH(PRIORVALUE(CloseDate)))+1 = MCEILING( MONTH((CloseDate)))           ,13 - MCEILING(MONTH(PRIORVALUE(CloseDate)))= MCEILING(MONTH((CloseDate)))), CASESAFEID(RecordTypeId) = &quot;012f4000000OaBNAA0&quot;, IsClosed = false), OR(LOWER(Owner_Team__c) = &quot;mm-ae&quot;, LOWER(Owner_Team__c) = &quot;en-ae&quot;, LOWER(Owner_Team__c) = &quot;smb-ae&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Rattle_Win Notification Standard</fullName>
        <actions>
            <name>R_8b4b5c3a228a401eacbe9dda2d3e7856</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>AND(IsWon = true, ISCHANGED(StageName), NOT CONTAINS(LOWER(Account_Name__c), &quot;productboard&quot;), ISBLANK(Date_Self_Service_Subscribed__c), CASESAFEID(OwnerId) &lt;&gt; &quot;005f4000000qlhvAAA&quot;, CASESAFEID(RecordTypeId) &lt;&gt; &quot;012f4000000YovJAAS&quot;, Max_Stage_Achieved__c &gt;= 1)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Renewal Won</fullName>
        <actions>
            <name>Renewal_Opportunity_Won</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Renewal_Provisioning</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 3) AND 2</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amendment_Type__c</field>
            <operation>equals</operation>
            <value>Expansion/Upsell w/Renewal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set SDR Role On Opp</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.SDR__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Start Date Update</fullName>
        <actions>
            <name>Update_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>TrayOnOpportunityOwnerIdChan_2qBUU</fullName>
        <actions>
            <name>TrayOnOpportunityOwnerIdChan_2qBUU</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>!ISNEW() &amp;&amp; ISCHANGED(OwnerId)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TrayOnOpportunityOwnerIdChan_Z19nMeH</fullName>
        <actions>
            <name>TrayOnOpportunityOwnerIdChan_Z19nMeH</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>!ISNEW() &amp;&amp; ISCHANGED(OwnerId)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Trial End Date</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Trial_End_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Opportunity.Trial_End_Date__c</offsetFromField>
            <timeLength>60</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Update close date for closed lost opportunities</fullName>
        <actions>
            <name>Close_Lost_Close_Date_to_Today_s_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Automatically updates the close date of an opportunity to today&apos;s date when the opportunity is moved to closed lost.</description>
        <formula>AND(
    OR(
        ISCHANGED(StageName),
        ISNEW()
    ),
    TEXT(StageName) = &quot;Closed Lost&quot;
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
