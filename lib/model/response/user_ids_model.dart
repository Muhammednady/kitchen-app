class UserIdsModel {
  UserIdsModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  UserIdsModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UsersDataModel.fromJson(v));
      });
    }
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }
  String? message;
  List<UsersDataModel>? data;
  bool? isSucsseded;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['isSucsseded'] = isSucsseded;
    map['status'] = status;
    return map;
  }

}

class UsersDataModel {
  UsersDataModel({
      this.id, 
      this.userName,});

  UsersDataModel.fromJson(dynamic json) {
    id = json['id'];
    userName = json['userName'];
  }
  int? id;
  String? userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    return map;
  }

}