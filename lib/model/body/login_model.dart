class LoginModel {
  LoginModel({
      this.userNameOrEmail, 
      this.password, 
      this.rememberMe,});

  LoginModel.fromJson(dynamic json) {
    userNameOrEmail = json['userNameOrEmail'];
    password = json['password'];
    rememberMe = json['rememberMe'];
  }
  String? userNameOrEmail;
  String? password;
  bool? rememberMe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userNameOrEmail'] = userNameOrEmail;
    map['password'] = password;
    map['rememberMe'] = rememberMe;
    return map;
  }

}