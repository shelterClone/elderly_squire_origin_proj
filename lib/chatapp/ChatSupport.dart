import 'package:elderly_squire_capstone/HomePage.dart';
import 'package:elderly_squire_capstone/HomePage2.dart';
import'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'Message.dart';

class ChatApp extends StatefulWidget {

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  List<Message> messages =[
    Message(
      text: 'Hi!',
      date: DateTime.now().subtract(const Duration(days:3,minutes: 3)),
      isSentByMe:false,
    ),
    Message(
      text: 'Hello!',
      date: DateTime.now().subtract(const Duration(days:3,minutes: 4)),
      isSentByMe:true,
    ),
    Message(
      text: 'How are you?',
      date: DateTime.now().subtract(const Duration(days:3,minutes: 3)),
      isSentByMe:false,
    ),
    Message(
      text: 'I\'m not feeling well',
      date: DateTime.now().subtract(const Duration(days:3,minutes: 3)),
      isSentByMe:true,
    ),
//  ].reversed.toList();
];

  @override
  Widget build(BuildContext context) => Scaffold (
    appBar: AppBar(
      toolbarHeight: 75,
      backgroundColor: Colors.blueGrey[900],
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home2()),
          );
        },
        child: Icon(
          Icons.arrow_back, // add custom icons also
        ),
      ),
      title: Container(
          margin: EdgeInsets.all(75.0),
          child: Text(
            'Chat Support',
            style: TextStyle(
                fontSize: 20,
                fontFamily: ('OpenSans MS'),
                fontWeight: FontWeight.bold),
          )),
    ),
    body: (
        Column(
          children: [
            Expanded(
                child:GroupedListView<Message, DateTime>(
                  padding: const EdgeInsets.all(20),
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  floatingHeader: true,
                  elements: messages,
                  groupBy: (message) =>DateTime(
                    message.date.year,
                    message.date.month,
                    message.date.day,
                  ),
                  groupHeaderBuilder: (Message message)=>SizedBox(
                    height: 70,
                    width:170,
                    child: Center(
                      child: Card(
                        color:  Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            DateFormat.yMMMd().format(message.date),
                            style: const TextStyle(color:Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemBuilder: (context, Message message)=>
                      Align(
                        alignment: message.isSentByMe
                            ?Alignment.centerRight
                            :Alignment.centerLeft,
                        child: Container(
                          height:50,
                          width:170,
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                  message.text,
                              style: TextStyle(
                                fontSize: 15
                              ),),
                            ),
                          ),
                        ),
                      ),

                )),
            Container(
                color: Colors.grey.shade300,
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Type your message here...',
                  ),
                  onSubmitted: (text){
                    final message = Message(
                      text: text,
                      date: DateTime.now(),
                      isSentByMe: true,
                    );
                    setState(() => messages.add(message));  {

                    };
                  },
                )
            )

          ],
        )),
  );
}
