global with sharing class WorkItemsLast30DaysController {

	@AuraEnabled
	global static Work_Item__C[] getWorkItemsByStatus(String status){
		return [SELECT Id, Name, Difficulty__c, Item_Type__c FROM Work_Item__c WHERE Status__c = :status];
	}
}