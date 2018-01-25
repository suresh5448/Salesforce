public class Practice {
    Integer companyName;
        Integer companyName2;
    public void Practice(){
        Sum();
    } 
    public void Sum(){
        String [] arrayOfProducts = new List<String>();
        //Adding elements in Array
        arrayOfProducts.add('HCL');
        arrayOfProducts.add('H2SO4');
        arrayOfProducts.add('NACL');
        arrayOfProducts.add('H2O');
        arrayOfProducts.add('123124');
        arrayOfProducts.add('U296');
        
        for (Integer i = 0; i<arrayOfProducts.size(); i++) {
            //This loop will print all the elements in array
            system.debug('Values In Array: '+arrayOfProducts[i]);   
        }
    }
}