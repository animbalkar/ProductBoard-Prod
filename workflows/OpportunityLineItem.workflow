<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_NRR</fullName>
        <field>NRR__c</field>
        <literalValue>1</literalValue>
        <name>Update NRR</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Update NRR</fullName>
        <actions>
            <name>Update_NRR</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Product2.Is_NRR__c = TRUE</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
