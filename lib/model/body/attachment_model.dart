
import 'dart:io';

class AttachmentModel {
  AttachmentModel({
      this.attachmentPath, 
      this.statusId,});

  AttachmentModel.fromJson(dynamic json) {
    attachmentPath = json['attachmentPath'];
    statusId = json['statusId'];
  }
  File? attachmentPath;
  int? statusId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attachmentPath'] = attachmentPath;
    map['statusId'] = statusId;
    return map;
  }

}