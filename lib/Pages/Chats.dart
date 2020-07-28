import 'package:flutter/material.dart';
import 'package:mychat/Engine/Auth.dart';
import 'package:mychat/Helper/Authenticate.dart';
import 'package:mychat/Helper/Conatants.dart';
import 'package:mychat/Helper/SharedPrefrences.dart';
import 'package:mychat/Pages/Search.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  Auth auth = new Auth();

  @override
  void initState() {
    // TODO: implement initState
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.MyName = await SharedPrefrences.getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("Logo.png",height: 50,),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              auth.signout();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Authenticate()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.account_box),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Search()
          ));
        },
      ),
    );
  }
}