global class CustomerProessingBatch implements Database.Batchable<sobject>, Schedulable{
//Add here your email address
global String [] email = new String[] {'suresh404012@gmail.com'};
  
//Start Method
global Database.Querylocator start (Database.BatchableContext BC) {
    //This is the Query which will determine the scope of Records and fetching the same
    return Database.getQueryLocator('Select id, Name, APEX_Customer_Status__c, APEX_Customer_Decscription__c From APEX_Customer__c');
}

//Execute method
global void execute (Database.BatchableContext BC, List<sobject> scope) {
    List<apex_customer__c> customerList = new List<apex_customer__c>();
    List<apex_customer__c> updtaedCustomerList = new List<apex_customer__c>();
    for (sObject objScope: scope) {  
	    //type casting from generic sOject to APEX_Customer__c
        APEX_Customer__c newObjScope = (APEX_Customer__c)objScope ;
        if (newObjScope.APEX_Customer_Status__c == 'Pending') {
            newObjScope.APEX_Customer_Decscription__c = 'Updated Via Batch Job';
			newObjScope.APEX_Customer_Status__c = 'Paid';
			//updtaedCustomerList.add(newObjScope);
		}
        
        //newObjScope.APEX_Customer_Status__c = 'Processed';
	    //Add records to the List
        updtaedCustomerList.add(newObjScope);
        System.debug('Testing::: '+updtaedCustomerList.size());
    } 	
    
    //Check if List is empty or not
    if (updtaedCustomerList != null && updtaedCustomerList.size()>0) {
		//Update the Records
        Database.update(updtaedCustomerList); System.debug('List Size '+updtaedCustomerList.size());
    }
}

//Finish Method
global void finish(Database.BatchableContext BC){
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   
    //get the job Id
    AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors, a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById, a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];
    System.debug('$$$ Jobid is'+BC.getJobId());
    
    //below code will send an email to User about the status
    mail.setToAddresses(email);
    
    //Add here your email address
    mail.setReplyTo('suresh404012@gmail.com');
    mail.setSenderDisplayName('Apex Batch Processing Module');
    mail.setSubject('Batch Processing '+a.Status);
    mail.setPlainTextBody('The Batch Apex job processed => '+a.TotalJobItems+'\nbatches with => '+a.NumberOfErrors+'\nfailures '+' Job Item processed are'+a.JobItemsProcessed);
  
    Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});
}

//Scheduler Method to scedule the class
global void execute(SchedulableContext sc){
    CustomerProessingBatch conInstance = new CustomerProessingBatch();
    database.executebatch(conInstance,100);
}
}