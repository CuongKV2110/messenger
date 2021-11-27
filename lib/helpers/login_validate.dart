class LoginValidate {
  static bool isValidUser(String user) {
    String validateUser = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(validateUser);
    return user.contains("@gmail.com") || regExp.hasMatch(user);
  }

  static bool isValidPass(String pass){
    return pass.length > 6;
  }

}
