<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_CMS_when_Acct_Owner_Changes</fullName>
        <description>Alert CMS/Support when Acct Owner Changes</description>
        <protected>false</protected>
        <recipients>
            <field>Customer_Support_Advisor__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Success_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/New_Account_Owner_Notification</template>
    </alerts>
    <alerts>
        <fullName>Alert_CMS_when_they_re_added_to_an_account</fullName>
        <description>Alert CMS when they&apos;re added to an account</description>
        <protected>false</protected>
        <recipients>
            <recipient>john@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Success_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/CSM_New_Account_Notification</template>
    </alerts>
    <alerts>
        <fullName>Alert_EM_when_they_re_added_to_an_account</fullName>
        <description>Alert EM when they&apos;re added to an account</description>
        <protected>false</protected>
        <recipients>
            <field>Engagement_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/EM_New_Account_Notification</template>
    </alerts>
    <alerts>
        <fullName>Alert_Owner_when_they_re_added_to_an_account</fullName>
        <description>Alert Owner when they&apos;re added to an account</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>lika@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/New_Account_Owner_Notification</template>
    </alerts>
    <alerts>
        <fullName>Alert_PEC_when_they_re_added_to_an_account</fullName>
        <description>Alert PEC when they&apos;re added to an account</description>
        <protected>false</protected>
        <recipients>
            <field>Product_Excellence_Consultant__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/PEC_New_Account_Notification</template>
    </alerts>
    <alerts>
        <fullName>Alert_PSAs_of_ARR_drop_below_25k</fullName>
        <ccEmails>michel@productboard.com</ccEmails>
        <description>Alert PSAs of ARR drop below $25k</description>
        <protected>false</protected>
        <recipients>
            <recipient>aneta.ziegenfuss@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dorota.ziakova@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Customer_Support_Advisor__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/ARR_drop_below_25</template>
    </alerts>
    <alerts>
        <fullName>Alert_PSAs_of_ARR_drop_below_50k</fullName>
        <ccEmails>michel@productboard.com</ccEmails>
        <description>Alert PSAs of ARR drop below $50k</description>
        <protected>false</protected>
        <recipients>
            <recipient>aneta.ziegenfuss@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dorota.ziakova@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Customer_Support_Advisor__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/ARR_drop_below_50</template>
    </alerts>
    <alerts>
        <fullName>Alert_PSAs_of_new_account_assignment</fullName>
        <ccEmails>michel@productboard.com</ccEmails>
        <description>Alert PSAs of new Account Assignment</description>
        <protected>false</protected>
        <recipients>
            <recipient>aneta.ziegenfuss@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dorota.ziakova@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Customer_Support_Advisor__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/New_Account_Assignment_for_Premium_Support_Notification</template>
    </alerts>
    <alerts>
        <fullName>Alert_SA_when_they_re_added_to_an_account</fullName>
        <description>Alert SA when they&apos;re added to an account</description>
        <protected>false</protected>
        <recipients>
            <field>Solution_Architect__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/SA_New_Account_Notification</template>
    </alerts>
    <alerts>
        <fullName>New_CSM_Alert_for_PSAs</fullName>
        <description>New CSM Alert for PSAs</description>
        <protected>false</protected>
        <recipients>
            <field>Customer_Support_Advisor__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/New_CSM_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Assigned_True</fullName>
        <description>Update Assigned Checkbox to be True</description>
        <field>Account_Assigned_to_AE__c</field>
        <literalValue>1</literalValue>
        <name>Assigned True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Correct_Assigned_Territory_Field</fullName>
        <description>Check Correct Assigned Territory field for churned AM owned customers</description>
        <field>Correct_Assigned_Territory__c</field>
        <literalValue>1</literalValue>
        <name>Check Correct Assigned Territory Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Previous_PRIORVALUE_BillingCity</fullName>
        <field>CB_City__c</field>
        <formula>PRIORVALUE( BillingCity )</formula>
        <name>Previous - PRIORVALUE(BillingCity)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Previous_PRIORVALUE_BillingCountry</fullName>
        <field>CB_Country__c</field>
        <formula>PRIORVALUE( BillingCountry )</formula>
        <name>Previous - PRIORVALUE(BillingCountry)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Previous_PRIORVALUE_BillingState</fullName>
        <field>CB_State_Province__c</field>
        <formula>PRIORVALUE( BillingState )</formula>
        <name>Previous - PRIORVALUE(BillingState)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Previous_Street_PreviousBilling_Street</fullName>
        <field>CB_Street_Address__c</field>
        <formula>PRIORVALUE(BillingStreet)</formula>
        <name>Previous - PRIORVALUE(BillingStreet)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Prievous_PRIORVALUE_BillingPostalCode</fullName>
        <field>CB_Zip_Postal_Code__c</field>
        <formula>PRIORVALUE(BillingPostalCode)</formula>
        <name>Prievous - PRIORVALUE(BillingPostalCode)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_Renewal_Manager</fullName>
        <description>Remove Renewal Manager from Account in case of expansion beyond $20k ARR</description>
        <field>Renewal_Manager__c</field>
        <name>Remove Renewal Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Country_clearbit_into_Billing_Co</fullName>
        <field>BillingCountry</field>
        <formula>Country__c</formula>
        <name>Stamp Country (clearbit) into Billing Co</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Account_Page_Layou</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Prospect</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Move to Prospect Account Page Layou</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Contact_Apex_Trigger_Field</fullName>
        <field>Contact_Apex_Trigger_Field__c</field>
        <formula>&quot;Manual Enrichment Trigger Contact&quot;+ &quot; &quot; + text(now())</formula>
        <name>Update Contact Apex Trigger Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Customer_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Customer</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Customer Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Customer_Status_to_Customer</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>Update Customer Status to Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_Enriched</fullName>
        <field>Manual_Enrich_Date__c</field>
        <formula>today()</formula>
        <name>Update Manual Date Enriched</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Manually_Enriched_By</fullName>
        <field>Manually_Enriched_By__c</field>
        <lookupValue>sfdc.admin@productboard.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update Manually Enriched By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_RM_on_customer_account</fullName>
        <description>Update RM on customer accounts</description>
        <field>Renewal_Manager__c</field>
        <lookupValue>kevin.horkan@productboard.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update RM on customer account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_RM_to</fullName>
        <description>Update RM non EMEA APAC</description>
        <field>Renewal_Manager__c</field>
        <lookupValue>elizabeth.keiter@productboard.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update RM non EMEA APAC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Type_To_Blank</fullName>
        <field>Type</field>
        <name>Update Type To Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Workflow_Log</fullName>
        <description>Update Workflow Log with &quot;Churned AM Owned Customer Re-Routed&quot;</description>
        <field>Workflow_Log__c</field>
        <formula>&quot;Correct Assigned Territory after AM Owned Customer Churns&quot;</formula>
        <name>Update Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_1</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(A1)] - Country Copy from Clearbit&quot;</formula>
        <name>Workflow Log (A1)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_2</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(A2)] - Check Assigned checkbox if Owned by Sales&quot;</formula>
        <name>Workflow Log (A2)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_3</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(A3)] - Fill in Enriched By and Enriched Date&quot;</formula>
        <name>Workflow Log (A3)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Log_4</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;Workflow [W(A4)] &quot;+ &quot; &quot; + text(now())</formula>
        <name>Workflow Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>%5BW%28A1%29%5D Country Copy from Clearbit %28interim hack%29</fullName>
        <actions>
            <name>Stamp_Country_clearbit_into_Billing_Co</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.BillingCountry</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Country__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Clearbit isn&apos;t auto looking up new accounts. This is a hack to use the lead-account mapping in the interim.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28A2%29%5D Check Assigned if Owned by Sales</fullName>
        <actions>
            <name>Assigned_True</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>If account is owned by someone from sales team, &quot;assigned&quot; checkbox is ticked, so new leads will be automatically assigned to this account.</description>
        <formula>and(Owner.ProfileId = &quot;00ef4000001EevO&quot;,
 Account_Assigned_to_AE__c = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BW%28A3%29%5D Fill in Enriched By and Enriched Date</fullName>
        <actions>
            <name>Update_Date_Enriched</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_Log_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>and(
 $Profile.Name =&quot;Data Quality&quot;,
or(
 ISCHANGED( NumberOfEmployees ),
 ISCHANGED( Raised__c ) 
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign RM to NOAM %2B LATAM %2B Other Customers</fullName>
        <actions>
            <name>Update_RM_to</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 and 7 and 8 and 9</booleanFilter>
        <criteriaItems>
            <field>Account.Account_ARR__c</field>
            <operation>greaterOrEqual</operation>
            <value>10000</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Customer_Status__c</field>
            <operation>contains</operation>
            <value>customer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Renewal_Manager__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Region__c</field>
            <operation>equals</operation>
            <value>NOAM,LATAM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_ARR__c</field>
            <operation>greaterOrEqual</operation>
            <value>10000</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Projects_with_Contracts__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CSM_Team__c</field>
            <operation>notContain</operation>
            <value>ent</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CSM_Team__c</field>
            <operation>notContain</operation>
            <value>comm</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CSM_Team__c</field>
            <operation>notContain</operation>
            <value>other</value>
        </criteriaItems>
        <description>Assign RMs to NOAM, LATAM and Other customer accounts with 10-$30k ARR.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Billing Address Changed</fullName>
        <actions>
            <name>Previous_PRIORVALUE_BillingCity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Previous_PRIORVALUE_BillingCountry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Previous_PRIORVALUE_BillingState</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Previous_Street_PreviousBilling_Street</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Prievous_PRIORVALUE_BillingPostalCode</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When the address is changed by Clearbit, capture the previous value(s) in the Previous address fields</description>
        <formula>AND( ISCHANGED(BillingAddress) /*  ,BillingStreet  =  cbit__Clearbit__r.cbit__CompanyGeoStreetNumber__c  &amp; &quot; &quot; &amp; cbit__Clearbit__r.cbit__CompanyGeoStreetName__c &amp; &quot; &quot; &amp; cbit__Clearbit__r.cbit__CompanyGeoSubPremise__c ,  BillingCity  = cbit__Clearbit__r.cbit__CompanyGeoCity__c ,  BillingState = cbit__Clearbit__r.cbit__CompanyGeoState__c ,  BillingPostalCode =  cbit__Clearbit__r.cbit__CompanyGeoPostalCode__c ,  BillingCountry =  cbit__Clearbit__r.cbit__CompanyGeoCountry__c    */  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Correct Assigned Territory after AM Owned Customer Churns</fullName>
        <actions>
            <name>Check_Correct_Assigned_Territory_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Workflow_Log</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Account_Owner_Team__c</field>
            <operation>contains</operation>
            <value>AM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Customer_Status__c</field>
            <operation>contains</operation>
            <value>Churn</value>
        </criteriaItems>
        <description>When a customer owned by an AM churns, the account needs to be re-assigned to AEs. This workflow rule will check the Correct Assigned Territory box and route the Account via LeanData.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Remove Renewal Manager</fullName>
        <actions>
            <name>Remove_Renewal_Manager</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Account.Renewal_Manager__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_ARR__c</field>
            <operation>greaterThan</operation>
            <value>30000</value>
        </criteriaItems>
        <description>Remove Renewal Manager in case of expansion beyond $30k ARR</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Remove Renewal Manager for Monthly T5</fullName>
        <actions>
            <name>Remove_Renewal_Manager</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 OR 2) AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>Account.Renewal_Manager__c</field>
            <operation>equals</operation>
            <value>Julie Seymour</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Renewal_Manager__c</field>
            <operation>equals</operation>
            <value>Annie Kingston</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Billing_Cycles__c</field>
            <operation>contains</operation>
            <value>01sf4000002axwKAAQ</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_ARR__c</field>
            <operation>lessOrEqual</operation>
            <value>5000</value>
        </criteriaItems>
        <description>Remove Renewal Manager in case of Tier 5 Monthly billing</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>W%28A010%29 - Churn Account Layout Update</fullName>
        <actions>
            <name>Update_Account_Page_Layou</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Customer_Status__c</field>
            <operation>equals</operation>
            <value>5.0 Churn</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Customer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>W%28A03%29 - CSM Assigned%2Fchange</fullName>
        <actions>
            <name>Alert_CMS_when_they_re_added_to_an_account</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notify CSM when they&apos;re assigned to an account</description>
        <formula>IsChanged( Success_Manager__c) &amp;&amp; Not(Isblank( Success_Manager__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>W%28A04%29 - SA Assigned%2Fchange</fullName>
        <actions>
            <name>Alert_SA_when_they_re_added_to_an_account</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notify SA when they&apos;re assigned to an account</description>
        <formula>IsChanged(  Solution_Architect__c ) &amp;&amp; Not(Isblank( Solution_Architect__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>W%28A05%29 - PEC Assigned%2Fchange</fullName>
        <actions>
            <name>Alert_PEC_when_they_re_added_to_an_account</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notify PEC when they&apos;re assigned to an account</description>
        <formula>IsChanged(   Product_Excellence_Consultant__c  ) &amp;&amp; Not(Isblank( Product_Excellence_Consultant__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>W%28A06%29 - EM Assigned%2Fchange</fullName>
        <actions>
            <name>Alert_EM_when_they_re_added_to_an_account</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notify EM when they&apos;re assigned to an account</description>
        <formula>IsChanged(  Engagement_Manager__c ) &amp;&amp; Not(Isblank(  Engagement_Manager__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>W%28A07%29 - Update Account Type - Customer</fullName>
        <actions>
            <name>Update_Customer_Status_to_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Account_ARR__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Bad_Account__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>notEqual</operation>
            <value>Analyst,Integrator,Investor,Partner,Press</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>W%28A08%29 - Remove Account Type From customer</fullName>
        <actions>
            <name>Update_Type_To_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Account_ARR__c</field>
            <operation>lessOrEqual</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Bad_Account__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>notEqual</operation>
            <value>Analyst,Integrator,Investor,Partner,Press</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>W%28A09%29 - Customer Account Layout</fullName>
        <actions>
            <name>Update_Customer_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Customer_Status__c</field>
            <operation>equals</operation>
            <value>1.0 Customer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_ARR__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Customer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
