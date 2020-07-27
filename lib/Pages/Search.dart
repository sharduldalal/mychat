import 'package:flutter/material.dart';
import 'package:mychat/Widgets/Widgets.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchTEC = new TextEditingController();

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
                          hintStyle: TextStyle(color: Colors.white54),),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x36FFFFFF),
                          const Color(0x0FFFFFF),
                        ]
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.all(8),
                      child: Icon(Icons.search)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
