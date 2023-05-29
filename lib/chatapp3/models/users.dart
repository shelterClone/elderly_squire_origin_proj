class Users{
  String name;
  String email;
  String uid;


Users({this.name,this.email,this.uid});

Users.fromJson(Map<String, dynamic>json){
  email = json['email'];
  name = json['name'];
  uid = json['uid'];
}

Map<String, dynamic> toJson() {
  return {"uid":uid, "email":email, "name":name};


}}

