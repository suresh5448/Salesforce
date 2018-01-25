public class AccountTriggerHandler{
public AccountTriggerHandler(List<Account> contextData){
for(Account acc : contextData){
   if(acc.AnnualRevenue < 100000){
      acc.addError('Amount should not be less than 100,000 $');
   }
  }
}

}