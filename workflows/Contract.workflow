<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_When_New_Contract_is_Auto_Created</fullName>
        <description>Alert When New Contract is Auto Created</description>
        <protected>false</protected>
        <recipients>
            <recipient>karel.urban@productboard.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Notifications/Contract_Created</template>
    </alerts>
    <rules>
        <fullName>Contract Created Notification</fullName>
        <actions>
            <name>Alert_When_New_Contract_is_Auto_Created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.Alias</field>
            <operation>notEqual</operation>
            <value>dmaza</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
