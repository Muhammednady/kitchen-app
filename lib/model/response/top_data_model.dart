class TopDataModel {
  String? message;
  TopData? data;
  bool? isSucsseded;
  int? status;

  TopDataModel({this.message, this.data, this.isSucsseded, this.status});

  TopDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? TopData.fromJson(json['data']) : null;
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['isSucsseded'] = isSucsseded;
    data['status'] = status;
    return data;
  }
}

class TopData {
  Type? type;
  Type? topColor;
  Type? panelType;
  Type? topHieght;
  Type? sinkHole;

  TopData(
      {this.type,
        this.topColor,
        this.panelType,
        this.topHieght,
        this.sinkHole});

  TopData.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    topColor =
    json['topColor'] != null ? Type.fromJson(json['topColor']) : null;
    panelType =
    json['panelType'] != null ? Type.fromJson(json['panelType']) : null;
    topHieght =
    json['topHieght'] != null ? Type.fromJson(json['topHieght']) : null;
    sinkHole =
    json['sinkHole'] != null ? Type.fromJson(json['sinkHole']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    return data;
  }
}

class Type {
  int? statusCategoryId;
  String? defaultDesc;
  List<Statuses>? statuses;

  Type({this.statusCategoryId, this.defaultDesc, this.statuses});

  Type.fromJson(Map<String, dynamic> json) {
    statusCategoryId = json['statusCategoryId'];
    defaultDesc = json['defaultDesc'];
    if (json['statuses'] != null) {
      statuses = <Statuses>[];
      json['statuses'].forEach((v) {
        statuses!.add(Statuses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCategoryId'] = statusCategoryId;
    data['defaultDesc'] = defaultDesc;
    if (statuses != null) {
      data['statuses'] = statuses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Statuses {
  String? defaultDesc;
  String? description;
  String? descriptionEn;
  int? statusId;
  double? price;

  Statuses(
      {this.defaultDesc,
        this.description,
        this.descriptionEn,
        this.statusId,
        this.price});

  Statuses.fromJson(Map<String, dynamic> json) {
    defaultDesc = json['defaultDesc'];
    description = json['description'];
    descriptionEn = json['descriptionEn'];
    statusId = json['statusId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['defaultDesc'] = defaultDesc;
    data['description'] = description;
    data['descriptionEn'] = descriptionEn;
    data['statusId'] = statusId;
    data['price'] = price;
    return data;
  }
}

class Status {
  String? defaultDesc;
  String? description;
  int? statusId;
  double? price;

  Status(
      {this.defaultDesc,
        this.description,
        this.statusId,
        this.price});

  Status.fromJson(Map<String, dynamic> json) {
    defaultDesc = json['defaultDesc'];
    description = json['description'];
    statusId = json['statusId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['defaultDesc'] = defaultDesc;
    data['description'] = description;
    data['statusId'] = statusId;
    data['price'] = price;
    return data;
  }
}
