class ClientModel {
  ClientModel({
    this.message,
    this.data,
    this.isSucsseded,
    this.status,
  });

  ClientModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }

  String? message;
  Data? data;
  bool? isSucsseded;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['isSucsseded'] = isSucsseded;
    map['status'] = status;
    return map;
  }
}

class Data {
  Data({
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
    this.modificationDate,
    this.refClientId,
    this.clientStatusId,
    this.clientFiles,
    this.clientPayments,
  });

  Data.fromJson(dynamic json) {
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
    refClientId = json['refClientId'];
    clientStatusId = json['clientStatusId'];

    clientFiles = json['clientFiles'];

    clientPayments = json['clientPayments'];
  }

  int? clientId;
  String? clientName;
  int? clientNo;
  String? email;
  String? fax;
  String? mobile;
  String? tel1;
  String? clientAddress;
  int? createdBy;
  String? creationDate;
  dynamic modifiedBy;
  dynamic modificationDate;
  dynamic refClientId;
  dynamic clientStatusId;
  List<dynamic>? clientFiles;
  List<dynamic>? clientPayments;

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
    map['refClientId'] = refClientId;
    map['clientStatusId'] = clientStatusId;
    if (clientFiles != null) {
      map['clientFiles'] = clientFiles?.map((v) => v.toJson()).toList();
    }
    if (clientPayments != null) {
      map['clientPayments'] = clientPayments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
