class CustomDropDownModel {
  CustomDropDownModel({
      this.message, 
      this.isSuccess, 
      this.isActive, 
      this.data, 
      this.error,});

  CustomDropDownModel.fromJson(dynamic json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
    isActive = json['isActive'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataList.fromJson(v));
      });
    }
    error = json['error'];
  }
  String? message;
  bool? isSuccess;
  bool? isActive;
  List<DataList>? data;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['isSuccess'] = isSuccess;
    map['isActive'] = isActive;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['error'] = error;
    return map;
  }

}

class DataList {
  DataList({
      this.id, 
      this.name,});

  DataList.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}