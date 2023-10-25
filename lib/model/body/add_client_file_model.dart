class AddClientFileModel {
  AddClientFileModel({
      this.clientNeed, 
      this.clientId, 
      this.deviceNotes, 
      this.discount, 
      this.discountType, 
      this.contractStatusId, 
      this.fileTypeId, 
      this.additionaldiscount, 
      this.combinationPeriod, 
      this.accessoryDiscount, 
      this.withTax, 
      this.items,});

  AddClientFileModel.fromJson(dynamic json) {
    clientNeed = json['clientNeed'];
    clientId = json['clientId'];
    deviceNotes = json['deviceNotes'];
    discount = json['discount'];
    discountType = json['discountType'];
    contractStatusId = json['contractStatusId'];
    fileTypeId = json['fileTypeId'];
    additionaldiscount = json['additionaldiscount'];
    combinationPeriod = json['combinationPeriod'];
    accessoryDiscount = json['accessoryDiscount'];
    withTax = json['withTax'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
  String? clientNeed;
  int? clientId;
  String? deviceNotes;
  int? discount;
  int? discountType;
  int? contractStatusId;
  int? fileTypeId;
  int? additionaldiscount;
  int? combinationPeriod;
  int? accessoryDiscount;
  int? withTax;
  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clientNeed'] = clientNeed;
    map['clientId'] = clientId;
    map['deviceNotes'] = deviceNotes;
    map['discount'] = discount;
    map['discountType'] = discountType;
    map['contractStatusId'] = contractStatusId;
    map['fileTypeId'] = fileTypeId;
    map['additionaldiscount'] = additionaldiscount;
    map['combinationPeriod'] = combinationPeriod;
    map['accessoryDiscount'] = accessoryDiscount;
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
      this.width, 
      this.hieght, 
      this.length, 
      this.notes, 
      this.direction, 
      this.categoryId,});

  Items.fromJson(dynamic json) {
    itemId = json['itemId'];
    itemCount = json['itemCount'];
    itemPrice = json['itemPrice'];
    itemPriceAfterDiscount = json['itemPriceAfterDiscount'];
    itemTypeId = json['itemTypeId'];
    width = json['width'];
    hieght = json['hieght'];
    length = json['length'];
    notes = json['notes'];
    direction = json['direction'];
    categoryId = json['categoryId'];
  }
  int? itemId;
  int? itemCount;
  int? itemPrice;
  int? itemPriceAfterDiscount;
  int? itemTypeId;
  int? width;
  int? hieght;
  int? length;
  String? notes;
  int? direction;
  int? categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemId'] = itemId;
    map['itemCount'] = itemCount;
    map['itemPrice'] = itemPrice;
    map['itemPriceAfterDiscount'] = itemPriceAfterDiscount;
    map['itemTypeId'] = itemTypeId;
    map['width'] = width;
    map['hieght'] = hieght;
    map['length'] = length;
    map['notes'] = notes;
    map['direction'] = direction;
    map['categoryId'] = categoryId;
    return map;
  }

}