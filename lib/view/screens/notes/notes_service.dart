import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../helper/network/dio_integration.dart';
import '../../../helper/network/error_handler.dart';
import '../../../model/response/client_fileAttachment_model.dart';
import '../../../utill/app_constants.dart';

class NotesServices {
  final dio = DioUtilNew.dio;

  getFileAttachments({int? statusId, clientFileId}) async {
    try {
      final response = await dio!
          .get(AppConstants.getAllClientFileAttachment, queryParameters: {
        "statusId": statusId,
        "clientFileId": clientFileId,
      });
      if (response.statusCode == 200) {
        return ClientFileAttachmentModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  addNote({
    required int clientFileId,
    required  String attachment,
    required  String note,
  }) async {
    final response = await dio!.put(
      AppConstants.addNoteClientFile,
      queryParameters: {
        'clientFileId': clientFileId,
      },
      data: {
        'Attachment': attachment,
        'Note': note,
      },
    );
    if (response.statusCode == 200) {
      log('added');
    } else {
      HandleError.handleException(response: response.statusCode);
    }
  }
}
