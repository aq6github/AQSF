public class ContactSearch {
    
    public static LIST<Contact> searchForContacts(String n,String e){
        LIst<Contact> lc=[select id,name from Contact where lastname=:n and MailingPostalCode=:e];   
        return lc;   
    }
}