class ClientEmailsModel {
  ClientEmailsModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  ClientEmailsModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Clients.fromJson(v));
      });
    }
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }
  String? message;
  List<Clients>? data;
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

class Clients {
  Clients({
      this.clientId, 
      this.clientName, 
      this.clientNo, 
      this.email, 
      this.fax, 
      this.mobile, 
      this.tel1, 
      this.clientAddress, 
      this.createdBy, 
      this.creationDate, 
      this.modifiedBy, 
      this.modificationDate,});

  Clients.fromJson(dynamic json) {
    clientId = json['clientId'];
    clientName = json['clientName'];
    clientNo = json['clientNo'];
    email = json['email'];
    fax = json['fax'];
    mobile = json['mobile'];
    tel1 = json['tel1'];
    clientAddress = json['clientAddress'];
    createdBy = json['createdBy'];
    creationDate = json['creationDate'];
    modifiedBy = json['modifiedBy'];
    modificationDate = json['modificationDate'];
  }
 // int? clientFileId; //add new attribute ------> ( clientFileId )
  int? clientId;
  String? clientName;
  int? clientNo;
  dynamic email;
  dynamic fax;
  dynamic mobile;
  dynamic tel1;
  dynamic clientAddress;
  int? createdBy;
  String? creationDate;
  dynamic modifiedBy;
  String? modificationDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clientId'] = clientId;
    map['clientName'] = clientName;
    map['clientNo'] = clientNo;
    map['email'] = email;
    map['fax'] = fax;
    map['mobile'] = mobile;
    map['tel1'] = tel1;
    map['clientAddress'] = clientAddress;
    map['createdBy'] = createdBy;
    map['creationDate'] = creationDate;
    map['modifiedBy'] = modifiedBy;
    map['modificationDate'] = modificationDate;
    return map;
  }

}