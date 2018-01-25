trigger trig_oper on Opportunity (Before Insert,Before Update) {
   for(Opportunity op : Trigger.New){
    if(op.Amount<5000){
       op.addError('Amount should be morethan 5000');
    }
 
   }

}