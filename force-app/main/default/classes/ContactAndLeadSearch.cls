public class ContactAndLeadSearch {
    
    public static List<List< SObject>> searchContactsAndLeads(string str){
        return [find :str IN ALL FIELDS RETURNING  contact(FirstName,LastName),lead(FirstName,LastName)];
    }

}