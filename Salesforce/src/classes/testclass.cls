@isTest
public class testclass
{
    static testmethod void test_method()
    {
        List<Account> aaa=new List<Account>();
        for(integer i=0;i<10;i++)
        {
        Account a=new Account(Name='TestCase'+i,AnnualRevenue=120000);
        aaa.add(a);
        }
    
        Test.StartTest();
        insert aaa;
        Test.StopTest();
        
        List<Account> acts=[SELECT AnnualRevenue FROM account WHERE ID IN:aaa];
        for(Account ac:acts){
        System.assertEquals(120000,ac.AnnualRevenue);
        }
    }
    static testmethod void test_method2()
    {
        List<Account> aaa=new List<Account>();
        for(integer i=0;i<10;i++)
        {
        Account a=new Account(Name='TestCase'+i,AnnualRevenue=10000);
        aaa.add(a);
        }
    
        Test.StartTest();
        insert aaa;
        Test.StopTest();
        
        List<Account> acts=[SELECT AnnualRevenue FROM account WHERE ID IN:aaa];
        for(Account ac:acts){
        System.assertEquals(10000,ac.AnnualRevenue);
        }
    }
}