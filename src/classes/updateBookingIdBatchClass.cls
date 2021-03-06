global class updateBookingIdBatchClass implements Database.batchable<sObject>{

global String query = 'Select c.OwnerId, c.Id, c.Wing__c, c.Project__c,c.Flat_No__c, c.X4DigitFlatNo__c, c.Buildings_Name__c From Case c';
    
global Database.QueryLocator start(Database.BatchableContext info){
            return Database.getQueryLocator(query);
            }
    
global void execute(Database.BatchableContext info, List<sObject> scope){
    List<Case> caseList = new List<Case>();
    Map<String, id> SAPBookingIDAgentMap = new Map<string, id>();
    Map<String, String> BookingIdMap = new Map<String, String>();
    Map<String, id> BookindObjMap = new Map<String, id>();
    List<SAPBookingIDAgentMapping_del__c> mappingObjList = [Select Agent_Name__c, Booking_ID__c, Combination__c from SAPBookingIDAgentMapping_del__c]; 
    List<BookingId__c> bookindIdObjList = [Select Id, Name from BookingId__c];
    
    for(BookingId__c bookindIdRecs :bookindIdObjList ){
    BookindObjMap.put(bookindIdRecs.Name, bookindIdRecs.Id);
    }
    
    for (SAPBookingIDAgentMapping_del__c allRecs:mappingObjList){
        SAPBookingIDAgentMap.put(allRecs.Combination__c, allRecs.Agent_Name__c); 
        BookingIdMap.put(allRecs.Combination__c, allRecs.Booking_ID__c);   
    }
   for(sObject s : scope){
   Case c = (Case)s; 

            String CaseCombination = c.Project__c+c.Buildings_Name__c+c.Wing__c+c.X4DigitFlatNo__c;
            CaseCombination = CaseCombination.toUpperCase();      
            if(BookingIdMap.get(CaseCombination) != null){
                    c.BookingIdLookup__c = BookindObjMap.get(BookingIdMap.get(CaseCombination));
                    }
                caseList.add(c);
            
   }
    try{
        database.update(caseList, false); 
    }
    catch(Exception ex){
        System.Debug('Case Failed to Update'+ ex.getMessage());
    }
}

global void finish(Database.BatchableContext BC){
}
}