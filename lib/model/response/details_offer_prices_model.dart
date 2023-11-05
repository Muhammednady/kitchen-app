class DetailsOfferPricesModel {
  DetailsOfferPricesModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  DetailsOfferPricesModel.fromJson(dynamic json) {
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
      this.clientFileId, 
      this.clientNeed, 
      this.createdBy, 
      this.createdByUserName, 
      this.creationDate, 
      this.modifiedby, 
      this.modificationDate, 
      this.client, 
      this.deviceNotes, 
      this.discount, 
      this.discountType, 
      this.contractStatusId, 
      this.fileTypeId, 
      this.fileTypeName, 
      this.additionaldiscount, 
      this.combinationPeriod, 
      this.accessoryDiscount, 
      this.allPrice, 
      this.withTax, 
      this.items,});

  Data.fromJson(dynamic json) {
    clientFileId = json['clientFileId'];
    clientNeed = json['clientNeed'];
    createdBy = json['createdBy'];
    createdByUserName = json['createdByUserName'];
    creationDate = json['creationDate'];
    modifiedby = json['modifiedby'];
    modificationDate = json['modificationDate'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    deviceNotes = json['deviceNotes'];
    discount = json['discount'];
    discountType = json['discountType'];
    contractStatusId = json['contractStatusId'];
    fileTypeId = json['fileTypeId'];
    fileTypeName = json['fileTypeName'];
    additionaldiscount = json['additionaldiscount'];
    combinationPeriod = json['combinationPeriod'];
    accessoryDiscount = json['accessoryDiscount'];
    allPrice = json['allPrice'];
    withTax = json['withTax'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }

  int? clientFileId;
  String? clientNeed;
  int? createdBy;
  String? createdByUserName;
  dynamic creationDate;
  dynamic modifiedby;
  dynamic modificationDate;
  Client? client;
  dynamic deviceNotes;
  dynamic discount;
  dynamic discountType;
  int? contractStatusId;
  int? fileTypeId;
  String? fileTypeName;
  int? additionaldiscount;
  dynamic combinationPeriod;
  dynamic accessoryDiscount;
  int? allPrice;
  int? withTax;
  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clientFileId'] = clientFileId;
    map['clientNeed'] = clientNeed;
    map['createdBy'] = createdBy;
    map['createdByUserName'] = createdByUserName;
    map['creationDate'] = creationDate;
    map['modifiedby'] = modifiedby;
    map['modificationDate'] = modificationDate;
    if (client != null) {
      map['client'] = client?.toJson();
    }
    map['deviceNotes'] = deviceNotes;
    map['discount'] = discount;
    map['discountType'] = discountType;
    map['contractStatusId'] = contractStatusId;
    map['fileTypeId'] = fileTypeId;
    map['fileTypeName'] = fileTypeName;
    map['additionaldiscount'] = additionaldiscount;
    map['combinationPeriod'] = combinationPeriod;
    map['accessoryDiscount'] = accessoryDiscount;
    map['allPrice'] = allPrice;
    map['withTax'] = withTax;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Items {
  Items({
      this.itemId, 
      this.itemCount, 
      this.itemPrice, 
      this.itemPriceAfterDiscount, 
      this.itemTypeId, 
      this.itemTypeName, 
      this.width, 
      this.hieght, 
      this.length, 
      this.notes, 
      this.direction, 
      this.categoryId, 
      this.categoryDesc, 
      this.itemName, 
      this.parentCategoryId, 
      this.parentCategory,});

  Items.fromJson(dynamic json) {
    itemId = json['itemId'];
    itemCount = json['itemCount'];
    itemPrice = json['itemPrice'];
    itemPriceAfterDiscount = json['itemPriceAfterDiscount'];
    itemTypeId = json['itemTypeId'];
    itemTypeName = json['itemTypeName'];
    width = json['width'];
    hieght = json['hieght'];
    length = json['length'];
    notes = json['notes'];
    direction = json['direction'];
    categoryId = json['categoryId'];
    categoryDesc = json['categoryDesc'];
    itemName = json['itemName'];
    parentCategoryId = json['parentCategoryId'];
    parentCategory = json['parentCategory'];
  }
  int? itemId;
  int? itemCount;
  dynamic itemPrice;
  dynamic itemPriceAfterDiscount;
  int? itemTypeId;
  dynamic itemTypeName;
  dynamic width;
  dynamic hieght;
  dynamic length;
  dynamic notes;
  dynamic direction;
  dynamic categoryId;
  dynamic categoryDesc;
  String? itemName;
  int? parentCategoryId;
  String? parentCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemId'] = itemId;
    map['itemCount'] = itemCount;
    map['itemPrice'] = itemPrice;
    map['itemPriceAfterDiscount'] = itemPriceAfterDiscount;
    map['itemTypeId'] = itemTypeId;
    map['itemTypeName'] = itemTypeName;
    map['width'] = width;
    map['hieght'] = hieght;
    map['length'] = length;
    map['notes'] = notes;
    map['direction'] = direction;
    map['categoryId'] = categoryId;
    map['categoryDesc'] = categoryDesc;
    map['itemName'] = itemName;
    map['parentCategoryId'] = parentCategoryId;
    map['parentCategory'] = parentCategory;
    return map;
  }

}

class Client {
  Client({
      this.clientId, 
      this.clientName, 
      this.mobile, 
      this.email,});

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