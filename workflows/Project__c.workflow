<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>ARR_Last_Updated_Date</fullName>
        <field>ARR_Last_Updated__c</field>
        <formula>now()</formula>
        <name>ARR Last Updated Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Prior_ARR_Update</fullName>
        <field>Prior_ARR__c</field>
        <formula>PRIORVALUE(  MRR__c  )* 12</formula>
        <name>Prior ARR Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Prior_Maker_Update</fullName>
        <field>Prior_Makers__c</field>
        <formula>PriorValue(Purchased_Makers__c )</formula>
        <name>Prior Maker Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Project_Prior_Biling_Cycle</fullName>
        <field>Prior_Billing_Cycle__c</field>
        <formula>Chartmogul_Billing_Cycle__c</formula>
        <name>Project-Prior Biling Cycle</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Project_Prior_Plan</fullName>
        <field>Prior_Plan__c</field>
        <formula>Chartmogul_Plan__c</formula>
        <name>Project-Prior Plan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Project_Prior_Status</fullName>
        <field>Status_Carbon_Copy__c</field>
        <formula>PriorValue(Current_Backend_Stage__c )</formula>
        <name>Project-Prior Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Inactive</fullName>
        <field>Active__c</field>
        <literalValue>0</literalValue>
        <name>Set Inactive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Current_Plan</fullName>
        <field>Current_Plan__c</field>
        <formula>Product_Name__r.Name</formula>
        <name>Update Current Plan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>W_P03_Project_Prior_Plan</fullName>
        <field>Initial_Plan__c</field>
        <formula>PriorValue( Chartmogul_Plan__c )</formula>
        <name>W(P03)-Project-Prior Plan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>W_P05_Project_Prior_Status</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;W(P05)Project-Prior Status&quot;</formula>
        <name>W(P05)Project-Prior Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_W_P01</fullName>
        <field>Workflow_Log__c</field>
        <formula>&quot;W(P01)-: Prior ARR/Makers Update&quot;</formula>
        <name>Workflow: W(P01)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>TrayOnProjectCreateUpdate_D4fwQ</fullName>
        <apiVersion>37.0</apiVersion>
        <endpointUrl>https://47759c60-ef21-44a1-8acf-af63870f0179-163227557f91b71.trayapp.io</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>lauren@productboard.com</integrationUser>
        <name>TrayOnProjectCreateUpdate_D4fwQ</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>TrayOnProjectCreateUpdate_D4fwQ</fullName>
        <actions>
            <name>TrayOnProjectCreateUpdate_D4fwQ</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>!ISBLANK(Id)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>W%28P01%29-Project-Prior ARR%2FMakers</fullName>
        <actions>
            <name>ARR_Last_Updated_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Prior_ARR_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Prior_Maker_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Workflow_W_P01</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IsChanged(  MRR__c  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>W%28P03%29-Project-Prior Plan</fullName>
        <actions>
            <name>Project_Prior_Biling_Cycle</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Project_Prior_Plan</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Current_Plan</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>W_P03_Project_Prior_Plan</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IsChanged(  Product_Name__c ) &amp;&amp;
 PRIORVALUE( Product_Name__c ) &lt;&gt; &quot;&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>W%28P05%29-Project-Prior Status</fullName>
        <actions>
            <name>Project_Prior_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>W_P05_Project_Prior_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IsChanged( Current_Backend_Stage__c ) &amp;&amp;
(
 Chartmogul_MRR__c &gt; 0 ||
 Prior_ARR__c &gt; 0 ||
Current_Backend_Stage__c = &quot;Churned Customer&quot; ||
Current_Backend_Stage__c = &quot;Active Contract&quot;

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
