import 'package:elderly_squire_capstone/HomePage2.dart';
import 'AboutUs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HealthTipsMenu.dart';
import 'HealthWeightContent.dart';
import 'MedicineMenu.dart';
import 'package:provider/provider.dart';
import 'BenefitsMenu.dart';
import 'UserProfile.dart';
import 'Login.dart';
import 'package:elderly_squire_capstone/chatapp/ChatSupport.dart';

class Homepage_menu extends StatelessWidget {
  final String email;

  Homepage_menu({@required this.email});

  @override
  Widget build(BuildContext context) {
    var widget;
    return MaterialApp(
//        routes: <String, WidgetBuilder>{ //app routes
//          '/emailadd': (BuildContext context) => AboutUs(abtemail: email),
//
//
//        },

      home: Scaffold(
        
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
                        onTap: ()async{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
                        },

                        child: new Text(
//                        email != null ? email.toString : "$email",
                          email != null ? email : 'User',
//                          '${widget.email}',

                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                    )

                  ],
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home2()),
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
                        MaterialPageRoute(builder: (context) => AboutUs(abtemail: email,)),
                      );
                    }),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text(
                    'Log Out',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
//                    Navigator.popUntil(context,ModalRoute.withName("/"));
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => Login()));



//                  signOut();

                  },
                )
              ],
            ),
          ),
        ),

        body: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: Card(
                  //------------------------------Medicine Menu---------------------------------//
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
                                    builder: (context) => MedicineMenu()),
                              );
                            },
                            child: Image.asset('assets/images/medicine.jpg',
                                height: 100, width: 120),
                          )),
                      Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 55, left: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MedicineMenu()),
                                  );
                                },
                                child: Text(
                                  'Medicine',
                                  style: TextStyle(
                                      fontFamily: ('OpenSans'), fontSize: 23

//                                  fontWeight: FontWeight.bold
                                  ),
                                ),
                              )),
//                        Container(
//                            margin: EdgeInsets.only(top: 5),
//                            child: Text(
//                              '(Description)',
//                              style: TextStyle(
//                                fontFamily: ('OpenSans'),
//                                fontSize: 14,
//
////                                  fontWeight: FontWeight.bold
//                              ),
//                            ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                //------------------------------Health Tips Menu---------------------------------//
                height: 200,
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
                                  builder: (context) => HealthTipsMenu()),
                            );
                          },
                          child: Image.asset(
                              'assets/images/healthy_elders.jpg',
                              height: 100, width: 120),),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 55, left: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthTipsMenu()),
                                );
                              },
                              child: Text(
                                'Health Tips',
                                style: TextStyle(
                                    fontFamily: ('OpenSans'), fontSize: 23

//                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                //------------------------------Chat Support Menu---------------------------------//
                height: 200,
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
                                  builder: (context) => ChatApp()),
                            );
                          },
                          child: Image.asset(
                              'assets/images/chat.png',
                              height: 100, width: 120),),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 55, left: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ChatApp()),
                                );
                              },
                              child: Text(
                                'Chat Support',
                                style: TextStyle(
                                    fontFamily: ('OpenSans'), fontSize: 23

//                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ), );
  }
}

