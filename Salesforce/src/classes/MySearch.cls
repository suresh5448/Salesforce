public class MySearch {
    string searchText;
    List<Lead> result;
    public string getsearchText(){
        return searchText;
    }
    public void setsearchText(string s){
        searchText=s;
    }
    public List<Lead> getResults() {
        return result;
    }
    public PageReference doSearch(){
        result=(List<Lead>)[FIND :searchText RETURNING Lead(Name, Email, Phone)][0];
        return null;
    }
}