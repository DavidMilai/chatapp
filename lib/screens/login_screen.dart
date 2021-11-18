import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/widgets/circular_material_spinner.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  login() {
    authService
        .login(
            emailTextEditingController.text, passwordTextEditingController.text)
        .then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())))
        .catchError((onError) {
      Fluttertoast.showToast(
          msg: "Incorrect Password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: emailTextEditingController,
              decoration: InputDecoration(hintText: 'Email address'),
            ),
            TextField(
              controller: passwordTextEditingController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            Selector<AuthService, bool>(
                selector: (context, authService) => authService.loggingIn,
                builder: (context, isLoggingIn, _) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CircularMaterialSpinner(
                      loading: isLoggingIn,
                      child: MaterialButton(
                        onPressed: isLoggingIn ? null : login,
                        child: Text("Login"),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
