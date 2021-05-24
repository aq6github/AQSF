@isTest
public class AccountTriggerTest {
    
    @isTest public static void insAcc(){
        List<Account> lac = new List<Account>();
        for(Integer i =0;i<200;i++){
            Account ac=new Account(name='Test Account '+i);
            ac.BillingState='CA';
            lac.add(ac);
        }
        Test.startTest();
        insert lac;
        Integer ile=[SELECT count() FROM Account WHERE  ShippingState='CA' and BillingState='CA'];
        System.assertEquals(200, ile);
        Test.stopTest();
        
    }

}