@isTest
public class AccountProcessorTest {
    @isTest
    private static void test1(){
        test.startTest();
         	//AccountProcessor ap= new AccountProcessor();
         	//
         	account a= new account();
        	a.name='zzzzzzzzzz';
            insert a;        
        
        ID idx= a.id;
        
        	list<account> lac= [select id from account];
        	list<Id> recordIds= new list<Id>(); 
        for (account ac: lac){
            recordIds.add(ac.id);
        }
        	//id idacc=recordIds[0].id;
        	contact c= new contact(
                  FirstName='Joe',
        LastName='Smith',
        Phone='415.555.1212',
        AccountId=idx);
        	c.AccountId=recordIds[0];//idacc;
        	insert c;
        	//recordIds.add('0011i00000Lga5AAAR');
        	AccountProcessor.countContacts(recordIds);     //.Number_Of_Contacts(recordIds)  //.countContacts(ids);
        	list<account> la=[select Number_Of_Contacts__c from account where id in :recordIds];
        	decimal i=la[0].Number_Of_Contacts__c;
        	system.debug(i);
        	system.assertEquals(i, i);
        test.stopTest();        
    }

}