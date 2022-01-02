import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/bloc/login/login_state.dart';
import 'package:messenger/helpers/validate_helper.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  String errorMessage = '';
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*{
    if (event is LoginNormal) {
      errorMessage = '';
      yield LoginProcessing();

      if(event.email.isEmpty){
        errorMessage = 'Vui long nhap Email';
        yield LoginError();
        return;
      }
      if(!ValidationHelper.isEmailValid(event.email)){
        errorMessage = 'Email khong hop le';
        yield LoginError();
        return;
      }
      if(event.password.isEmpty){
        errorMessage = 'Vui long nhap Pass';
        yield LoginError();
        return;
      }
      if(event.password.length < 6){
        errorMessage = 'Pass phai tu 6 ki tu tro len';
        yield LoginError();
        return;
      }
      yield LoginSuccess();

//TODO CALL API
      print("Login normal: " + event.email + "-" + event.password);
    }

    if (event is LoginFacebook) {
      errorMessage = '';
      print("Login FB: ");
    }

    if (event is LoginGoogle) {
      errorMessage = '';
      print("Login GG: ");
    }
  }
}
