import 'package:dio/dio.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:get/get.dart';

class HandleError {
  static handleException({int? response, String? error}) {
    switch (response) {
      case 400:
        showCustomSnackBar(
            isError: true, error ??= AppConstants.sendFailure.tr, Get.context!);
        break;
      case 401:
        showCustomSnackBar(
            isError: true, AppConstants.unauthorized.tr, Get.context!);
        break;
      case 404:
        showCustomSnackBar(
            isError: true, AppConstants.notFoundUrl.tr, Get.context!);
        break;
      case 403:
        showCustomSnackBar(
            isError: true, AppConstants.notHasAuthorized.tr, Get.context!);
        break;
      case 500:
        showCustomSnackBar(
            isError: true, AppConstants.serverFailure.tr, Get.context!);
        break;
      case 502:
        showCustomSnackBar(
            isError: true, AppConstants.serverFailure.tr, Get.context!);
        break;
    }
  }

static handleExceptionDio(DioErrorType dioExceptionType) {
  switch (dioExceptionType) {
    case DioErrorType.connectTimeout:
      showCustomSnackBar(isError: true, 'connection timeout', Get.context!);
      break;
    case DioErrorType.sendTimeout:
      showCustomSnackBar(isError: true, 'send timeout', Get.context!);
      break;
    case DioErrorType.receiveTimeout:
      showCustomSnackBar(isError: true, 'receive timeout', Get.context!);
      break;
    case DioErrorType.response:
      // TODO: Handle this case.
      break;
    case DioErrorType.cancel:
      showCustomSnackBar(isError: true, 'request cancelled', Get.context!);
      break;
    case DioErrorType.other:
      showCustomSnackBar(isError: true, 'unknown', Get.context!);
      break;
  }
}
}
