public class Picklist {
	private Schema.sObjectField sObjectFieldApiName;
	private Schema.DescribeFieldResult picklistFieldResult;
	private Map<Object, List<String>> dependentPicklistValues;
	private Set<String> allValues;
	private Map<String, String> allLabels;
	private Set<Object> controlledFieldValuesFiltered;

	private final String base64map = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

	public Picklist(Schema.sObjectField sObjectFieldApiName) {
		this.sObjectFieldApiName = sObjectFieldApiName;
		this.picklistFieldResult = sObjectFieldApiName.getDescribe();
	}

	public Set<String> getValues() {
		if (allValues == null) {
			Set<String> values = new Set<String>();
			for (Schema.PicklistEntry picklistEntry : picklistFieldResult.getPicklistValues()) {
				values.add(picklistEntry.getValue());
			}
			allValues = values;
		}
		return allValues;
	}

	public String getLabel(String value) {
		if (allLabels == null) {
			Map<String, String> labels = new Map<String, String>();
			for (Schema.PicklistEntry picklistEntry : picklistFieldResult.getPicklistValues()) {
				labels.put(picklistEntry.getValue(), picklistEntry.getLabel());
			}
			allLabels = labels;
		}
		return allLabels.get(value);
	}

	public Map<Object, List<String>> getDependendPickListValues() {
		if (dependentPicklistValues == null) {
			dependentPicklistValues = getDependentPicklistValues(sObjectFieldApiName);
		}
		return dependentPicklistValues;
	}

/*
	public Set<Object> getControllingFieldValues() {
		if (dependentPicklistValues == null) {
			dependentPicklistValues = getDependentPicklistValues(sObjectFieldApiName);
		}
		return dependentPicklistValues.keySet();
	}
*/
/*
	public Set<Object> getSuitableControllingFieldValues(String dependentFieldValue) {
		if (dependentPicklistValues == null) {
			dependentPicklistValues = getDependentPicklistValues(sObjectFieldApiName);
		}
		Set<Object> filteredValues = new Set<Object>();
		for (Object controlledFieldValue : dependentPicklistValues.keySet()) {
			if (dependentPicklistValues.get(controlledFieldValue).contains(dependentFieldValue)) {
				filteredValues.add(controlledFieldValue);
			}
		}
		return filteredValues;
	}
*/

	private Map<Object, List<String>> getDependentPicklistValues(Schema.sObjectField dependentField) {
		Map<Object, List<String>> dependentPicklistValues = new Map<Object, List<String>>();
		Schema.sObjectField controllerField = picklistFieldResult.getController();
		if (controllerField == null) {
			return null;
		}
		/*Schema.DescribeFieldResult controllerFieldResult = controllerField.getDescribe();
		List<Schema.PicklistEntry> controllerValues = (controllerFieldResult.getType() == Schema.DisplayType.Boolean
			? null
			: controllerFieldResult.getPicklistValues());

		for (Schema.PicklistEntry entry : picklistFieldResult.getPicklistValues()) {
			if (entry.isActive()) {
				filterSuitableValues(entry, controllerValues, dependentPicklistValues);
			}
		}
		*/
		return dependentPicklistValues;
		
	}
/*
	private void filterSuitableValues(
		Schema.PicklistEntry dependentValue,
		List<Schema.PicklistEntry> controllerValues,
		Map<Object, List<String>> dependentPicklistValues
	) {
		List<String> base64chars = String.valueOf(
				((Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(dependentValue))).get('validFor')
			)
			.split('');
		for (Integer i = 0; i < (controllerValues != null ? controllerValues.size() : 2); i++) {
			Object controllerValue = (controllerValues == null
				? (Object) (i == 1)
				: (Object) (controllerValues[i].isActive() ? controllerValues[i].getValue() : null));
			Integer bitIndex = i / 6;
			Integer bitShift = 5 - Math.mod(i, 6);
			if (controllerValue == null || (base64map.indexOf(base64chars[bitIndex]) & (1 << bitShift)) == 0) {
				continue;
			}
			if (!dependentPicklistValues.containsKey(controllerValue)) {
				dependentPicklistValues.put(controllerValue, new List<String>());
			}
			dependentPicklistValues.get(controllerValue).add(dependentValue.getValue());
		}
	}
*/
}