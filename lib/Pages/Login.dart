import 'package:flutter/material.dart';
import 'package:mychat/Widgets/Widgets.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar1(context),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  style: textFieldStyle(),
                  decoration: textField("email"), //from widgets
                ),
                TextField(
                  style: textFieldStyle(),
                  decoration: textField("password"), //from widgets
                ),
                SizedBox(
                  height: 8,
                ),
                //to create a vertical space we use sized box
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Forgot Password?",
                      style: textFieldStyle(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: textFieldStyle(),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Login with Google",
                          style: textFieldStyle(),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Dont have an Account?", style: textFieldStyle(),),
                        Text("Signup", style: textFieldStyle(),)
                      ],
                    ),
                    SizedBox(
                      height: 150,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle textFieldStyle() {
  return TextStyle(color: Colors.white);
}
