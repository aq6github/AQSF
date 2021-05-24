public class AccountHandler {
   

    public static Account  insertNewAccount(String value){
        try{
        Account acc= new Account();
            acc.Name=value;
            insert acc;
 			return acc;
            
            }
        catch(DmlException ex){
            return null;
        } 
            
            /*     List<Account> addAccounts= new List<Account>();
       Integer n=1;
        while(n<=value)
            {
                Account acc=new Account();
                acc.Name='Acme Inc '+n;
                acc.AccountNumber='A000'+n;
           		n++;
                System.debug('====='+n+'========'+acc);
                addAccounts.add(acc);
        }
       	System.debug('====='+addAccounts);
        insert addAccounts;
*/
    }

}