import 'dart:developer';

class ClientPaymentModel {
  ClientPaymentModel({
    this.message,
    this.data,
    this.isSucsseded,
    this.status,
  });

  factory ClientPaymentModel.fromJson(Map<String, dynamic> json) {
    log('-------test-------te');
    return ClientPaymentModel(
        message: json['message'],
        data:
            json['data'] != null ? ClientPayment.fromJson(json['data']) : null,
        isSucsseded: json['isSucsseded'],
        status: json['status'],
      );
  }

  String? message;
  ClientPayment? data;
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
/*
"clientId": 1,
    "amount": 1604,
    "paied": 520,
    "remaining": 1084
 */

class ClientPayment {
  int? clientId;
  double? amount;
  double? paid;
  double? remaining;

  ClientPayment({
    this.paid,
    this.amount,
    this.clientId,
    this.remaining,
  });

  factory ClientPayment.fromJson(Map<String, dynamic> map) => ClientPayment(
        paid: map['paied'].toDouble(),
        amount: map['amount'].toDouble(),
        clientId: map['clientId'],
        remaining: map['remaining'].toDouble(),
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clientId'] = clientId;
    map['paied'] = paid;
    map['remaining'] = remaining;
    map['amount'] = amount;

    return map;
  }
}
