class UserModel {
  UserModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }
  String? message;
  Data? data;
  bool? isSucsseded;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['isSucsseded'] = isSucsseded;
    map['status'] = status;
    return map;
  }

}

class Data {
  Data({
      this.token, 
      this.expiresOn,});

  Data.fromJson(dynamic json) {
    token = json['token'];
    expiresOn = json['expiresOn'];
  }
  String? token;
  String? expiresOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['expiresOn'] = expiresOn;
    return map;
  }

}