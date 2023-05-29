
import 'package:elderly_squire_capstone/chatapp3/ChatApp3Page.dart';
import 'package:elderly_squire_capstone/chatapp3/config/function.dart';
import 'package:elderly_squire_capstone/chatapp3/models/users.dart';
import 'package:elderly_squire_capstone/chatapp3/services/auth_service.dart';
import 'package:elderly_squire_capstone/chatapp3/services/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatApp3Home extends StatelessWidget {
  const ChatApp3Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat ${AuthServices().user.email}"),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthServices().signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<List<Users>>(
        stream: DBServices().getDiscussionUser,
        builder: (_, s){
          if(s.hasData){
            final users = s.data;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (ctx, i){
              final user = users[i];
              return
//                users.length == 0?Center(
//                child: Text("No Conversations"),
//              ):
                ListTile(
                  onTap: (){
                    navigateToNextPage(context, ChatApp3Page(user:user));
                  },
                  leading: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width:50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(.5)
                    ),
                    child: Icon(Icons.person),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );

            });
          }
          else{
            return Center(
              child: CircularProgressIndicator()
            );
          }
        }
      )
    );
  }
}
