public class ControllerExtension {
    private final Account acct;
    public ControllerExtension(ApexPages.StandardController ctrlr){
        this.acct = (Account)ctrlr.getRecord();
    }
    public String getGreeting(){
        return 'Hello '+acct.Name+' you identification number is '+acct.id;
    }
}