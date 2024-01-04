class TopModel {
  String? message;
  List<Data>? data;
  bool? isSucsseded;
  int? status;

  TopModel({this.message, this.data, this.isSucsseded, this.status});

  TopModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['isSucsseded'] = isSucsseded;
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  int? clientFileId;
  Client? client;
  Type? type;
  TopColor? topColor;
  Type? panelType;
  TopColor? topHieght;
  TopColor? sinkHole;
  String? notes;

  Data(
      {this.id,
      this.clientFileId,
      this.client,
      this.type,
      this.topColor,
      this.panelType,
      this.topHieght,
      this.sinkHole,
      this.notes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientFileId = json['clientFileId'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    topColor =
        json['topColor'] != null ? TopColor.fromJson(json['topColor']) : null;
    panelType =
        json['panelType'] != null ? Type.fromJson(json['panelType']) : null;
    topHieght =
        json['topHieght'] != null ? TopColor.fromJson(json['topHieght']) : null;
    sinkHole =
        json['sinkHole'] != null ? TopColor.fromJson(json['sinkHole']) : null;
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['clientFileId'] = clientFileId;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (topColor != null) {
      data['topColor'] = topColor!.toJson();
    }
    if (panelType != null) {
      data['panelType'] = panelType!.toJson();
    }
    if (topHieght != null) {
      data['topHieght'] = topHieght!.toJson();
    }
    if (sinkHole != null) {
      data['sinkHole'] = sinkHole!.toJson();
    }
    data['notes'] = notes;
    return data;
  }
}

class Client {
  int? clientId;
  String? clientName;

  Client({
    this.clientId,
    this.clientName,
  });

  Client.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    clientName = json['clientName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientId'] = clientId;
    data['clientName'] = clientName;

    return data;
  }
}

class Type {
  String? defaultDesc;
  int? statusId;

  Type({
    this.defaultDesc,
    this.statusId,
  });

  Type.fromJson(Map<String, dynamic> json) {
    defaultDesc = json['defaultDesc'];

    statusId = json['statusId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['defaultDesc'] = defaultDesc;

    data['statusId'] = statusId;
    return data;
  }
}

class TopColor {
  String? defaultDesc;
  int? statusId;

  TopColor({
    this.defaultDesc,
    this.statusId,
  });

  TopColor.fromJson(Map<String, dynamic> json) {
    defaultDesc = json['defaultDesc'];

    statusId = json['statusId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['defaultDesc'] = defaultDesc;

    data['statusId'] = statusId;
    return data;
  }
}
