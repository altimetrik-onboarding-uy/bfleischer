global class WorkItemsOverdue implements Schedulable {

	global void execute(SchedulableContext sc) {
		// How many work items are overdue, only the number for now!
		Integer quantity = this.getItemsOverdue();

		Messaging.SingleEmailMessage mailToSend = new Messaging.SingleEmailMessage();

		mailToSend.setPlainTextBody(this.getPlainBody(quantity));
		mailToSend.setHtmlBody(this.getHtmlBody(quantity));
		mailToSend.setSubject('Items overdue ' + Date.Today());

		String[] toAddresses = new String[] {'bfleischer@altimetrik.com'};
		mailToSend.setToAddresses(toAddresses);

		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mailToSend });
	}

	private String getPlainBody(Integer itemsOverdue){
		return 'The quantity of Work Items overdue is ' + itemsOverdue;
	}

	private String getHtmlBody(Integer itemsOverdue){
		String header = '<body><p>Dear Organization Administrator,</p>';
		String body = '<br/><p>The quantity of Work Items overdue is: ' + itemsOverdue + '.</p>';
		String footer = '<br/><p>Kind regards,</p><p>System Administrator</p>';
		return header + body + footer;
	}

	private Integer getItemsOverdue(){
		List<AggregateResult> itemsOverdue = [SELECT COUNT(Id) quantity FROM Work_Item__c 
												WHERE Estimated_End_Date__c < TODAY];
		Integer quantity = (Integer)itemsOverdue[0].get('quantity');
		return quantity;
	}
}