public with sharing class MyControllerExt {
     List<Account> aa;
     public MyControllerExt() {
     this.aa=[select id, name,phone from Account];
     }
    public String getName() {
        return 'MyControllerExt ';
    }
    public List<Account> getAccount() {
      return aa;
       }

}