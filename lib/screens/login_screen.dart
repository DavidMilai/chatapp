import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login screen"),
      ),
      body: Column(
        children: [
          TextField(
            controller: emailTextEditingController,
            decoration: InputDecoration(hintText: 'Email address'),
          ),
          TextField(
            controller: passwordTextEditingController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
