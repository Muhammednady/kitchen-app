class GetAllNotesModel {
  GetAllNotesModel({
    this.message,
    this.data,
    this.isSucsseded,
    this.status,
  });

  GetAllNotesModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(NotesData.fromJson(v));
      });
    }
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }

  String? message;
  List<NotesData>? data;
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

class NotesData {
  NotesData({
    this.id,
    this.attachmentPath,
    this.creationDate,
    this.note,
    this.createdBy,
  });

/*
 {
      "id": 128,
      "attachmentPath": "a236d802-bd8b-4836-8609-6abbe0049f89_عرض.JPG",
      "note": "hh",
      "creationDate": "2023-11-11T15:14:06.91",
      "createdBy": "admin"
    },
 */
  NotesData.fromJson(dynamic json) {
    id = json['id'];
    attachmentPath = json['attachmentPath'];
    creationDate = json['creationDate'];
    note = json['note'];
    createdBy = json['createdBy'];
  }

  int? id;
  String? attachmentPath;
  String? creationDate;
  String? note;
  dynamic createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['attachmentPath'] = attachmentPath;
    map['creationDate'] = creationDate;
    map['note'] = note;
    map['createdBy'] = createdBy;
    return map;
  }
}
