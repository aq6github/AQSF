trigger HelloWorldTrigger on Account (before insert,after insert,before delete) {
    
    if(trigger.isInsert){
        
        
       if(trigger.isbefore){}

        //System.debug('Hello World!');
        }
        
        
        if (trigger.isafter){
            List<Account> la=trigger.new;
            list<id > lid= new List<id>();
        for(Account a: la){
            //a.description='insert by AQ';
            lid.add(a.id);                       
         }
         System.debug(lid);   
         //System.debug(newMap); 
        // system.debug(size); 
    } 
    else if (trigger.isDelete){
        for (account a: trigger.old){
            system.debug(a);
        }
       // system.debug(size);
    }
    
}