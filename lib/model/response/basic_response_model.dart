class BasicResponseModel {
  final String message;
  final int status;

  BasicResponseModel({
    required this.message,
    required this.status,
  });

  factory BasicResponseModel.fromJson(Map<String, dynamic> map) => BasicResponseModel(
        message: map['message'],
        status: map['status'],
      );
}
