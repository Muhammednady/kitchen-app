import 'package:Kitchen_system/model/response/kitchen_model.dart';

class ItemModel {
  ItemModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  ItemModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? ItemList.fromJson(json['data']) : null;
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }
  String? message;
  ItemList? data;
  bool? isSucsseded;
  int? status;


}

class ItemList {
  ItemList({
      this.statusCategoryId, 
      this.defaultDesc, 
      this.statuses,});

  ItemList.fromJson(dynamic json) {
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

