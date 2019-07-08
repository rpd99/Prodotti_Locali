package ecommerce.utils;

public class Validator {

	public static boolean isValidEmail(String email) {
		String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	    return email.matches(regex);
	}
	
	public static boolean isValidPassword(String password) {
		/*if(password.length()>=8 && password.length()<=16) {
			boolean hasNumber=false, hasUpper=false, hasLower=false;
			for(int i = 0; i < password.length(); i++) {
				if(Character.isDigit(password.charAt(i))){
					hasNumber = true;
				}
				if(Character.isUpperCase(password.charAt(i))){
					hasUpper = true;
				}
				if(Character.isLowerCase(password.charAt(i))){
					hasLower = true;
				}
			}
			if(hasNumber && hasUpper && hasLower)
				return true;
		}
		return false;*/

		String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,16}$";
	    return password.matches(regex);
	}
	
	public static boolean isValidString(String str) {
		for(int i = 0; i < str.length(); i++) {
			if(!Character.isLetter(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}
	
	public static boolean isValidTelephone(String tel) {
		String regex = "\\d{10}";
		return tel.matches(regex);
	}
	
	public static boolean isValidInt(String num) {
		try{
			Integer.parseInt(num);
			return true;
		}catch (NumberFormatException e) {
			return false;
		}
	}
	
	public static boolean isValidFloat(String num) {
		try{
			Float.parseFloat(num);
			return true;
		}catch (NumberFormatException e) {
			return false;
		}
	}
	
}
