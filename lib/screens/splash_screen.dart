import 'package:chat_app/data/database.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate() async {
    await Future.delayed(Duration(seconds: 1), nextScreen);
  }

  nextScreen() {
    if (authService.isLoggedIn)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    else
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void initDatabase() async {
    await db.init();
    await Future.delayed(Duration(seconds: 1), navigate);
  }

  @override
  void initState() {
    initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash screen"),
      ),
    );
  }
}
