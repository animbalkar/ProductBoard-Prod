<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Activity_Type_To_CallOutboundAnswered</fullName>
        <field>Type</field>
        <literalValue>Call Outbound (Answered)</literalValue>
        <name>Activity Type To CallOutboundAnswered</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Activity_Type_To_CallOutboundNot</fullName>
        <field>Type</field>
        <literalValue>Call Outbound (Not Answered)</literalValue>
        <name>Activity Type To CallOutboundNot</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Activity_Type_To_Chorus</fullName>
        <field>Type</field>
        <literalValue>Chorus Recording</literalValue>
        <name>Activity Type To Chorus</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Activity_Type_To_Email_In</fullName>
        <field>Type</field>
        <literalValue>Email (In)</literalValue>
        <name>Activity Type To Email In</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Activity_Type_To_Email_Out</fullName>
        <field>Type</field>
        <literalValue>Email (Out)</literalValue>
        <name>Activity Type To Email Out</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Activity_Type_To_Intercom</fullName>
        <field>Type</field>
        <literalValue>Intercom Chat</literalValue>
        <name>Activity Type To Intercom</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Activity Type%3A CallOutboundAnswered</fullName>
        <actions>
            <name>Activity_Type_To_CallOutboundAnswered</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
            <value>Call Outbound (Answered)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>startsWith</operation>
            <value>[Call] [Outbound] [Answered]</value>
        </criteriaItems>
        <description>Corrects Activity Type For [Call] [Outbound] [Answered]</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Activity Type%3A CallOutboundNot</fullName>
        <actions>
            <name>Activity_Type_To_CallOutboundNot</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
            <value>Call Outbound (Not Answered)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>startsWith</operation>
            <value>[Call] [Outbound] [Not Answered]</value>
        </criteriaItems>
        <description>Corrects Activity Type For [Call] [Outbound] [Not Answered]</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Activity Type%3A Chorus</fullName>
        <actions>
            <name>Activity_Type_To_Chorus</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
            <value>Chorus Recording</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>startsWith</operation>
            <value>Chorus -</value>
        </criteriaItems>
        <description>Corrects Activity Type For Chorus</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Activity Type%3A Email In</fullName>
        <actions>
            <name>Activity_Type_To_Email_In</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
            <value>Email (In)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>startsWith</operation>
            <value>[Email In]</value>
        </criteriaItems>
        <description>Corrects Activity Type For Email In</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Activity Type%3A Email Out</fullName>
        <actions>
            <name>Activity_Type_To_Email_Out</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
            <value>Email (Out)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>startsWith</operation>
            <value>[Email Out]</value>
        </criteriaItems>
        <description>Corrects Activity Type For Outreach Email Out</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Activity Type%3A Intercom Chat</fullName>
        <actions>
            <name>Activity_Type_To_Intercom</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
            <value>Intercom Chat</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>startsWith</operation>
            <value>Intercom chat w</value>
        </criteriaItems>
        <description>Corrects Activity Type For Intercom Chats</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
