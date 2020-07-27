import 'package:flutter/material.dart';
import 'package:mychat/Pages/Login.dart';
import 'package:mychat/Pages/Signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogin = true;

  void toggleView(){
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin){
      return login(toggleView);
    }
    else {
      return signup(toggleView);
    };
  }
}
