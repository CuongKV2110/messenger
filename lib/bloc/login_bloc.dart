import 'dart:async';
import 'package:messenger/helpers/login_validate.dart';

class LoginBloc {
  StreamController userController = StreamController();
  StreamController passController = StreamController();

  Stream get userStream => userController.stream;

  Stream get passStream => passController.stream;

  bool isValidInfo(String username, String password) {
    if (!LoginValidate.isValidUser(username)) {
      userController.sink.addError("This PhoneNumber or Email is Invalid");
      return false;
    }
    userController.sink.add("OK");
    if (!LoginValidate.isValidPass(password)) {
      passController.sink.addError("This password is Invalid");
      return false;
    }
    passController.sink.add("OK");
    return true;
  }

  void dispose() {
    userController.close();
    passController.close();
  }
}
