import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_capstone/chatapp3/services/auth_service.dart';

class Message{
  String uid;
  String content;
  String senderUID;
  String receiverUID;
  Timestamp createAt;
  Message({
    this.content,
    this.createAt,
    this.senderUID,
    this.receiverUID,
    this.uid,
});
  Message.fromJson(Map<String, dynamic> json, String id){
  uid = id;
  content = json['content'];
  senderUID = json['senderUID'];
  senderUID = json['senderUID'];
  createAt = json['createAt'];
  }

  Map<String, dynamic> toJson(){
    return{
      'content': content,
      'senderUID': senderUID,
      'receiverUID': receiverUID,
      'createAt': createAt,
    };
  }

  bool get isMe => AuthServices().user.uid == senderUID;


}