import 'package:flutter/material.dart';
import 'package:mychat/Engine/Databse.dart';
import 'package:mychat/Helper/Conatants.dart';
import 'package:mychat/Widgets/Widgets.dart';

class individualChatPage extends StatefulWidget {
  final String chatsId;

  individualChatPage(this.chatsId);

  @override
  _individualChatPageState createState() => _individualChatPageState();
}

class _individualChatPageState extends State<individualChatPage> {
  TextEditingController messageTEC = new TextEditingController();

  Messages messages = new Messages();

  Stream chatMessageStream;

  Widget ChatsMessagesList(){
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context, snapshot){
        return snapshot.hasData ?  ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              return MessageTile(
                snapshot.data.documents[index].data["message"],
                snapshot.data.documents[index].data["SentBy"] == Constants.MyName,
              );
            }) : Container();
      },
    );
  }

  /*Widget ChatsMessagesList() {
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Text(snapshot.data.documents[index].data["Message"]),
                  );
            });
      },
    );
  }*/

  SendMessage() {
    if (messageTEC.text.isNotEmpty) {
      Map<String, dynamic> MessageMap = {
        "message": messageTEC.text,
        "SentBy": Constants.MyName,
        "Time" : DateTime.now().millisecondsSinceEpoch,
      };
      messages.ChatMessages(widget.chatsId, MessageMap);
      messageTEC.text = "";
    }
    setState(() {
      ChatsMessagesList();
    });
  }

  @override
  void initState() {
    messages.getChatMessages(widget.chatsId).then((value) {
      setState(() {
        chatMessageStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar1(context),
      body: Container(
        child: Stack(
          children: <Widget>[
            ChatsMessagesList(),
            Container(
              alignment: Alignment.bottomCenter,
              color: Color(0x36FFFFFF),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTEC,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Message...",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      SendMessage();
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
                        child: Icon(Icons.send)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class MessageTile extends StatelessWidget {
  final String message;

  MessageTile(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message),
    );
  }
}*/



class MessageTile extends StatelessWidget {

  final String message;
  final bool isSentByMe;
  MessageTile(this.message,this.isSentByMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical:24),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: isSentByMe ? [
                  const Color(0xFF007EF4),
                  const Color(0xff2A75BC),
                ] :
                [
                  const Color(0xFF007EF4),
                  const Color(0xff2A75BC),
                  /*const Color(0x1AFFFFFF),
                  const Color(0x1AFFFFFF),*/
                ]
            ),
            borderRadius: isSentByMe ? BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
            ) :
            BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomRight: Radius.circular(23),
            )
        ),
        child: Text(message, style: TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}



/*
class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;

  MessageTile({@required this.message, @required this.sendByMe});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: sendByMe ? 0 : 24,
          right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: sendByMe
            ? EdgeInsets.only(left: 30)
            : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(
            top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sendByMe ? BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23)
            ) :
            BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
              colors: sendByMe ? [
                const Color(0xff007EF4),
                const Color(0xff2A75BC)
              ]
                  : [
                const Color(0x1AFFFFFF),
                const Color(0x1AFFFFFF)
              ],
            )
        ),
        child: Text(message,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'OverpassRegular',
                fontWeight: FontWeight.w300)),
      ),
    );
  }
}
*/
