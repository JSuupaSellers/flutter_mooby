import 'package:validate/validate.dart';

class LoginValidator {

  static String validateEmail(String email){
    try {
      Validate.isEmail(email);
    }catch(e){
      return "The email must be a valid address.";
    }
    return null;
  }

  static String validatePassword(String password){
    if(password.length < 8){
      return "The password must be greater than 8 characters";
    }
    return null;
  }
}