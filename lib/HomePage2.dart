import 'package:elderly_squire_capstone/AboutUs.dart';
import 'package:elderly_squire_capstone/HealthTipsMenu.dart';
import 'package:elderly_squire_capstone/HomePage.dart';
import 'package:elderly_squire_capstone/Homepage_menus.dart';
import 'package:elderly_squire_capstone/Login.dart';
import 'package:elderly_squire_capstone/MedicineMenu.dart';
import 'package:elderly_squire_capstone/Reg.dart';
import 'package:elderly_squire_capstone/UserProfile.dart';
import 'package:elderly_squire_capstone/MedmenuTab.dart';
import 'package:elderly_squire_capstone/db_service.dart';
import 'package:elderly_squire_capstone/news/views/news_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elderly_squire_capstone/chatapp/ChatSupport.dart';

class Home2 extends StatelessWidget {
  final String email;

  Home2({@required this.email});

  @override
  Widget build(BuildContext context) {
    var widget;
    return DefaultTabController(

      length: 2,
     child:Scaffold(
          drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.blueGrey[
                  900], //This will change the drawer background to blue.
              //other styles
            ),
            child: Drawer(
              child: ListView(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserProfile(email: email)));
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.person),
                            maxRadius: 25,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserProfile(email: email)));
                          },
                          child: new Text(
//                        email != null ? email.toString : "$email",
//                            email != null? email : 'User',
                            email != null? email : 'User',
//                              "${Reg2().}",
//                          '$email',
//                          '${widget.email}',

                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),

                      )],
                  ),
                  ListTile(
                      leading: Icon(Icons.home, color: Colors.white),
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home2()),
                        );
                      }),
//                ListTile(
//                    leading: Icon(Icons.settings, color: Colors.white),
//                    title: Text(
//                      'Settings',
//                      style: TextStyle(
//                        color: Colors.white,
//                      ),
//                    ),
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Home()),
//                      );
//                    }),

                  ListTile(
                      leading: Icon(Icons.people, color: Colors.white),
                      title: Text(
                        'About Us',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUs(abtemail: email)),
                        );
                      }),
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      return showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirmation"),
                              content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text("Are you sure do you want to log out?",
                                        style: (
                                            TextStyle(
                                                fontSize: 15
                                      )),),
                                    ],
                                  )
                              ),
                              actions: <Widget>[
                                Row(
                                  children: [
                                    FlatButton(
                                      child: Container(
                                          margin: EdgeInsets.only(top: 10.0, bottom: 15.0,left:30),
                                          child: Text("Yes",
                                            style: (
                                                TextStyle(
                                                    fontSize: 15
                                                )),)),
                                      onPressed:() async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) => Login()));
                                      },
                                    ),
                                    FlatButton(
                                      child: Container(
                                         margin: EdgeInsets.only(top: 10.0, bottom: 15.0,left:110),

                                          child: Text("No",   style: (
                                              TextStyle(
                                                  fontSize: 15
                                              )),)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Home2(email:email)),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            );
                          }
                      );



                    },
                  )
                ],
              ),
            ),
          ),
          appBar: AppBar(
            toolbarHeight: 75,
             centerTitle: true,
//              toolbarHeight: 130,
              backgroundColor: Colors.blueGrey[900],
            title: Image.asset(
                  'assets/images/elderly_squire_logo_classic_icon.png',
                  height: 40,
                  width: 125),
            ),

       body: Column(
         children: [
           TabBar(
               indicatorColor: Colors.blueGrey[900],

               tabs: [
             Tab(
                 child: Text(
                   'NEWS',
                   style: TextStyle(
                     color: Colors.blueGrey[900],
                   ),
                 ),
               ),
             Tab(
               child: Text(
                 'HOME',
                 style: TextStyle(
                   color: Colors.blueGrey[900],
                 ),
               ),
             ),

           ]),
           Expanded(
             child: TabBarView(children: [
               NewsHome(),
               MedMenutab(),



             ]),
           )


         ],
       ),


     ),
    );
  }
}
