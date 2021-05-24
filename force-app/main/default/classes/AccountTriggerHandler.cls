public class AccountTriggerHandler {
    
    public static void CreateAccounts(list<Account> lac){
        list<Account> lacins= new list<Account> ();
        for(Account ac : lac){
            ac.ShippingState=ac.BillingState ;
            lacins.add(ac);                
        }
       // insert lacins;
    }

}