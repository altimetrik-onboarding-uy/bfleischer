global with sharing class WorkItemsLast30DaysController {

	@AuraEnabled
	global static Work_Item__C[] getWorkItemsByStatusInLast30Days(String status){
		Date today = Date.today();
		return [SELECT Id, Title__c, Name, Difficulty__c, Item_Type__c, Status__c
				FROM Work_Item__c 
				WHERE Status__c = :status AND Start_Date__c > LAST_MONTH];
	}
}