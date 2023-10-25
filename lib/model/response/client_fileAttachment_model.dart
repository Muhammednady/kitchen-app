class ClientFileAttachmentModel {
  ClientFileAttachmentModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  ClientFileAttachmentModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AttachmentsData.fromJson(v));
      });
    }
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }
  String? message;
  List<AttachmentsData>? data;
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

class AttachmentsData {
  AttachmentsData({
      this.id, 
      this.attachmentPath, 
      this.creationDate, 
      this.statusId, 
      this.statusName,});

  AttachmentsData.fromJson(dynamic json) {
    id = json['id'];
    attachmentPath = json['attachmentPath'];
    creationDate = json['creationDate'];
    statusId = json['statusId'];
    statusName = json['statusName'];
  }
  int? id;
  String? attachmentPath;
  String? creationDate;
  int? statusId;
  dynamic statusName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['attachmentPath'] = attachmentPath;
    map['creationDate'] = creationDate;
    map['statusId'] = statusId;
    map['statusName'] = statusName;
    return map;
  }

}