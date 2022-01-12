import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/bloc/app/app_bloc.dart';
import 'package:messenger/bloc/login/login_state.dart';
import 'package:messenger/helpers/validate_helper.dart';
import 'package:messenger/providers/login_provider.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginProvider _loginProvider = LoginProvider();

  LoginBloc() : super(LoginInitial());
  String errorMessage = '';

  void dispose() {
    close();
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginNormal) {
      errorMessage = '';
      yield LoginProcessing();

      if (event.email.isEmpty) {
        errorMessage = 'Vui long nhap Email';
        yield LoginError();
        return;
      }

      if (!ValidationHelper.isEmailValid(event.email)) {
        errorMessage = 'Email khong hop le';
        yield LoginError();
        return;
      }

      if (event.password.isEmpty) {
        errorMessage = 'Vui long nhap Pass';
        yield LoginError();
        return;
      }

      if (event.password.length < 6) {
        errorMessage = 'Pass phai tu 6 ki tu tro len';
        yield LoginError();
        return;
      }

      if (ValidationHelper.isEmailValid(event.email) &&
          event.password.length >= 6) {
        await Future.delayed(const Duration(milliseconds: 1500), () {});
        var res = await _loginProvider.login();

        if (res.success){
          if(res.data.email == event.email && res.data.password == event.password){
            AppBloc.singleton.account = res.data;
            yield LoginSuccess();
            return;
          }
          else{
            errorMessage = 'Tai khoan khong chinh xac. Nhap lai !!!';
            yield LoginError();
            return;
          }
        }
        else{
          errorMessage = 'Dang nhap that bai !!!';
          yield LoginError();
          return;
        }
      }


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
