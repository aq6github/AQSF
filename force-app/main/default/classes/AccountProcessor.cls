public class AccountProcessor {
    @future
    public static void countContacts(List<Id> recordIds){
        List<Account> la= [select id,Number_Of_Contacts__c from Account where id in :recordIds];
            for(account ac : la){
                integer n=[select count() from contact where AccountId=:ac.id];
                ac.Number_Of_Contacts__c=[select count() from contact where AccountId=:ac.id];
            }     
       update la;
    }
}