public class myControllerExtension {
    private final Account acct;
    public myControllerExtension(ApexPages.StandardController controller) {
       this.acct=(Account)controller.getRecord();
    }
    public String getGreeting(){
     return 'Hello'+acct.name+'('+acct.id+')';
    }
    
}