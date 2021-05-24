global class MyBatchableClass implements
            Database.Batchable<sObject>,
            Database.Stateful {  
    // Used to record the total number of Accounts processed
    global Integer numOfRecs = 0;
    global Integer numOfRecs1 = 0;
    global Integer numOfRecs2 = 0;
    global Integer numOfRecs3 = 0;
    global list<string> ls = new list<string> ();
    // Used to gather the records that will be passed to the interface method
    // This method will only be called once and will return either a
    // Database.QueryLocator object or an Iterable that contains the records
    // or objects passed to the job.            
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT AccountNumber,AccountSource,Active__c,AnnualRevenue,BillingAddress,BillingCity,BillingCountry,BillingGeocodeAccuracy,BillingLatitude,BillingLongitude,BillingPostalCode,BillingState,BillingStreet,CleanStatus,CreatedById,CreatedDate,CustomerPriority__c,DandbCompanyId,Description,DunsNumber,Fax,Id,Industry,IsDeleted,Jigsaw,JigsawCompanyId,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,MasterRecordId,Match_Billing_Address__c,NaicsCode,NaicsDesc,Name,NumberOfEmployees,NumberofLocations__c,OwnerId,Ownership,ParentId,Phone,PhotoUrl,Rating,ShippingAddress,ShippingCity,ShippingCountry,ShippingGeocodeAccuracy,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingPostalCode__c,ShippingState,ShippingStreet,Sic,SicDesc,Site,SLAExpirationDate__c,SLASerialNumber__c,SLA__c,SystemModstamp,TickerSymbol,Tradestyle,Type,UpsellOpportunity__c,Website,YearStarted FROM Account');                
    }
    // This is where the actual processing occurs as data is chunked into
    // batches and the default batch size is 200.
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        list<account> lac = new list<account>();

        for (Account acc : scope) {
            // Do some processing here
            if (acc.BillingState==acc.ShippingState && acc.BillingState=='CA'){
                acc.AccountSource='AQ Test';
                lac.add(acc);
                numOfRecs1 = numOfRecs1 + 1;
            }
            //address ad =new address();
           // ad.city='USA' ;
          // system.Address(acc.BillingCity)
          system.debug(acc.AccountNumber+' '+acc.name+' '+acc.BillingAddress.getCity());
            ls.add(acc.AccountNumber+' '+acc.name+' '+acc.BillingAddress.getCity()+'\n');
            if (acc.BillingAddress.getCity() == 'USA' //|| acc.BillingAddress.getCity()=='France'  
               ){
                acc.BillingCountry=acc.BillingCity;
                acc.BillingCity=null;
                lac.add(acc);
                numOfRecs2 = numOfRecs2 + 1;
            }
            if (acc.AccountNumber== null){
                acc.AccountNumber='accnum'+numOfRecs;      
                numOfRecs3++;
                lac.add(acc);
            }
            
            // and then increment the counter variable
            numOfRecs = numOfRecs + 1;
        }     
        update lac;
    }
    // Used to execute a==
    // is called only once and after all the batches have finished.
    global void finish(Database.BatchableContext bc) {
        EmailManager.sendMail('andykuc@gmail.com',
                              numOfRecs + ' Accounts were processed!',
                              'Meet me at the bar for drinks to celebrate 0='+numOfRecs+'; 1='+numOfRecs1+'; 2='+numOfRecs2+'; 3='+numOfRecs3+';xxxxx \n '+ls);            
    }
}