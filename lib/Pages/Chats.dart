import 'package:flutter/material.dart';
import 'package:mychat/Engine/Auth.dart';
import 'package:mychat/Engine/Databse.dart';
import 'package:mychat/Helper/Authenticate.dart';
import 'package:mychat/Helper/Conatants.dart';
import 'package:mychat/Helper/SharedPrefrences.dart';
import 'package:mychat/Pages/Chatpage.dart';
import 'package:mychat/Pages/Search.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  Auth auth = new Auth();

  AllTheChats allTheChats = new AllTheChats();

  Stream chatRooms;


  Widget ChatRoomList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return ChatRoomsTile(
                  snapshot.data.documents[index].data["ChatsId"]
                      .toString()
                      .replaceAll("_", "")
                      .replaceAll(Constants.MyName, ""),
                  snapshot.data.documents[index].data["ChatsId"]
              );
            }) : Container();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.MyName = await SharedPrefrences.getUsername();
    setState(() {
      allTheChats.getAllTheChats(Constants.MyName).then((value) {
        setState(() {
          chatRooms = value;
        });
      });
    });
  }

/*  getUserInfo() async {
    Constants.MyName = await SharedPrefrences.getUsername();
    allTheChats.getAllTheChats(Constants.MyName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.MyName}");
      });
    });
  }*/

  /* Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ChatRoomsTile(
                userName: snapshot.data.documents[index].data["Chats"]
                    .toString()
                    .replaceAll("_", "")
                    .replaceAll(Constants.MyName, ""),
                chatRoomId: snapshot.data.documents[index].data["Chats"],
              );
            })
            : Container();
      },
    );
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("Logo.png", height: 50,),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
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
      body: ChatRoomList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Search()
          ));
        },
      ),
    );
  }
}


class ChatRoomsTile extends StatelessWidget {

  final String username;
  final String ChatRoomId;

  ChatRoomsTile(this.username, this.ChatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => individualChatPage(ChatRoomId)
        ));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Text("${username.substring(0, 2)}".toUpperCase()),
            ),
            SizedBox(width: 8,),
            Text(username)
          ],
        ),
      ),
    );
  }
}

/*
class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName,@required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => individualChatPage(chatRoomId)
        ));
      },
      child: Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              width: 12,
            ),
            Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
*/
