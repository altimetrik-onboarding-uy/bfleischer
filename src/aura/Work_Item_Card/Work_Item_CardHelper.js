({
	handleEditWorkItem : function(component, event) {
		var target = event.currentTarget;
		var id = target.getAttribute("data-id");
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId": id
        });
        editRecordEvent.fire();
	}
})