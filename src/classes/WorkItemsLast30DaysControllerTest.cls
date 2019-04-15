@isTest
private class WorkItemsLast30DaysControllerTest {
	
	@isTest static void test_workItemsLast30Days() {
		List<Work_Item__c> dummmyItems = new List<Work_Item__c>();
		Date startDate = Date.newInstance(2018, 12, 12);
		for(Integer i = 0; i < 10; i++){
			dummmyItems.add(new Work_Item__c(
				Item_Type__c = 'Idea',
				Status__c = 'Done',
				Start_Date__c = startDate
			));
		}
		insert dummmyItems;

		List<Work_Item__c> result = WorkItemsLast30DaysController.getWorkItemsByStatusInLast30Days('Done');
		System.assertEquals(10, result.size());
	}
	
	@isTest static void test_workItemsLast30DaysByContact() {
		Contact con = new Contact(LastName = 'Fleischer', Email = 'bfleischer@altimetrik.com');
		insert con;
		Date startDate = Date.newInstance(2018, 12, 12);
		List<Work_Item__C> dummmyItems = new List<Work_Item__c>();
		for(Integer i = 0; i < 10; i++){
			dummmyItems.add(new Work_Item__c(
				Item_Type__c = 'Idea',
				Status__c = 'Done',
				Contact__c = con.Id,
				Start_Date__c = startDate
			));
		}
		insert dummmyItems;
		List<Work_Item__c> result = WorkItemsLast30DaysController.getWorkItemsByContactByStatusInLast30Days('Done', con.Id);
		System.assertEquals(10, result.size());
	}
}