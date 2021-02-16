/*****************
Purpose: To count the number of Valid Passwords according to the given policy
	- The passwords along with policy are stored in a static resource named 'passwordData'
	- Each string is in format :- n1-n2 alphabet: password (eg - 1-3 a: abcde)
	- The password must contain alphabet at least n1 time and at most n2 times.
******************/

public class ValidPasswordCount {
    
    // This method reads the data from static resource
    // calls checkValidity method to return total valid passwords
    
    public static Integer countValidPasswords(){
        StaticResource sr = [select id,body from StaticResource Where Name = 'passwordData'];
        String contents = sr.body.toString(); 		//convert data from static resource to string
        return checkValidity(contents.split('\n'));    
    }
    
    
    // This method checks the password validity and counts the valid password
    
    public static Integer checkValidity(List<String> allPasswords){
        
        Integer validPasswordCount = 0;  //stores count of valid passwords
        
        for(String passwordWithPolicy : allPasswords ) {
            List<String> policyPassword = passwordWithPolicy.split(' ');
            
            //get the lower and upper limit as integers
            List<String> bounds  = policyPassword.get(0).split('-');
            Integer min_req_count =  Integer.valueof(bounds.get(0));
            Integer max_req_count =  Integer.valueof(bounds.get(1));
            
            //get the alphabet and the password in different strings
            String alphabet = policyPassword.get(1).substring(0,1);   
            String password = policyPassword.get(2);
            
            Integer count = 0;	//stores number of occurences of alphabet in password
            
            //If password length < minimum count, it will automatically be invalid
            if(password.length() >= min_req_count){ 
                count = password.countMatches(alphabet);   
                
                //check if password policy is satisfied
                if(count >= min_req_count && count <= max_req_count){
                    validPasswordCount ++;  
                }   
            } 
        } 
        
        system.debug('count of valid passwords: ' + validPasswordCount );
        return validPasswordCount;
    }
}