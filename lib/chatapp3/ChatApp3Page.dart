import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_capstone/chatapp3/messagecomponent.dart';
import 'package:elderly_squire_capstone/chatapp3/models/message.dart';
import 'package:elderly_squire_capstone/chatapp3/models/users.dart';
import 'package:elderly_squire_capstone/chatapp3/services/auth_service.dart';
import 'package:elderly_squire_capstone/chatapp3/services/db_service.dart';
import'package:flutter/material.dart';
import '';

class ChatApp3Page extends StatelessWidget {
  ChatApp3Page({Key key, this.user}) :super(key: key);
  final Users user;
  var msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(user.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Message>>(
                stream:DBServices().getMessage(user.uid, false),

             builder: (context, s1) {
               if (s1.hasData) {
                 return StreamBuilder<List<Message>>(
                   builder: (context, s2) {
                     if (s2.hasData) {
                       var messages = [...s1.data, ...s2.data];
                       messages.sort((i,j)=>i.createAt.compareTo(j.createAt));
                        messages = messages.reversed.toList();
                       return messages.length == 0
                           ? Center(
                         child: Text('No messages'),
                       ): ListView.builder(
                         reverse: true,
                         itemCount: messages.length,
                         itemBuilder: (context, index) {
                           final msg = messages[index];
                           return Container(
                             margin: EdgeInsets.only(bottom: 10),
                             child: MessageComponent(
                               msg: msg,
                             ),
                           );
                         },

                       );
                     } else
                       return Center(
                           child: CircularProgressIndicator());
                   },
                 );
               } else
                 return Center(
                     child: CircularProgressIndicator());
             }  )) ,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: msgController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ),
                IconButton(onPressed:()
                async{
                  var msg = Message(
                    content:msgController.text,
                    createAt: Timestamp.now(),
                    receiverUID: user.uid,
                    senderUID: AuthServices().user.uid,
                  );
                  msgController.clear();
                   await DBServices().sendMessage(msg);
                }, icon: Icon(Icons.send))
              ],
            )
          ],


        ),
      ),

    );
  }
}
