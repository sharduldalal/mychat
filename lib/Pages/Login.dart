import 'package:flutter/material.dart';
import 'package:mychat/Widgets/Appbar.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar1(context),
    );
  }
}
