import 'package:Kitchen_system/helper/network/dio_integration.dart';
import 'package:Kitchen_system/helper/network/error_handler.dart';
import 'package:Kitchen_system/model/body/attachment_model.dart';
import 'package:Kitchen_system/model/response/client_fileAttachment_model.dart';
import 'package:Kitchen_system/model/response/status_category_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AttachmentService {
  final dio = DioUtilNew.dio;

  addAttachments({int? clientFileId, List<AttachmentModel>? files}) async {
    FormData formData = FormData.fromMap({});

    for (int i = 0; i < files!.length; i++) {
      final fileBytes = await files[i].attachmentPath!.readAsBytes();
      final file = MultipartFile.fromBytes(fileBytes,
          filename: files[i].attachmentPath!.path.split("/").last);

      formData.fields.addAll([
        MapEntry('model[$i].statusId', files[i].statusId.toString()),
      ]);
      formData.files.addAll([
        MapEntry('model[$i].AttachmentPath', file),
      ]);
    }
    final response = await dio!.put(AppConstants.addClientFileAttachment,
        data: formData, queryParameters: {"clientFileId": clientFileId});
    print(response.statusCode);
    print(response.data);
    if (response.statusCode == 200) {
      showCustomSnackBar("تمت الاضافه بنجاح", Get.context!, isError: false);
    } else {
      HandleError.handleException(response: response.statusCode);
    }
  }

  getStatusCategory() async {
    try {
      final response =
          await dio!.get("${AppConstants.getStatusCategoryById}100");
      if (response.statusCode == 200) {
        return StatusCategoryModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

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

  deleteFileAttachments(BuildContext context,
      {int? clientFileId, attachmentId}) async {
    try {
      final response = await dio!.delete(
          "${AppConstants.deleteClientFileAttachment}$clientFileId/$attachmentId");
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
