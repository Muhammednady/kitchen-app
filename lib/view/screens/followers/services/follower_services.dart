import 'dart:io';

import 'package:Kitchen_system/helper/network/dio_integration.dart';
import 'package:Kitchen_system/helper/network/error_handler.dart';
import 'package:Kitchen_system/model/response/follow_up_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class FollowerServices {
  final dio = DioUtilNew.dio;

  addClientFileFollowUp({int? clientFileId, String? note, File? file}) async {
    try {
      FormData formData = FormData.fromMap({
        "Note": note,
        "Attachment": MultipartFile.fromBytes(file!.readAsBytesSync(),
            filename: file.path.split("/").last)
      });
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
}
