public class NewAndExxistingController {
    public Account account{get; private set;}
   
    public NewAndExxistingController(){
        Id id=ApexPages.currentPage().getParameters().get('id');
        account=(id==null)?new Account():[SELECT Name, Phone, Industry FROM Account WHERE Id = :id];
    }
    
    public PageReference save(){
        try{
             upsert(account);
           }
        catch(DmlException de)
        { 
             ApexPages.addMessages(de);
             return null;
        }
        PageReference redirect=new ApexPages.StandardController(Account).view();
        return(redirect);
    }
    
}