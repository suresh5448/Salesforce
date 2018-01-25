@isTest
public class Testtrig {
 public static testmethod void m1(){
    Account a=new Account();
    List<Account> acts =new List<Account>();
    for(Integer i=0;i<200;i++){
     a=new Account(Name='Account Name'+i,Industry='Education');
      acts.add(a);
    } 
    insert acts;
    List<Account> inserted_acts=[SELECT description from Account where ID IN:acts];
     for(Account a2 :inserted_acts){
     System.AssertEquals(a2.description,'Education Industry');
     }
   }
}