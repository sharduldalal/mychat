import 'package:flutter/material.dart';

Widget appbar1(BuildContext context) {
  return AppBar(
    title: Image.asset("Logo.png"),
  );
}

InputDecoration textField(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.white54),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}
