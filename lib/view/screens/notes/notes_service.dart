import 'dart:developer';

import 'package:Kitchen_system/model/response/get_notes_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../helper/network/dio_integration.dart';
import '../../../helper/network/error_handler.dart';
import '../../../model/body/attachment_model.dart';
import '../../../model/response/client_fileAttachment_model.dart';
import '../../../utill/app_constants.dart';
import '../../base/custom_snackbar.dart';

class NotesServices {
  final dio = DioUtilNew.dio;

  getNotes({clientFileId}) async {
    try {
      final response =
          await dio!.get(AppConstants.getAllNotes, queryParameters: {
        "clientFileId": clientFileId,
      });
      if (response.statusCode == 200) {
        return GetAllNotesModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  addNote({
    required int clientFileId,
    List<AttachmentModel>? files
    // required  String attachment,
    ,
    required String note,
  }) async {
    FormData formData = FormData();

    if (files != null) {
      final image = await MultipartFile.fromFile(files[0].attachmentPath!.path);
      formData.files.add(
        MapEntry('Attachment', image),
      );
      formData.fields.add(MapEntry('Note', note));

    }

    final response = await dio!.put(
      AppConstants.addNoteClientFile,
      queryParameters: {
        'clientFileId': clientFileId,
      },
      data: formData,
    );
    if (response.statusCode == 200) {
      log('added');
    } else {
      HandleError.handleException(response: response.statusCode);
    }
  }


  deleteNote(BuildContext context,
      {required noteId}) async {
    try {
      final response = await dio!.delete(
          "${AppConstants.deleteNote}/$noteId");
      if (response.statusCode == 200) {
        if (context.mounted) {
          showCustomSnackBar("تم الحذف بنجاح", context,isError: false);
        }
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
}
