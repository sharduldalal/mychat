import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mychat/Engine/Auth.dart';
import 'package:mychat/Engine/Databse.dart';
import 'package:mychat/Helper/SharedPrefrences.dart';
import 'package:mychat/Pages/Chats.dart';
import 'package:mychat/Widgets/Widgets.dart';

class login extends StatefulWidget {
  final Function toggle;

  login(this.toggle);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  Auth auth = new Auth();

  final fromKey = GlobalKey<FormState>();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  LoginPage loginPage = new LoginPage();

  bool isLoading = false;

  QuerySnapshot snapshotUserInfo;

  logingIn() {
    //SharedPrefrences.saveUsername(usernameTEC.text);
    SharedPrefrences.saveEmail(emailTEC.text);

    loginPage.getUserByEmail(emailTEC.text).then((value){
      snapshotUserInfo = value;
      SharedPrefrences.saveEmail(snapshotUserInfo.documents[0].data["name"]);
    });


    setState(() {
      isLoading = true;
    });


    auth
        .loginWithEmailAndPAssword(emailTEC.text, passwordTEC.text)
        .then((value) {
      if (value != null) {
        SharedPrefrences.saveUserLoginState(true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Chats()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Container(
      child: Center(child: CircularProgressIndicator(),),
    ) : Scaffold(
      appBar: appbar1(context),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height - 50,
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
                        validator: (val) {
                          return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val)
                              ? null
                              : "Please provide a valid emial";
                        },
                        controller: emailTEC,
                        style: textFieldStyle(),
                        decoration: textField("email"), //from widgets
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return val.length > 6
                              ? null
                              : "Password lenght should be greater than 6";
                        },
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
                        onPressed: () {
                          logingIn();
                        },
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
                        Text(
                          "Dont have an Account?",
                          style: textFieldStyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggle();
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Signup",
                                style: textFieldStyle(),
                              )),
                        )
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
