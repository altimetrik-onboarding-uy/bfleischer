({
	findAndSetWorkItems : function(component, event) {
		var statusType = component.get('v.workItemsStatus');
		var contact = component.get('v.contactRecordId');
		
		var action;
		if(contact !== undefined && contact.length >= 0){
			action = component.get('c.getWorkItemsByContactByStatusInLast30Days');
			action.setParam('contact', contact);
		}else{
			action = component.get('c.getWorkItemsByStatusInLast30Days');
		}
		action.setParam('status', statusType);

		action.setCallback(this, function(response){
			var state = response.getState();
			if(state == 'SUCCESS'){
				var items = response.getReturnValue();
				component.set('v.workItemsList', items);
			}else{
				console.log('Failed')
			}
		});
		$A.enqueueAction(action);
	}
})