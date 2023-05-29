// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_capstone/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmpasswordEditingController = new TextEditingController();



  @override
  Widget build(BuildContext context) {

    final firstNameEditingField = TextFormField(
      //----------------email---------------------------//
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value){
          RegExp regex = new RegExp(r'^.{3,}$');
          if(value.isEmpty){
            return("First Name cannot be empty");
          }
          if(regex.hasMatch(value)){
            return ("Enter Valid Name(Min. 3 Characters)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final lastNameEditingField = TextFormField(
      //----------------email---------------------------//
        autofocus: false,
        controller: lastNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value){
          if(value.isEmpty){
            return("Second Name cannot be empty");
          }
          return null;
        },
        onSaved: (value) {
          lastNameEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final emailEditingField = TextFormField(
      //----------------email---------------------------//
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value){
          if(value.isEmpty){
            return("Please Enter Your Email");
          }
          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
            return ("Please Enter a Valid Email");
          }
          return null;
        },



        onSaved: (value) {
          emailEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordEditingField = TextFormField(
      //----------------email---------------------------//
        autofocus: false,
        controller: passwordEditingController,
//        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        validator: (value){
          RegExp regex = new RegExp(r'^.{6,}$');
          if(value.isEmpty){
            return ("Password is required for login");
          }
          if(!regex.hasMatch(value))
          {
            return("Enter Valid Password (Min. of 6 Characters");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final confirmpasswordEditingField = TextFormField(//--------------------confirm pass
      //----------------email---------------------------//
        autofocus: false,
        controller: confirmpasswordEditingController,
//        keyboardType: TextInputType.emailAddress,
        validator: (value){
          if(confirmpasswordEditingController.text.length >6 && passwordEditingController.text != value){
            return ("Password Don't match");
          }
          return null;
        },
        obscureText: true,
        onSaved: (value) {
          confirmpasswordEditingController.text = value;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));


    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back,color:Colors.red),
            onPressed: (){
              Navigator.of(context).pop();
            }, )
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
//                        margin: EdgeInsets.only(top:20),

                          child: Image.asset(
                              'assets/images/volunteer.jpg')
                      ),
//                      SizedBox(
//                        height: 180,
//                        child: Image.asset(
//                          "assets/images/elderly_squire_logo_classic.png",
//                          fit: BoxFit.contain,
//                        ),),
//                      SizedBox(height: 45),
//                      firstNameEditingField,
//                      SizedBox(height: 20),
//                      lastNameEditingField,
//                      SizedBox(height: 20),
//                      emailEditingField,
//                      SizedBox(height: 20),
//                      passwordEditingField,
//                      SizedBox(height: 20),
//                      confirmpasswordEditingField,
//                      SizedBox(height: 15),
//                      signupButton,

                    ],
                  ),
                ),
              ),
            ),
          )),
    );;
  }


  void signUp(String email, String password) async
  {
    if(_formKey.currentState.validate()){
      await _auth.createUserWithEmailAndPassword(email:email, password:password)
          .then((value) => {
      postDetailsToFirestore()
      }).catchError((e)
          {
            var Fluttertoast;
            Fluttertoast.showToast(msg: e.message);
          });

    }
  }

  postDetailsToFirestore() async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.lastName = lastNameEditingController.text;
    
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    var Fluttertoast;
    Fluttertoast.showToast(msg: "Account created successfully: ");
    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }
}
