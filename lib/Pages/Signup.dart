import 'package:flutter/material.dart';
import 'package:mychat/Engine/Auth.dart';
import 'package:mychat/Engine/Databse.dart';
import 'package:mychat/Pages/Chats.dart';
import 'package:mychat/Widgets/Widgets.dart';

class signup extends StatefulWidget {

  final Function toggle;

  signup(this.toggle);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  bool  isLoading = false;

  Auth auth = new Auth();

  AddUserInfo addUserInfo = new AddUserInfo();

  final fromKey = GlobalKey<FormState>();
  TextEditingController usernameTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  signupProcess() {


    Map<String, String> userInfoMap = {
    "name" : usernameTEC.text,
    "email" : emailTEC.text,
  };
    if(fromKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      auth.signupWithEmailAndPassword(emailTEC.text, passwordTEC.text).then((val){
        //print("$val");

       /* Map<String, String> userInfoMap = {
          "name" : usernameTEC.text,
          "email" : emailTEC.text,
        };*///added here if any problem occurs with storage of the data

        addUserInfo.uploadUserInfo(userInfoMap);
        print("Doneshbfurfbuawefiuwevweirvarifbrif");
        setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Chats()
          ));
        });

        print("Done");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar1(context),
      backgroundColor: Colors.black,
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator(),),
      ) : SingleChildScrollView(
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
                        validator: (val) {
                          return val.isEmpty || val.length < 4
                              ? "Plaes provide a valid username"
                              : null;
                        },
                        controller: usernameTEC,
                        style: textFieldStyle(),
                        decoration: textField("username"), //from widgets
                      ),
                      TextFormField(
                        validator: (val) {
                          return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val) ? null : "Please provide a valid emial";
                        },
                        // to be corrected and use Email Validator instead
                        controller: emailTEC,
                        style: textFieldStyle(),
                        decoration: textField("email"), //from widgets
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val){
                          return val.length > 6 ? null : "Password lenght should be greater than 6";
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
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        onPressed: () {
                          signupProcess();
                        },
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
                        Text(
                          "Already have an Account?",
                          style: textFieldStyle(),
                        ),
                        GestureDetector(
                          onTap: (){
                            widget.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Signin",
                              style: textFieldStyle(),
                            ),
                          ),
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
