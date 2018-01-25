public class Act{
    Account act=new Account(Name='Suresh',Phone='1234');
    public Account getact(){
      return act;
    } 
    public List<Account> getactlist(){
     List<Account> acts=[select Name,Phone from Account ];
      return acts;
    }
}