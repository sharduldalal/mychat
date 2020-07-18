import 'package:flutter/material.dart';
import 'package:mychat/Pages/Login.dart';
import 'package:mychat/Pages/Signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: signup(),
    );
  }
}

