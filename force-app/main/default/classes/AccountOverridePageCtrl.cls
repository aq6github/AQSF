public class AccountOverridePageCtrl {
    public String myAtribiute {get;set;}
    public Contact[] contacts {get;set;}
    private Account record;
    
    public AccountOverridePageCtrl(ApexPages.StandardController ctrl  ) {
        record = (Account) ctrl.getRecord();
        myAtribiute = 'test';
        contacts = getMyContacts();
    }
    
    public String getMyValue() {
        return 'my value from getter';
    }
    
    private List<Contact> getMyContacts() {
        return [SELECT Id, FirstName, LastName FROM Contact WHERE AccountId = :record.Id];
    }
    
    

}