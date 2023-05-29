class Users{
  String firstname;
  String middle;
  String lastname;
  String address;
  String email;
  String uid;


  Users({this.firstname,this.middle,this.lastname,this.address,this.email,this.uid});

  Users.fromJson(Map<String, dynamic>json){
    firstname = json['firstname'];
    middle = json['middlename'];
    lastname = json['lastname'];
    address = json['address'];
    email = json['email'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    return {
      "First Name":firstname,
      "Middle":middle,
      "Last Name":lastname,
      "Address":address,
      "email":email,
      "uid":uid,
    };


  }}

