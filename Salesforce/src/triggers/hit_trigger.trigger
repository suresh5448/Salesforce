trigger hit_trigger on Account (Before Insert) {
  AccountTriggerHandler at=new AccountTriggerHandler(Trigger.New);
  
  
}