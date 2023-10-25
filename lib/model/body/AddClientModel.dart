class AddClientModel {
  AddClientModel({
      this.clientName, 
      this.email, 
      this.fax, 
      this.mobile, 
      this.tel1, 
      this.clientAddress,});

  AddClientModel.fromJson(dynamic json) {
    clientName = json['clientName'];
    email = json['email'];
    fax = json['fax'];
    mobile = json['mobile'];
    tel1 = json['tel1'];
    clientAddress = json['clientAddress'];
  }
  String? clientName;
  String? email;
  String? fax;
  String? mobile;
  String? tel1;
  String? clientAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clientName'] = clientName;
    map['email'] = email;
    map['fax'] = fax;
    map['mobile'] = mobile;
    map['tel1'] = tel1;
    map['clientAddress'] = clientAddress;
    return map;
  }

}