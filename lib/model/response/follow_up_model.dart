class FollowUpModel {
  FollowUpModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  FollowUpModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FollowList.fromJson(v));
      });
    }
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }
  String? message;
  List<FollowList>? data;
  bool? isSucsseded;
  int? status;


}

class FollowList {
  FollowList({
      this.id, 
      this.attachment, 
      this.attachmentPath, 
      this.note, 
      this.creationDate,
  this.createdBy,});

  FollowList.fromJson(dynamic json) {
    id = json['id'];
    attachment = json['attachment'];
    attachmentPath = json['attachmentPath'];
    note = json['note'];
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
  }
  int? id;
  dynamic attachment;
  String? attachmentPath;
  String? note;
  String? creationDate;
  String? createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['attachment'] = attachment;
    map['attachmentPath'] = attachmentPath;
    map['note'] = note;
    map['creationDate'] = creationDate;
    return map;
  }

}