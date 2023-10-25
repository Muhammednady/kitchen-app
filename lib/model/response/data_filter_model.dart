class DataFilterModel {
  DataFilterModel({
    this.message,
    this.data,
    this.isSucsseded,
    this.status,
  });

  DataFilterModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataFilter.fromJson(v));
      });
    }
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }

  String? message;
  List<DataFilter>? data;
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

class DataFilter {
  DataFilter({
    this.clientFileId,
    this.createdBy,
    this.createdByUserName,
    this.creationDate,
    this.client,
    this.fileTypeId,
    this.fileTypeName,
    this.finalStatusId,
    this.finalStatusName,
    this.contractDate,
  });

  DataFilter.fromJson(dynamic json) {
    clientFileId = json['clientFileId'];
    createdBy = json['createdBy'];
    createdByUserName = json['createdByUserName'];
    creationDate = json['creationDate'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    fileTypeId = json['fileTypeId'];
    fileTypeName = json['fileTypeName'];
    finalStatusId = json['finalStatusId'];
    finalStatusName = json['finalStatusName'];
    contractDate = json['contractDate'];
  }

  int? clientFileId;
  int? createdBy;
  String? createdByUserName;
  dynamic creationDate;
  Client? client;
  int? fileTypeId;
  String? fileTypeName;
  int? finalStatusId;
  String? finalStatusName;
  dynamic contractDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clientFileId'] = clientFileId;
    map['createdBy'] = createdBy;
    map['createdByUserName'] = createdByUserName;
    map['creationDate'] = creationDate;
    if (client != null) {
      map['client'] = client?.toJson();
    }
    map['fileTypeId'] = fileTypeId;
    map['fileTypeName'] = fileTypeName;
    map['finalStatusId'] = finalStatusId;
    map['finalStatusName'] = finalStatusName;
    map['contractDate'] = contractDate;
    return map;
  }
}

class Client {
  Client({
    this.clientId,
    this.clientName,
    this.mobile,
    this.email,
  });

  Client.fromJson(dynamic json) {
    clientId = json['clientId'];
    clientName = json['clientName'];
    mobile = json['mobile'];
    email = json['email'];
  }

  int? clientId;
  String? clientName;
  String? mobile;
  dynamic email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clientId'] = clientId;
    map['clientName'] = clientName;
    map['mobile'] = mobile;
    map['email'] = email;
    return map;
  }
}
