trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    list<Task> tl= new list<Task>();
    for(Opportunity o: [SELECT AccountId,Id FROM Opportunity WHERE StageName = 'Closed Won']){
        Task t= new Task();
        t.WhatId = o.Id;
        t.Subject = 'Follow Up Test Task';
        tl.add(t);
    }
     insert tl;
}