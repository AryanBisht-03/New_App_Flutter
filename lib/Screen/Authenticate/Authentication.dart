import 'package:newappflutter/Screen/Authenticate/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:newappflutter/Screen/Authenticate/RegisterScreen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn=!showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showSignIn? SignIn(toggleView: toggleView) : Register(toggleView: toggleView),
    );
  }
}