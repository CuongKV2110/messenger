import 'package:flutter/material.dart';
import 'package:messenger/bloc/login_bloc.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginBloc _loginBloc = LoginBloc();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.2,
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
                const SizedBox(height: 20),
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
          height: 16,
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
