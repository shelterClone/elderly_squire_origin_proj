import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_capstone/chatapp3/models/message.dart';
import 'package:elderly_squire_capstone/chatapp3/models/users.dart';
import 'package:elderly_squire_capstone/chatapp3/services/auth_service.dart';

import 'auth_service.dart';

class DBServices {
  var userCollection = FirebaseFirestore.instance.collection('Users');
  var msgCollection = FirebaseFirestore.instance.collection('Messages');

  saveUser(Users user) async {
    try {
      userCollection.doc(user.uid).set(user.toJson());
    } catch (e) {}
  }

  Stream<List<Users>> get getDiscussionUser {
    return userCollection
        .where("uid", isNotEqualTo: AuthServices().user.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Users.fromJson(e.data())).toList());
  }
  Stream<List<Message>> getMessage(String receiverUID,[bool myMessage = true] ){
    return msgCollection
        .where('senderUID',
        isEqualTo: myMessage?AuthServices().user.uid: receiverUID)
        .where('receiverUID',
        isEqualTo: myMessage? receiverUID : AuthServices().user.uid)
        .snapshots().map((event) => event.docs.map((e) => Message.fromJson(e.data(), e.id)).toList());

  }
  Future<bool> sendMessage(Message msg)async{
    try {
      await msgCollection.doc().set(msg.toJson());
      return true;
    }catch (e){
      return false;
    }
    }
  }

