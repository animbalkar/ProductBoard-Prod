<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CS_New_Resource_Request</fullName>
        <ccEmails>t-services-requests-aaaagkybgvcoj44xucoxiaggwu@productboard.slack.com</ccEmails>
        <description>CS: New Resource Request</description>
        <protected>false</protected>
        <recipients>
            <recipient>ami.heller@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>layla.selick@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/CS_Resource_Request_New_CASE</template>
    </alerts>
    <alerts>
        <fullName>CS_Security_Review_Request</fullName>
        <ccEmails>mario@productboard.com, security-reviews@productboard.com</ccEmails>
        <description>CS: Security Review Request</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/Security_Resource_Request_New_CASE</template>
    </alerts>
    <alerts>
        <fullName>CS_to_Case_Owner_New_Case_Assigned</fullName>
        <description>CS: to Case Owner: New Case Assigned</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>layla.selick@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Case_Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/CS_Resource_Assignment_Notification</template>
    </alerts>
    <alerts>
        <fullName>Case_has_been_closed</fullName>
        <description>Case has been closed</description>
        <protected>false</protected>
        <recipients>
            <field>Case_Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/SalesOps_Request_Caseclosed</template>
    </alerts>
    <alerts>
        <fullName>Deprovision_Churned_Customer_Slack_Alert</fullName>
        <ccEmails>t-customer-deprovisio-aaaahvh2zv4akfxz5jzmqkbqkm@productboard.slack.com</ccEmails>
        <description>Deprovision Churned Customer Slack Alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Deprovision_Churned_Customer</template>
    </alerts>
    <alerts>
        <fullName>New_Case_Comment_Alert</fullName>
        <description>New Case Comment Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Case_Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/New_Case_Comment</template>
    </alerts>
    <alerts>
        <fullName>SA_New_Resource_Request</fullName>
        <description>SA: New Resource Request</description>
        <protected>false</protected>
        <recipients>
            <recipient>lauren@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/AM_Resource_Request_New_CASE</template>
    </alerts>
    <alerts>
        <fullName>SE_New_Resource_Request</fullName>
        <description>SE: New Resource Request NOAM</description>
        <protected>false</protected>
        <recipients>
            <recipient>sarah.gillespie@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/SE_Resource_Request_New_CASE</template>
    </alerts>
    <alerts>
        <fullName>SE_New_Resource_RequestEMEA</fullName>
        <description>SE: New Resource Request EMEA</description>
        <protected>false</protected>
        <recipients>
            <recipient>ivana.obstova@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/SE_Resource_Request_New_CASE</template>
    </alerts>
    <alerts>
        <fullName>SOPs_Case_Request_Project_Reviewed_Notify_Requestor</fullName>
        <description>SOPs Case Request: Project Reviewed - Notify Requestor</description>
        <protected>false</protected>
        <recipients>
            <field>Case_Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SOPs_Case_Request_Project_Reviewed</template>
    </alerts>
    <alerts>
        <fullName>SalesOps_Case_Priority_Alert</fullName>
        <ccEmails>team-sops-aaaagqyqwcc2pejpbpzm6ityga@productboard.slack.com</ccEmails>
        <description>SalesOps Case Priority Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>shreyasi.gadgil@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/Sales_Ops_Request_Priority_Alert</template>
    </alerts>
    <alerts>
        <fullName>SalesOps_Request_Email_Alert</fullName>
        <ccEmails>a0m1r3t1w5n6x8j8@productboard.slack.com</ccEmails>
        <description>SalesOps Request Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>shreyasi.gadgil@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/SalesOps_Request_New_CASE</template>
    </alerts>
    <alerts>
        <fullName>Sales_Ops_Case_Priority_Alert</fullName>
        <description>Sales Ops Case Priority Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>lauren@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/Sales_Ops_Request_Priority_Alert</template>
    </alerts>
    <alerts>
        <fullName>Support_New_Case_Space_Provisioning</fullName>
        <ccEmails>d9m7d2m6c8w6e4z1@productboard.slack.com</ccEmails>
        <description>Support: New Case - Space Provisioning</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/SUPPORT_New_Case_Notification</template>
    </alerts>
    <alerts>
        <fullName>Value_Request_New_Resource_Request</fullName>
        <description>Value Request: New Resource Request</description>
        <protected>false</protected>
        <recipients>
            <recipient>carolyn.thompson@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/SE_Resource_Request_New_CASE</template>
    </alerts>
    <fieldUpdates>
        <fullName>Churn_Signal_Update</fullName>
        <description>Updates Churn Signal field in case of Churn tag in Zendesk Support Ticket Tag</description>
        <field>Churn_Signal__c</field>
        <formula>Zendesk_Support_Ticket_Tags__c</formula>
        <name>Churn Signal Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Implementation_Type_Project</fullName>
        <field>Implementation_Type__c</field>
        <literalValue>Project</literalValue>
        <name>Implementation Type - Project</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Owner_to_Sales_Ops</fullName>
        <field>OwnerId</field>
        <lookupValue>sfdc.admin@productboard.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update Case Owner to Sales Ops</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Case Created - Notify Support</fullName>
        <actions>
            <name>Support_New_Case_Space_Provisioning</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>notEqual</operation>
            <value>Customer Deactivation</value>
        </criteriaItems>
        <description>Notify Support when Case is created</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case Created - Notify Support - Deprovision Churned Customer</fullName>
        <actions>
            <name>Deprovision_Churned_Customer_Slack_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Customer Deactivation</value>
        </criteriaItems>
        <description>Notify Support when Case is created for deprovisioning a customer</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Close Case Email Alert</fullName>
        <actions>
            <name>Case_has_been_closed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesOps</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Implementation Type %3D Project %3E Sent to PB %2B Notification</fullName>
        <actions>
            <name>SOPs_Case_Request_Project_Reviewed_Notify_Requestor</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Implementation_Type_Project</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When Implementation Type is set to Project, a Zap is used to send the request to SOPs&apos; Productboard, this workflow sets the Status to Sent to Productboard and notifies the case requestor of the project.</description>
        <formula>AND(
RecordType.DeveloperName = &quot;SalesOps&quot;,
ISPICKVAL(Implementation_Type__c, &quot;Project&quot;) ,
ISCHANGED(Implementation_Type__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Case Comment Notify</fullName>
        <actions>
            <name>New_Case_Comment_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Most_Recent_Case_Comment__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify SalesOps of New Case</fullName>
        <actions>
            <name>Update_Case_Owner_to_Sales_Ops</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesOps</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>On Hold,Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Urgent%2FHight Priority Case Alert</fullName>
        <actions>
            <name>SalesOps_Case_Priority_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Urgent</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesOps</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedDate</field>
            <operation>greaterThan</operation>
            <value>9/20/2020 3:00 AM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Alert sent for urgent or high priority cases submitted</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>W%28Case01%29 - Update Case Churn field</fullName>
        <actions>
            <name>Churn_Signal_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Zendesk_Support_Ticket_Tags__c</field>
            <operation>contains</operation>
            <value>churn</value>
        </criteriaItems>
        <description>Update Churn Field for cases to send Churn signals to Vitally</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
