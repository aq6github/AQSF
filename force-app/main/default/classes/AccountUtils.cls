public class AccountUtils {

    public static list<Account> accountsByState(string bs){
        
        return [SELECT id,Name FROM Account WHERE BillingState = :bs ];
    }
    
}