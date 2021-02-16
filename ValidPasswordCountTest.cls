@isTest
public class ValidPasswordCountTest {
    
    static testMethod void validPasswords(){
        List<String> passwords = new List<String>();
        passwords.add('1-3 a: abcde');
        passwords.add('1-3 b: cdefg');
        passwords.add('2-9 c: ccccccccc');
        Integer valid = ValidPasswordCount.checkValidity(passwords);
        system.debug(valid);
        System.assertEquals(2,valid);
    }
    
}