class MaintenanceModel {
  MaintenanceModel({
    this.message,
    this.data,
    this.isSucsseded,
    this.status,
  });

  MaintenanceModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ?List.from(json['data'].map((e)=> Maintenance.fromJson(e))) : null;
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }

  String? message;
  List<Maintenance>? data;
  bool? isSucsseded;
  int? status;
}

/*
 "clientMaintainanceId": 0,
      "notes": "note",
      "creationDate": "2023-11-15T00:42:50.163",
      "tarkeebDate": "2023-11-14T22:41:02.483",
      "attachments": null,
      "user": "test"
 */
class Maintenance {
  Maintenance.fromJson(dynamic json) {
    clientMaintenanceId = json['clientMaintainanceId'];
    note = json['notes'];
    creationDate = json['creationDate'];
    installDate = json['tarkeebDate'];
    attachment = json['attachments'];
    user = json['user'];
  }

  Maintenance(
      {this.clientMaintenanceId,
      this.note,
      this.creationDate,
      this.installDate,
      this.attachment,
      this.user});

  int? clientMaintenanceId;
  String? note;
  String? creationDate;
  String? installDate;
  String? attachment;
  String? user;
}
