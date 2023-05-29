import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:elderly_squire_capstone/Login.dart';
import 'HomePage.dart';
import 'Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reg extends StatefulWidget {
  @override
  Register createState() => Register();
}

class Register extends State<Reg> {
//  String email;
//  String password;
//  String confirmpass;
//
//  String selectGender;
//  List listItem = ["Male", "Female"];
  TextEditingController email = new TextEditingController();
  var password = TextEditingController();
  var confirmpass = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> _createUser() async {
    if (validateReg()) {
      try {
//      print("Email: $email Password: $password");
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email.text, password: password.text);

        print("User: $userCredential");
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Success"),
              content: SingleChildScrollView(
                child:ListBody(
                  children: <Widget>[
                    Text("You are now offically registered!"),

                  ],
                )
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Close"),
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Reg()));

                  },
                )
              ],
            );
          }
        );
      } on FirebaseAuthException catch (e) {
        print("Error: $e");
      } catch (e) {
        print("Error: $e");
      }


    }

  }

  bool validateReg() {
    final form = formkey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {

//    final TextEditingController e =TextEditingController.fromValue(
//        new TextEditingValue(
//            text: email,
//            selection: new TextSelection.collapsed(
//              offset: email.length
//            )
//        )
//    );
//
//    e.addListener(() {
//      setState(() {
//        email = e.text;
//      });
//    });

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 1100,
              child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
//                        margin: EdgeInsets.only(top:20),

                          child: Image.asset('assets/images/volunteer.jpg')),

//              Container(
//                margin: EdgeInsets.only(top: 5),
//                child: Image.asset('assets/images/elderly_squire_logo_classic.png',
//                    height: 125, width: 125),
//              ),

                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'REGISTRATION',
                            style: TextStyle(
                                fontFamily: ('Montserrat'),
                                fontSize: 20,
                                letterSpacing: 3),
                          )),



                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(//--------------------------------Email TextFormField----------------------------//
                          controller: email,

//                          validator: EmailReg.validate,
                          validator: (value){
                            if (value.isEmpty) {
                              return "Email Required";
                            } else {
                              return null;
                            }
                          },
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.people),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            email.text = value;
                            email.selection = TextSelection.fromPosition(TextPosition(offset: email.text.length));



                          },

                        ),
                      ),

                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
//                          validator: PasswordReg.validate,
                          validator: (value){
                            if (value.isEmpty) {
                              return "Password Required";
                            }
                            else if (value.length < 8) {
                              return "Password must be 8-16 characters";
                            }
                            else if(value.length > 16) {
                              return "Password must be 8-16 characters";
                            }
                            else {
                              return null;
                            }

                          },

                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            hintStyle: TextStyle(color: Colors.grey),
//                    filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            password.text = value;
//                            password.selection = TextSelection.fromPosition(TextPosition(offset: password.text.length));

                          },
                        ),
                      ),



                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: confirmpass,
//                          validator: ConfirmPass.validate,
                          validator: (value){
                            if(value.isEmpty) {
                              return 'Empty';
                            }
                            else if(value!= password && value!=confirmpass) {
                              return 'Password do not match';
                            }
                            else{
                              return null;
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock),
                            hintStyle: TextStyle(color: Colors.grey),
//                    filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (String value) {
                             confirmpass.text = value;

                          },


                        ),
                      ),

                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ('OpenSans'),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPressed: _createUser,
                        ),
                      ),

                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Colors.lightBlue,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Icon(Icons.arrow_back_ios)),
                              Container(
                                margin: EdgeInsets.only(left: 75),
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: ('OpenSans'),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//class EmailReg {
//  static String validate(String value) {
//    if (value.isEmpty) {
//      return "Email Required";
//    } else {
//      return null;
//    }
//  }
//}

//class PasswordReg {
//  static String validate(String value) {
//    if (value.isEmpty) {
//      return "Password Required";
//    }
//    else if (value.length < 8) {
//      return "Password must be 8-16 characters";
//    }
//    else if(value.length > 16) {
//      return "Password must be 8-16 characters";
//    }
//    else {
//      return null;
//    }
//  }
//}

//class ConfirmPass{
//   static String validate(String value) {
//    if(value.isEmpty) {
//      return 'Empty';
//    }
//    else if(value!= password && value!.isNotEmpty) {
//      return 'Password do not match';
//    }
//    else{
//      return null;
//    }
//  }


