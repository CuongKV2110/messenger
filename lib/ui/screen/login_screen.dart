import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:messenger/bloc/login_bloc.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  final LoginBloc _loginBloc = LoginBloc();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Image.asset('images/mess.png'),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome to Messenger",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                _loginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2),
          child: StreamBuilder(
            stream: _loginBloc.userStream,
            builder: (context, snapshot) {
              return TextField(
                controller: userController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Phone Number or Email",
                  // errorText: snapshot.hasError ? snapshot.error.toString() : null,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: StreamBuilder(
            stream: _loginBloc.passStream,
            builder: (context, snapshot) {
              return TextField(
                controller: passController,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        MaterialButton(
          height: 46,
          minWidth: MediaQuery.of(context).size.width * 0.9,
          elevation: 6,
          color: Colors.lightBlueAccent,
          child: const Text('LOGIN'),
          onPressed: () {
            checkLogin();
          },
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          height: 46,
          minWidth: MediaQuery.of(context).size.width * 0.9,
          elevation: 4,
          child: const Text('FORGOT PASSWORD ?'),
          onPressed: () {},
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
            "----------------------------------- or -----------------------------------"),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: const CircleAvatar(
                  backgroundImage: AssetImage('images/face.png'),
                ),
                onTap: () async {
                  // facebookSignIn.loginBehavior = FacebookLoginBehavior.webViewOnly;
                  final FacebookLoginResult result =
                      await facebookSignIn.logIn(['email']);
                  switch (result.status) {
                    case FacebookLoginStatus.loggedIn:
                      final FacebookAccessToken accessToken =
                          result.accessToken;
                      print('''
                      Logged in!
                      Token: ${accessToken.token}
                      User id: ${accessToken.userId}
                      Expires: ${accessToken.expires}
                      Permissions: ${accessToken.permissions}
                      Declined permissions: ${accessToken.declinedPermissions}
                      ''');
                      break;
                    case FacebookLoginStatus.cancelledByUser:
                      print('Login cancelled by the user.');
                      break;
                    case FacebookLoginStatus.error:
                      print('Something went wrong with the login process.\n'
                          'Here\'s the error Facebook gave us: ${result.errorMessage}');
                      break;
                  }
                },
              ),
              GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/gmail1.png'),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        MaterialButton(
          height: 46,
          minWidth: MediaQuery.of(context).size.width * 0.9,
          elevation: 4,
          color: Colors.lightGreenAccent,
          child: const Text('CREATE NEW ACCOUNT'),
          onPressed: () {},
        ),
      ],
    );
  }

  void checkLogin() {
    if (_loginBloc.isValidInfo(userController.text, passController.text)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }
}
