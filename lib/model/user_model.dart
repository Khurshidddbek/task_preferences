class User {
  String id;
  String email;
  String password;
  String fullname;
  String phone;

  User({this.id, this.email, this.password});
  User.from({this.email, this.password});
  User.fromSignup({this.fullname, this.email, this.phone, this.password});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        password = json['password'],
        fullname = json['fullname'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'password': password,
    'fullname' : fullname,
    'phone' : phone,
  };
}