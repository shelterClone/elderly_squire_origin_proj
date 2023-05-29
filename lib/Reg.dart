import 'package:elderly_squire_capstone/RADataPrivacy.dart';
import 'package:elderly_squire_capstone/Users.dart';
import 'package:elderly_squire_capstone/db_service.dart';
import 'package:elderly_squire_capstone/intro/intro_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:elderly_squire_capstone/Login.dart';
import 'package:intro_slider/intro_slider.dart';
import 'Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'package:elderly_squire_capstone/HomePage2.dart';



class Reg2 extends StatefulWidget {
  var user;

  @override
  Register createState() => Register();

}
class Register extends State<Reg2> {

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp specialReg = RegExp(r".*[!@#$%^&*()_+\-=\[\]{};':" "\\|,.<>/?].*");



//   String email;
//   String password;
  TextEditingController firstname = TextEditingController();
  TextEditingController middle = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool isPasswordHidden = true;
//  bool buttonEnabled = true;

//  var confirmpassword = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

//  final formKey = GlobalKey<FormState>();

  Future<void> _createUser(String firstname, String middle, String lastname,
      String address,String email, String password) async {
    if (validateReg()) {
      try {
        print("Email: $email Password: $password");
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: email, password: password);
        await DBServices().saveUser(Users(
          uid: user.uid,
          firstname: firstname,
          middle: middle,
          lastname: lastname,
          address: address,
          email: user.email
        ));
        print("User: $userCredential");
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Success!"),
                content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text("You are now offically registered!"),

                      ],
                    )
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home2(email:email)),
                      );
                    },
                  )
                ],
              );
            }
        );
      }

      on FirebaseAuthException catch (e) {
        print("Error: $e");
      } catch (e) {
        print("Error: $e");
      }
//    }
    }


  }

  User get user => FirebaseAuth.instance.currentUser;


  void initState() {
    firstname.text = '';
    middle.text = '';
    lastname.text = '';
    address.text = '';
    email.text = '';
    password.text = '';
    confirmpassword.text = '';

    super.initState();
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




      void dispose() {
        firstname.dispose();
        middle.dispose();
        lastname.dispose();
        address.dispose();
        email.dispose();
        password.dispose();
        confirmpassword.dispose();
        super.dispose();
      }

      return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 1200,
              child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
//                        margin: EdgeInsets.only(top:20),

                          child: Image.asset(
                              'assets/images/volunteer.jpg')
                      ),

                      Container(
                          padding: EdgeInsets.only(top: 5),
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
                        margin: EdgeInsets.only(top: 30),
                        child: TextFormField( //--------------------------------FirstName TexformField-----------------------------------------//
                          controller: firstname,

                          validator: (value) {
                            if (value.isEmpty) {
                              return "First Name Required";
                            }
//                          else if(!numReg.hasMatch(value)){
//                            return ("Invalid First Name");
//                          }
//                            else if(!specialReg.hasMatch(value)){
//                              return ("Invalid First Name");
//                            }
                            else {
                              return null;
                            }
                          },

                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            prefixIcon: Icon(Icons.people),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            TextSelection previousSelection = firstname
                                .selection; //----------new
                            firstname.text = value;
                            firstname.selection =
                                previousSelection; //--------------new
                          },

                        ),
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 30),


                        child: TextFormField( //--------------------------------Middle TexformField-----------------------------------------//
                          controller: middle,

                          validator: (value) {
                            if (value.isEmpty) {
                              return "Middle Name Required";
                            }
//                            else if(!numReg.hasMatch(value)){
//                              return "Invalid Middle Name";
//                            }
//                            else if(!specialReg.hasMatch(value)){
//                              return "Invalid Middle Name";
//                            }
                            else {
                              return null;
                            }
                          },

                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Middle Name',
                            prefixIcon: Icon(Icons.people),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            TextSelection previousSelection = middle
                                .selection; //----------new
                            middle.text = value;
                            middle.selection =
                                previousSelection; //--------------new
                          },

                        ),
                      ),

                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 30),
                        child: TextFormField( //--------------------------------Last Name TexformField-----------------------------------------//
                          controller: lastname,

                          validator: (value) {
                            if (value.isEmpty) {
                              return "Last Name Required";
                            }
//                            else if(!numReg.hasMatch(value)){
//                              return "Invalid Last Name";
//                            }
//                            else if(!specialReg.hasMatch(value)){
//                              return "Invalid Last Name";
//                            }
                            else {
                              return null;
                            }
                          },

                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            prefixIcon: Icon(Icons.people),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            TextSelection previousSelection = lastname
                                .selection; //----------new
                            lastname.text = value;
                            lastname.selection =
                                previousSelection; //--------------new
                          },

                        ),
                      ),

                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 30),
                        child: TextFormField( //--------------------------------Address TexformField-----------------------------------------//
                          controller: address,

                          validator: (value) {
                            if (value.isEmpty) {
                              return "Address Required";
                            }
//                            else if(!numReg.hasMatch(value)){
//                              return "Invalid Last Name";
//                            }
//                            else if(!specialReg.hasMatch(value)){
//                              return "Invalid Character";
//                            }
                            else {
                              return null;
                            }
                          },

                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Address',
                            prefixIcon: Icon(Icons.home),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            TextSelection previousSelection = address
                                .selection; //----------new
                            address.text = value;
                            address.selection =
                                previousSelection; //--------------new
                          },

                        ),
                      ),

                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 30),
                        child: TextFormField( //--------------------------------Email TexformField-----------------------------------------//
                          controller: email,

                          validator: (value) {
                            if (value.isEmpty) {
                              return "Email Required";

                            }
//                          else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
//                            return ("Please Enter a Valid Email");
//                          }
                            else if (value.isEmpty ||
                                !value.contains('@gmail.com')) {
                              return "Invalid Email";
                            }
                            else {
                              return null;
                            }
                          },

                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.mail),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            TextSelection previousSelection = email
                                .selection; //----------new
                            email.text = value;
                            email.selection =
                                previousSelection; //--------------new
                          },

                        ),
                      ),

                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField( //--------------------------------Password TexformField-----------------------------------------//
                        controller:password,
                          validator: (String value) {
                            if (value == null || value.isEmpty) {
                              return "Password Required";
                            }
                            else if (value.length < 8) {
                              return "Password must be 8-16 characters";
                            }
                            else if (value.length > 16) {
                              return "Password must be 8-16 characters";
                            }
                            else {
                              return null;
                            }
                          },
                          obscureText: isPasswordHidden,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon:Icon(isPasswordHidden? Icons.visibility_off : Icons.visibility),
                              onPressed: (){
                                setState(() {
                                  isPasswordHidden =! isPasswordHidden;
                                });
                              },
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
//                    filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            TextSelection previousSelection = password
                                .selection; //----------new
                            password.text = value;
                            password.selection =
                                previousSelection; //--------------new
//
                          },
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField( //--------------------------------Confirm Password TexformField-----------------------------------------//
                        controller:confirmpassword,
                            validator: (String value) {
                              if (value == null || value.isEmpty) {
                                return "Please Re Enter Password";
                              }

//                          if(confirmpassword.text.length > 6 && password.text = value){
//                            return ("Password don't match");
//                          }
                          if(password.text != confirmpassword.text){
                            return "Password does not match";
                          }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock),
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20.0)),
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20.0)),
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 1),
                              ),
                            ),
                            onChanged: (value) {
                              TextSelection previousSelection = confirmpassword
                                  .selection; //----------new
                              confirmpassword.text = value;
                              confirmpassword.selection =
                                  previousSelection; //--------------new},
                            }
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
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            onPressed:  () {
                            _createUser(firstname.text,middle.text,lastname.text,address.text,email.text, password.text);
                        }
                        )
                      ),

                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 17),
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
      );
    }
  }


