import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
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
              const SizedBox(height: 30),
              _loginForm()
            ],
          ),
        ),
      )),
    );
  }

  Widget _loginForm() {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            hintText: "Phone Number or Email",
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: "Password",
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
            "-------------------------------------------- or -------------------------------------------"),
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
}
