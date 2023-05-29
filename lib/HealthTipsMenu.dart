import 'package:elderly_squire_capstone/HomePage2.dart';
import 'package:elderly_squire_capstone/PhysicalActivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HealthyEatingContent.dart';
import 'MedicineMenu.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'HealthWeightContent.dart';

class HealthTipsMenu extends StatelessWidget {
  final String email;


  HealthTipsMenu({@required this.email});

//  Home({this.email});

//LoginState login =  LoginState();

  @override
  Widget build(BuildContext context) {
    var widget;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.blueGrey[900],
          title: Container(
            margin: EdgeInsets.only(left:50,right:50),
            child: Image.asset(
                'assets/images/elderly_squire_logo_classic_icon.png',
                height: 40,
                width: 125),
          ),
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
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 150,
              child: Card( //------------------------------Health Weight---------------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthWeightContent()),
                            );

                          },

                          child: Image.asset('assets/images/weight-scale.png',
                              height: 50, width: 120),
                        )),
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 48, left: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthWeightContent()),
                                );
                              },
                              child: Text(
                                'Health Weight',
                                style: TextStyle(
                                    fontFamily: ('OpenSans'), fontSize: 20

//                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),

            ),

//
            Container(
              height: 150,
              child: Card( //------------------------------Healthy Eating---------------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContent()),
                            );

                          },

                          child: Image.asset('assets/images/diet.png',
                              height: 50, width: 120),
                        )),
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 48, left: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthyEatingContent()),
                                );
                              },
                              child: Text(
                                'Healthy Eating',
                                style: TextStyle(
                                    fontFamily: ('OpenSans'), fontSize: 20

//                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),

            ),

            Container(
              height: 150,
              child: Card( //------------------------------Physical Activity---------------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhysicalActContent()),
                            );

                          },

                          child: Image.asset('assets/images/weights_new.png',
                              height: 50, width: 120),
                        )),
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 48, left: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhysicalActContent()),
                                );
                              },
                              child: Text(
                                'Physical Activity',
                                style: TextStyle(
                                    fontFamily: ('OpenSans'), fontSize: 20

//                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),

            ),




          ],
        ),

      ),
    );
  }

}