import 'package:elderly_squire_capstone/chatapp3/Register2.dart';
import 'package:elderly_squire_capstone/chatapp3/Textfield.dart';
import 'package:elderly_squire_capstone/chatapp3/config/function.dart';
import 'package:elderly_squire_capstone/chatapp3/services/auth_service.dart';
import 'package:flutter/material.dart';

class Login2 extends StatelessWidget {
  Login2({Key key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool passwordhidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Textfield(
                  controller: emailController,
                  prefix: Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  hint: 'Enter your Email',
                ),
                SizedBox(
                  height: 15,
                ),
                Textfield(
                  obscuretext: true,
                  controller: passwordController,
                  prefix: Icon(Icons.vpn_key),
                  keyboardType: TextInputType.emailAddress,
                  hint: 'Enter your password',
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async{
                    await AuthServices().signIn(emailController.text, passwordController.text);
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 20))),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not yet Registered?"),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: (){
                        navigateToNextPage(context, Register2());
                      },
                      child: Text('Register Here'),
                    )

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
