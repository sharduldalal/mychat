import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mychat/Engine/Databse.dart';
import 'package:mychat/Helper/Conatants.dart';
import 'package:mychat/Pages/Chatpage.dart';
import 'package:mychat/Widgets/Widgets.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  SearchQuery searchQuery = new SearchQuery();

  TextEditingController searchTEC = new TextEditingController();


  QuerySnapshot searchSnapshot;

  CreateChatPage createChatPage = new CreateChatPage();

  SearchNow() {
    searchQuery.getUserByUsername(searchTEC.text).then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  // Create a Chat Room Send user to chat page
  //pushReplacement

  createChatPageAndStartConvo({String username}) {
    if (username != Constants.MyName) {
      String ChatsId = getChatId(username, Constants.MyName);

      List<String> users = [username, Constants.MyName];
      Map<String, dynamic> ChatsMap = {
        "users": users,
        "ChatsId": ChatsId,
      };
      createChatPage.createPage(ChatsId, ChatsMap);

      Navigator.push(context, MaterialPageRoute(
          builder: (context) => individualChatPage(ChatsId)
      ));
    } else {
      print("You Cannot Text Yourself");
    }
  }


  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
        shrinkWrap: true,
        itemCount: searchSnapshot.documents.length,
        itemBuilder: (context, index) {
          return SearchListTile(
            username: searchSnapshot.documents[index].data["name"],
            email: searchSnapshot.documents[index].data["email"],
          );
        })
        : Container();
  }

  Widget SearchListTile({String username, String email}) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(username),
              Text(email),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: () {
                createChatPageAndStartConvo(
                    username: username
                );
              },
              child: Text("Message"),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    SearchNow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar1(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x36FFFFFF),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTEC,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      SearchNow();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            const Color(0x36FFFFFF),
                            const Color(0x0FFFFFF),
                          ]),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.search)),
                  ),
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}


getChatId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}