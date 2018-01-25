public class apex_con_exten{
  List<Account> acts;
    public apex_con_exten(ApexPages.StandardController controller){acts=[SELECT Name,Phone From Account];}
      public List<Account> getacts()
      {
          return acts;
      }
}