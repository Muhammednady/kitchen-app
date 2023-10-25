class ErrorModel {
  ErrorModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  ErrorModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }
  String? message;
  dynamic data;
  bool? isSucsseded;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    map['isSucsseded'] = isSucsseded;
    map['status'] = status;
    return map;
  }

}