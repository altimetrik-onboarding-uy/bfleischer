@isTest
private class WorkItemsOverdueTest {

	@isTest static void test_itemsOverDue() {
		List<Work_Item__c> workItems = new List<Work_Item__c>();
		Date estimatedEndDate = Date.newInstance(2010, 10, 10);
		for(Integer i = 0; i < 10; i++){
			workItems.add(new Work_Item__c(
				Item_Type__c = 'Idea',
				Estimated_End_Date__c = estimatedEndDate
			));
		}
		insert workItems;

		WorkItemsOverdue workItemsOverdueClass = new WorkItemsOverdue();
		Integer quantityOfItemsOverdue = workItemsOverdueClass.getItemsOverdue();

		System.assertEquals(10, quantityOfItemsOverdue);

	}
	
	@isTest static void test_plainEmailBody(){
		WorkItemsOverdue workItemsOverdueClass = new WorkItemsOverdue();
		String plainBody = workItemsOverdueClass.getPlainBody(10);

		System.assertEquals('The quantity of Work Items overdue is 10', plainBody);
	}

	@isTest static void test_htmlEmailBody(){

		WorkItemsOverdue workItemsOverdueClass = new WorkItemsOverdue();
		String plainBody = workItemsOverdueClass.getHtmlBody(10);

		System.assertEquals('<body><p>Dear Organization Administrator,</p>'
						+'<br/><p>The quantity of Work Items overdue is: 10.</p>'
						+'<br/><p>Kind regards,</p><p>System Administrator</p>', plainBody);
	}
	@isTest static void test_EmailJob(){
		String sch = '0 00 01 * * ?';
		test.startTest();
		String jobId = System.schedule('ScheduledApexTest', sch, new WorkItemsOverdue());
		System.assert(jobId != null);
		test.stopTest();
	}

}