
class MyBasicResponseModel {
  final String message;
  final int status;
  final dynamic data;
  final bool isSucceeded;
/*
{
  "message": "Sucssed",
  "data": null,
  "isSucsseded": true,
  "status": 200
}
 */
  MyBasicResponseModel({
    required this.message,
    required this.status,
    required this.isSucceeded,
    required this.data
  });

  factory MyBasicResponseModel.fromJson(Map<String, dynamic> map) => MyBasicResponseModel(
      message: map['message'],
      status: map['status'],
      isSucceeded: map['isSucsseded'],
      data: map['data'] !=null ? map['data']: null

  );
}
