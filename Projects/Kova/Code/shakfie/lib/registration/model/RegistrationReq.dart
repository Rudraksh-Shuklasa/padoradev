class RegistrationReq {
  String email;
  String password;
  String userName;

  RegistrationReq({this.email, this.password,this.userName});

  RegistrationReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    userName=json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['userName']=this.userName;
    return data;
  }
}