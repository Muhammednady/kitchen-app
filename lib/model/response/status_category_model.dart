import 'package:Kitchen_system/model/response/kitchen_model.dart';

class StatusCategoryModel {
  StatusCategoryModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  StatusCategoryModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }
  String? message;
  Data? data;
  bool? isSucsseded;
  int? status;


}

class Data {
  Data({
      this.statusCategoryId, 
      this.defaultDesc, 
      this.statuses,});

  Data.fromJson(dynamic json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses?.add(Statuses.fromJson(v));
      });
    }
  }
  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;


}

