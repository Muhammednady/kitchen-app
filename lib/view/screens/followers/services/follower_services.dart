import 'dart:io';

import 'package:Kitchen_system/helper/network/dio_integration.dart';
import 'package:Kitchen_system/helper/network/error_handler.dart';
import 'package:Kitchen_system/model/response/follow_up_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../model/body/attachment_model.dart';

class FollowerServices {
  final dio = DioUtilNew.dio;

  addClientFileFollowUp(
      {int? clientFileId, String? note, List<AttachmentModel>? files}) async {
    try {
      FormData formData = FormData();
      if (files != null) {
        final image =
            await MultipartFile.fromFile(files[0].attachmentPath!.path);
        formData.files.add(
          MapEntry('Attachment', image),
        );
        formData.fields.add(MapEntry('Note', note!));
      }
      final response = await dio!.put(AppConstants.addClientFileFollowUp,
          queryParameters: {"clientFileId": clientFileId}, data: formData);
      if (response.statusCode == 200) {
        showCustomSnackBar("تمت الاضافه بنجاح", Get.context!, isError: false);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  getFollowUp({int? clientFileId}) async {
    try {
      final response = await dio!.get(AppConstants.getAllFollowUp,
          queryParameters: {"clientFileId": clientFileId});
      if (response.statusCode == 200) {
        return FollowUpModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  deleteFollowUp(
      {required BuildContext context, required int followUpId}) async {
    try {
      final response =
          await dio!.delete("${AppConstants.deleteFollowUp}/$followUpId");
      if (response.statusCode == 200) {
        if (context.mounted) {
          showCustomSnackBar("تم الحذف بنجاح", context, isError: false);
        }
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
}
