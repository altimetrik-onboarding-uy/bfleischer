@isTest
private class WorkItemsOverdueTest {

	// Dummy CRON expression: midnight on March 15.
	public static String CRON_EXP = '0 0 0 15 3 ? 2022';

	@isTest static void test_method_one() {
		
		// List<Work_Item__c> dummyWI = new List<Work_Item__c>();
		// Date estimatedEndDate = Date.newInstance(2010, 10, 10);
		// for(Integer i = 0; i < 40; i++){
		// 	Work_Item__c WI = new Work_Item__c(
		// 			Item_Type__c = ''+i,
		// 			Estimated_End_Date__c = estimatedEndDate
		// 		);
		// 	dummyWI.add(WI);
		// }
		// insert dummyWI;
        
        // // Get the IDs of the WI we just inserted
        // Map<Id, Work_Item__c> dummyWIMap = new Map<Id, Work_Item__c>(dummyWI);
        // List<Id> dummyWIIds = new List<Id>(dummyWIMap.keySet());
        // Test.startTest();
        // // Schedule the test job
        // String jobId = System.schedule('ScheduledApexTest',
        //     CRON_EXP, 
        //     new WorkItemsOverdueTest());         
        // // Verify the scheduled job has not run yet.
        // List<Task> lt = [SELECT Id 
        //     FROM Task 
        //     WHERE WhatId IN :dummyWIIds];
        // System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        // // Stopping the test will run the job synchronously
        // Test.stopTest();
        
        // // Now that the scheduled job has executed,
        // // check that our tasks were created
        // lt = [SELECT Id 
        //     FROM Task 
        //     WHERE WhatId IN :dummyWIIds];
        // System.assertEquals(dummyWIIds.size(), 
        //     lt.size(), 
        //     'Tasks were not created');

	}
	
}