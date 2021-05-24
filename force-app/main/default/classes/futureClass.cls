global class futureClass {

  @future
  public static void someFutureMethod(List<Id> recordIds) {
    List<Account> accounts = [Select Id, Name from Account Where Id IN :recordIds];
    // process account records to do awesome stuff
      for(account a : accounts ){
      	system.debug(a);
      }
  }
    
    @future
  	public static void someFutureMethod2() {
    List<Account> accounts = [Select Id, Name from Account ];
    // process account records to do awesome stuff
      for(account a : accounts ){
      	system.debug(a);
      }
  }
    
/*    
      // Call async from triggers, etc, where callouts are not permitted.
    @future(callout=true)
    public static void sendSMSAsync(String fromNbr, String toNbr, String m) {
        String results = sendSMS(fromNbr, toNbr, m);
        System.debug(results);
    }
    // Call from controllers, etc, for immediate processing
    public static String sendSMS(String fromNbr, String toNbr, String m) {
        // Calling 'send' will result in a callout
        String results = SmsMessage.send(fromNbr, toNbr, m);
        insert new SMS_Log__c(to__c=toNbr, from__c=fromNbr, msg__c=results);
        return results;
    }  
    */    
}