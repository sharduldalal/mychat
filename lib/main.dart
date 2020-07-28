import 'package:flutter/material.dart';
import 'package:mychat/Helper/Authenticate.dart';
import 'package:mychat/Helper/SharedPrefrences.dart';
import 'package:mychat/Pages/Chats.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool loginState;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    SharedPrefrences.getUserLoginState().then((value) {
      setState(() {
        loginState = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginState != null ? loginState ? Chats() : Authenticate() : Authenticate()
    );
  }
}
// null value for logged in state because of waiting which occurs the user may be able to see another screen even when logged in
