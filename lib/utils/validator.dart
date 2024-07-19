class Regex {
  static bool spaceValidaer(String name){
    RegExp doublespace = RegExp(r'^\w+[ ]{2,}\w+');
    return doublespace.hasMatch(name);
  }

  static String validateEmail(String email){
    String value='success';

    if(email.isEmpty){
      value='Email should not be empty';
    }

    if(email.length>40){
      value='Maximum characters limit in email is 40';
    }
    if(spaceValidaer(email)){
      value='Email should not contain any space';
    }

    // bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    bool emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email);
    if(!emailValid){
      value='Email format is wrong.';
    }

    if(!email.contains(".")){
      value='Email format is wrong.';
    }

    return value;
  }

  static String validateNumber(String number){
    String value='success';
    RegExp h = RegExp(r'\d{10}$');
    if(h.matchAsPrefix(number)==null){
      value='Phone number should contain 10 digits only.';
    }
    return value;
  }
  static String passwordValidator(String password){
    String value='success';
    if(password.contains(' ')){
      value='Password must not contain any space';
    }
    if(password.isEmpty){
      value='Password must not be empty';
    }
    if(password.length<6){
      value='Password must not be less than 6 characters';
    }
    return value;
  }

}