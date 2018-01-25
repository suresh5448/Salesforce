trigger testtrig on Account (before insert) {
    for(Account a :trigger.new){
      if(a.industry=='Education'){
         a.description='Education';
       }
    }
}