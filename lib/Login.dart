import 'package:elderly_squire_capstone/DataPrivacy2.dart';
import 'package:elderly_squire_capstone/HomePage.dart';
import 'package:elderly_squire_capstone/HomePage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:elderly_squire_capstone/Reg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:async';
import 'RADataPrivacy.dart';
import 'dart:core';


class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}
class LoginState extends State<Login>{
//  var _textController = new TextEditingController();
  TextEditingController myEmail = TextEditingController() ;
  TextEditingController password = TextEditingController();
  bool isPasswordHidden = true;

//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();//-------old
  final GlobalKey <FormState> formkey = GlobalKey<FormState>();
//  final FirebaseAuth firebaseAuth =FirebaseAuth.instance;//--------------old

//  Login(his.email,this.password);
  Future<void> _UserLogin(String myEmail, String password) async {
    if (validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myEmail, password: password );
        print("User: $userCredential");

        await Navigator.push(context, MaterialPageRoute(builder: (context)=>Home2(email: myEmail)
        ),
        );

      } on FirebaseAuthException
      catch (e) {
        print("Error: $e");
      }
//      catch (e) {
//        print("Error: $e");
//      }
    }

  }
  bool validate(){
    final form = formkey.currentState;
    form.save();
    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }

  }




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 990,
            child: Center(
              child: Form(
                key:formkey,
                child: Column(
                  children: <Widget>[
                    Container(
//                        margin: EdgeInsets.only(top:20),

                        child: Image.asset(
                            'assets/images/nursing.jpg')
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Image.asset('assets/images/elderly_squire_logo_classic.png',
                          height: 90, width: 125),
                    ),

                    Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'LOG IN',
                          style: TextStyle(
                              fontFamily: ('Montserrat'),
                              fontSize: 20,
                              letterSpacing: 3),
                        )),
                    Container(
                      height: 50,
                      width: 300,
                      margin: EdgeInsets.only(top:30),

                      child: TextFormField(
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,//--------------------------------Email TexformField-----------------------------------------//
                        validator: EmailValidator.validate,
//                            validator: (value){
//                              if(value.isEmpty){
//                                return 'Please type your email';
//                              }
//                              else {
//                                return null;
//                              }
//                            },

                        onSaved: (input)=> myEmail.text = input,
                        onChanged: (value){
                          myEmail.text= value;
                        },
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.mail),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 50,
                      width: 300,
                      margin: EdgeInsets.only(top:20),
                      child: TextFormField(//--------------------------------Password TexformField-----------------------------------------//

                        validator: PasswordValidator.validate,
//                            validator: (value){
//                              if(value.isEmpty){
//                                return 'Password Required';
//                              }
//                              else {
//                                return null;
//                              }
//                            },
                        onSaved: (input)=> password.text = input,
                        onChanged: (value){
                          password.text= value;
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
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 50,
                      width: 300,
                      margin: EdgeInsets.only(top: 30),
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
                            "Ok",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: ('OpenSans'),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: (){
                          _UserLogin(myEmail.text, password.text);
                        },



                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:30),
                      child: TextButton(
                        child: Text('Not yet registered? Register Here',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            )),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Reg2()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:0.1),
                      child: TextButton(
                        child: Text('Privacy Policy',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            )),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TermsAndConditions()),
                          );

                        },
                      ),
                    )


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

void _togglePasswordView(bool isPasswordHidden) {

  if (isPasswordHidden == true) {
    isPasswordHidden = false;
  }
  else {
    isPasswordHidden = true;
  }
//setState((){
//  isPasswordHidden !=isPasswordHidden;
}


class EmailValidator {
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp specialReg = RegExp(r".*[!@#$%^&*()_+\-=\[\]{};':" "\\|,.<>/?].*");


  static String validate(String value) {

    if (value.isEmpty) {
      return "Email Required";
    }
    else if (value.isEmpty || !value.contains('@gmail')) {
      return "Please Enter a valid email address";
    }


    else {
      return null;
    }
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password Required";
    }
    else if (value.isEmpty || value.length <8) {
      return "Password must be 8-16 characters";
    }
    else if (value.length > 16) {
      return "Password must be 8-16 characters";
    }

    else {
      return null;
    }
  }
}

