public class Account{

public Contact con{get;set;}
    public Account(){
        con = new Contact();
        con = [Select id,lastname from Contact limit 1];
    }

}