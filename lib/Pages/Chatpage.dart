import 'package:flutter/material.dart';
import 'package:mychat/Widgets/Widgets.dart';

class individualChatPage extends StatefulWidget {
  @override
  _individualChatPageState createState() => _individualChatPageState();
}

class _individualChatPageState extends State<individualChatPage> {

  Widget ChatsMessagesList() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar1(context),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Color(0x36FFFFFF),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Message...",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

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

