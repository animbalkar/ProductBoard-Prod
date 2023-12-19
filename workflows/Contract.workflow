<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Contract Created Notification</fullName>
        <active>true</active>
        <criteriaItems>
            <field>User.Alias</field>
            <operation>notEqual</operation>
            <value>dmaza</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
