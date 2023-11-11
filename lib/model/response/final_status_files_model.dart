class FinalStatusFilesModel {
  final String message;
  final int status;
  final List<FileModel> statusFiles;

  FinalStatusFilesModel({
    required this.message,
    required this.status,
    required this.statusFiles,
  });

  factory FinalStatusFilesModel.fromJson(Map<String, dynamic> map) =>
      FinalStatusFilesModel(
        message: map['message'],
        status: map['status'],
        statusFiles: map['data'] == null
            ? []
            : List.from(
                map['data'].map(
                  (e) => FileModel.fromJson(e),
                ),
              ),
      );
}

class FileModel {
  final String fromValue;
  final String toValue;
  final String notes;
  final String creationDate;
  final String createdBy;

  FileModel({
    required this.fromValue,
    required this.toValue,
    required this.notes,
    required this.creationDate,
    required this.createdBy,
  });

  factory FileModel.fromJson(Map<String, dynamic> map) => FileModel(
        fromValue: map['fromValue'],
        toValue: map['toValue'],
        notes: map['notes'],
        creationDate: map['creationDate'],
        createdBy: map['createdByUserName'],
      );
}
