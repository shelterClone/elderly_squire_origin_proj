import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: ChatApp2(),
      theme: CupertinoThemeData(brightness: Brightness.light, primaryColor: Color(
        0xFFFF1744
      )),
    );
  }
}

class ChatApp2 extends StatelessWidget {
  ChatApp2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        backgroundColor: Color(0xFF263238),
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                label:"Chats",
                icon: Icon(CupertinoIcons.chat_bubble_2_fill)
            ),
            BottomNavigationBarItem(
                label:"Calls",
                icon: Icon(CupertinoIcons.phone)
            ),
            BottomNavigationBarItem(
                label:"People",
                icon: Icon(CupertinoIcons.person)
            ),
            BottomNavigationBarItem(
                label:"Settings",
                icon: Icon(CupertinoIcons.settings)
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Text("$index"),
            ),
          );
        },
      ),
    );
  }
}
