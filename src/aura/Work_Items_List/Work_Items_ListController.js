({
	doInit : function(component, event, helper) {
		var statusType = component.get('v.workItemsStatus');

		var action = component.get('c.getWorkItemsByStatusInLast30Days');
		action.setParam('status', statusType);

		action.setCallback(this, function(response){
			var state = response.getState();
			if(state == 'SUCCESS'){
				var items = response.getReturnValue();
				component.set('v.workItemsList', items);
			}else{
				// no else yet
				console.log('Failed')
			}
		});
		$A.enqueueAction(action);
	}
})