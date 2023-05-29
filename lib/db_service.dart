import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_capstone/Reg.dart';
import 'package:elderly_squire_capstone/Users.dart';
//import 'package:elderly_squire_capstone/chatapp3/models/message.dart';
//import 'package:elderly_squire_capstone/chatapp3/models/users.dart';
//import 'package:elderly_squire_capstone/chatapp3/services/auth_service.dart';

//import 'auth_service.dart';

class DBServices {
  var userCollection = FirebaseFirestore.instance.collection('Users');


  saveUser(Users user) async {
    try {
      userCollection.doc(user.uid).set(user.toJson());
    } catch (e) {}
  }

  Stream<List<Users>> get getDiscussionUser {
    return userCollection
        .where("uid", isNotEqualTo: Reg2().user.uid)
        .snapshots()
        .map((event) =>
        event.docs.map((e) => Users.fromJson(e.data())).toList());
  }



}

