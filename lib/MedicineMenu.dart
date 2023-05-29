import 'package:elderly_squire_capstone/HomePage2.dart';
import 'package:elderly_squire_capstone/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'ReminderHome.dart';
import 'ToDoList.dart';
import 'todos.dart';

class MedicineMenu extends StatelessWidget {
  final String email;
  MedicineMenu({@required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 75,
        backgroundColor: Colors.blueGrey[900],
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home2(email: email)));
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
        title: Image.asset('assets/images/elderly_squire_logo_classic_icon.png',
            height: 40, width: 125),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 160,
            child: Card(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReminderHome(email: email)));
                          },
                          child: Image.asset('assets/images/reminder.png',
                              height: 50, width: 60),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReminderHome(email: email)));
                          },
                          child: Text(
                            'Medication Reminder',
                            style:
                                TextStyle(fontFamily: ('OpenSans'), fontSize: 18

//                                  fontWeight: FontWeight.bold
                                    ),
                          ),
                        )),
                  ],
                )),
          ),
          Container(
            height: 160,
            child: Card(
                //----------------------------------------------------------------To Do List--------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodoLanding()),
                            );
                          },
                          child: Image.asset('assets/images/todolist.png',
                              height: 50, width: 60),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodoLanding()),
                            );
                          },
                          child: Text(
                            'To Do List',
                            style:
                                TextStyle(fontFamily: ('OpenSans'), fontSize: 18

//                                  fontWeight: FontWeight.bold
                                    ),
                          ),
                        )),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
