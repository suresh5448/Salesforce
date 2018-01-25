public class CustomerOperationClass {

    public List<string> CustomerOperationClass { get; set; }
    static final Double regularCustomerDiscount = 0.1;
    static Double finalPrice = 0;
    public Static List<string> getProvideDiscount () {
       //The same previous example using For Loop
//initializing the custom object records list to store the Invoice Records
List<apex_invoice__c> PaidInvoiceNumberList = new List<apex_invoice__c>();

PaidInvoiceNumberList = [SELECT Id,Name, APEX_Status__c FROM APEX_Invoice__c  WHERE CreatedDate = today];//this is SOQL query which will fetch the invoice records which has been created today 

List<string> InvoiceNumberList = new List<string>();//List to store the Invoice Number of Paid invoices

for (Integer i = 0; i < paidinvoicenumberlist.size(); i++) { //this loop will iterate on the List PaidInvoiceNumberList and will process the each record. It will get the List Size and will iterate the loop for number of times that size. For example, list size is 10.
    if (PaidInvoiceNumberList[i].APEX_Status__c == 'Paid') {//Condition to check the current record in context values
        System.debug('Value of Current Record on which Loop is iterating is '+PaidInvoiceNumberList[i]);//current record on which loop is iterating
        InvoiceNumberList.add(PaidInvoiceNumberList[i].Name);//if Status value is paid then it will the invoice number into List of String
    }
}
return InvoiceNumberList;
    }
}