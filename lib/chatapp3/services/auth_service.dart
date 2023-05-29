
import 'package:elderly_squire_capstone/chatapp3/models/users.dart';
import 'package:elderly_squire_capstone/chatapp3/services/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final _auth = FirebaseAuth.instance;
  Future<bool>signIn(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }
    on FirebaseException catch(e){
      return false;
    }
  }

  signUp(String name, String email, String password)async{
    try{
      _auth.createUserWithEmailAndPassword(email: email, password: password);
      await DBServices().saveUser(Users(
        uid: user.uid,
        email: user.email,
        name: name,
      ));
      return true;

    }
    on FirebaseException
    catch(e){
      return false;
    }
  }

  User get user => FirebaseAuth.instance.currentUser;
  Stream<User> get onChangedUser => _auth.authStateChanges();

  signOut()async{
    try{
    await _auth.signOut();
    }catch(e){

    }
  }

}