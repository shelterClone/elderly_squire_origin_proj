import 'package:elderly_squire_capstone/chatapp3/Textfield.dart';
import 'package:elderly_squire_capstone/chatapp3/config/function.dart';
import 'package:elderly_squire_capstone/chatapp3/services/auth_service.dart';
import 'package:flutter/material.dart';


class Register2 extends StatelessWidget {
  Register2 ({Key key}) : super(key: key);

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();

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
                    "Register",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Textfield(
                  controller: nameController,
                  prefix: Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  hint: 'Enter your Name',
                ),
                SizedBox(
                  height: 15,
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
                Textfield(
                  controller: confirmpasswordController,
                  prefix: Icon(Icons.vpn_key),
                  keyboardType: TextInputType.emailAddress,
                  hint: 'Confirm Password',
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async{
                    await AuthServices().signUp(nameController.text, emailController.text, passwordController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
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
                    Text("Registration"),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: (){
                       Navigator.of(context).pop();
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
