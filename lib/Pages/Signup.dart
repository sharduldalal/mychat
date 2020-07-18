import 'package:flutter/material.dart';
import 'package:mychat/Widgets/Widgets.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final fromKey = GlobalKey<FormState>();
  TextEditingController usernameTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  signupProcess(){

  }
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
                Form(
                  key: fromKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (){};
                        controller: usernameTEC,
                        style: textFieldStyle(),
                        decoration: textField("username"), //from widgets
                      ),
                      TextFormField(
                        controller: emailTEC,
                        style: textFieldStyle(),
                        decoration: textField("email"), //from widgets
                      ),
                      TextFormField(
                        controller: passwordTEC,
                        style: textFieldStyle(),
                        decoration: textField("password"), //from widgets
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                //to create a vertical space we use sized box
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "Forgot Password?",
                        style: textFieldStyle(),
                      ),
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
                          "Signin",
                          style: textFieldStyle(),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Signin with Google",
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
                        Text("Already have an Account?", style: textFieldStyle(),),
                        Text("Signin", style: textFieldStyle(),)
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

