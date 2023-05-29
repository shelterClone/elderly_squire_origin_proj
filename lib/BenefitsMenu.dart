import 'package:elderly_squire_capstone/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'ReminderHome.dart';
import 'package:url_launcher/url_launcher.dart';

class BenefitsMenu extends StatelessWidget {
  String email;

//  MedicineMenu({@required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.blueGrey[900],
        title: Container(
          margin: EdgeInsets.only(left: 65),
          child: Row(
            children: <Widget>[
              Image.asset('assets/images/elderly_squire_logo_classic_icon.png',
                  height: 40, width: 125),
            ],
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
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
            height: 120,
            child: Card(
                //----------------------------------------------------------------GSIS--------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
//                          onTap: () async {
//                            String url = "https://www.gsis.gov.ph/";
//                            var urllaunchable = await canLaunch(
//                                url);
//                            if (urllaunchable) {
//                              await launch(
//                                  url);
//                            } else {
//                              print("Webpage not available.");
//                            }
//                          },
                          child: Image.asset('assets/images/GSIS_logo.png',
                              height: 50, width: 60),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () async {
                            String url = "https://www.gsis.gov.ph/";
                            var urllaunchable = await canLaunch(
                                url);
                            if (urllaunchable) {
                              await launch(
                                  url);
                            } else {
                              print("Webpage not available.");
                            }
                          },
                          child: Text(
                            'GSIS',
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
            height: 120,
            child: Card(
                //----------------------------------------------------------------Pag Ibig--------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
//                          onTap: () async {
//                            String url = "https://www.pagibigfund.gov.ph/";
//                            var urllaunchable = await canLaunch(
//                                url);
//                            if (urllaunchable) {
//                              await launch(
//                                  url);
//                            } else {
//                              print("Webpage not available.");
//                            }
//                          },
                          child: Image.asset('assets/images/PagIbig_logo.png',
                              height: 50, width: 60),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () async {
                            String url = "https://www.pagibigfund.gov.ph/";
                            var urllaunchable = await canLaunch(
                                url);
                            if (urllaunchable) {
                              await launch(
                                  url);
                            } else {
                              print("Webpage not available.");
                            }
                          },
                          child: Text(
                            'Pag Ibig',
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
            height: 120,
            child: Card(
                //----------------------------------------------------------------Philhealth--------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
//                          onTap: () async {
//                            String url = "http://www.philhealth.gov.ph";
//                            var urllaunchable = await canLaunch(
//                                url);
//                            if (urllaunchable) {
//                              await launch(
//                                  url);
//                            } else {
//                              print("Webpage not available.");
//                            }
//                          },
                          child: Image.asset(
                              'assets/images/Philhealth_logo.png',
                              height: 50,
                              width: 60),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () async {
                            String url = "http://www.philhealth.gov.ph";
                            var urllaunchable = await canLaunch(
                                url);
                            if (urllaunchable) {
                              await launch(
                                  url);
                            } else {
                              print("Webpage not available.");
                            }
                          },
                          child: Text(
                            'Philheath',
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
            height: 120,
            child: Card(
                //----------------------------------------------------------------SSS--------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(

//                          onTap: () async {
//                            String url = "https://www.sss.gov.ph";
//                            var urllaunchable = await canLaunch(
//                                url);
//                            if (urllaunchable) {
//                              await launch(
//                                  url);
//                            } else {
//                              print("Webpage not available.");
//                            }
//                          },

                          child: Image.asset('assets/images/SSS_logo.png',
                              height: 50, width: 60),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () async {
                            String url = "https://www.sss.gov.ph";
                            var urllaunchable = await canLaunch(
                                url);
                            if (urllaunchable) {
                              await launch(
                                  url);
                            } else {
                              print("Webpage not available.");
                            }
                          },
                          child: Text(
                            'SSS',
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
