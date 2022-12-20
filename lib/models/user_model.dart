class User {
  String? name;
  String? mail;
  String? password;
  bool? keepon;

  User({this.name, this.mail, this.password, this.keepon});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mail = json['mail'];
    password = json['password'];
    keepon = json['keepon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mail'] = this.mail;
    data['password'] = this.password;
    data['keepon'] = this.keepon;
    return data;
  }
}