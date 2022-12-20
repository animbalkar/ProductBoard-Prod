@isTest
public class Picklist_Test {
	private static final Schema.sObjectField NON_DEPENDENT_PICKLIST = Opportunity.Type;
	private static final Schema.sObjectField DEPENDENT_PICKLIST = Opportunity.Loss_Reason__c;
	private static final Schema.sObjectField CONTROLLING_PICKLIST = Opportunity.StageName;
	private static final String DEPENDENT_VALUE = 'Sales declined';
	private static final Set<Object> CONTROLLING_VALUES = new Set<Object>{ 'Closed Lost' };
		/*,
		'No Decision / Non-Responsive',
		'No Budget / Lost Funding',
		'Pricing (Cost)',
		'Feature Gap',
		'Tool Consolidation',
		'Other',
		'Duplicate account/opportunity',
		'Sales declined',
		'DM Declined',
		'Does not meet ICP',
		'Self Service Subscribed',
		'Sales Decline after/during DM'
		*/
	

	/*
	static testMethod void testGetSuitableControllingFieldValues() {
		Picklist picklist = new Picklist(DEPENDENT_PICKLIST);
		Set<Object> controllingFieldValues = picklist.getSuitableControllingFieldValues(DEPENDENT_VALUE);

		System.assertEquals(CONTROLLING_VALUES, controllingFieldValues, 'Controlling fields are wrong');
	}
	*/

	static testMethod void testGetValues() {
		Picklist picklist = new Picklist(DEPENDENT_PICKLIST);
		Set<String> allValues = picklist.getValues();

		System.assertEquals(getDependentPicklistValues(), allValues, 'All labels are wrong');
	}

	static testMethod void testGetLabel() {
		Picklist picklist = new Picklist(DEPENDENT_PICKLIST);
		String label = picklist.getLabel(DEPENDENT_VALUE);

		System.assertEquals(getPicklistLabels().get(DEPENDENT_VALUE), label, 'Labels values are wrong');
	}

	/*
	static testMethod void testGetControllingFieldValues() {
		Picklist picklist = new Picklist(DEPENDENT_PICKLIST);
		Set<Object> values = picklist.getControllingFieldValues();

		System.assertEquals(getControllingPicklistValues(), values, 'Controlling values are wrong');
	}
	*/
/*
	static testMethod void testGetDependendPickListValues() {
		Picklist picklist = new Picklist(DEPENDENT_PICKLIST);
		Map<Object, List<String>> myMap = picklist.getDependendPickListValues();

		System.assertEquals(getControllingPicklistValues().size(), myMap.size(), 'Dependent picklist values are wrong');
	}
*/
	static testMethod void testGetDependendPickListValuesForNonDependentPicklist() {
		Picklist picklist = new Picklist(NON_DEPENDENT_PICKLIST);
		Map<Object, List<String>> myMap = picklist.getDependendPickListValues();

		System.assertEquals(null, myMap, 'Non Dependent picklist values are wrong');
	}

	
	private static Set<String> getDependentPicklistValues() {
		Set<String> values = new Set<String>();
		for (Schema.PicklistEntry picklistEntry : DEPENDENT_PICKLIST.getDescribe().getPicklistValues()) {
			values.add(picklistEntry.getValue());
		}
		return values;
	}
	

	private static Set<Object> getControllingPicklistValues() {
		Set<Object> values = new Set<Object>();
		for (Schema.PicklistEntry picklistEntry : CONTROLLING_PICKLIST.getDescribe().getPicklistValues()) {
			values.add(picklistEntry.getValue());
		}
		return values;
	}

	private static Map<String, String> getPicklistLabels() {
		Map<String, String> labels = new Map<String, String>();
		for (Schema.PicklistEntry picklistEntry : DEPENDENT_PICKLIST.getDescribe().getPicklistValues()) {
			labels.put(picklistEntry.getValue(), picklistEntry.getLabel());
		}
		return labels;
	}
}