import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../helper/network/dio_integration.dart';
import '../../../helper/network/error_handler.dart';
import '../../../model/body/error_model.dart';
import '../../../model/response/basic_response_model.dart';
import '../../../utill/app_constants.dart';
import '../home/home_screen.dart';

class ResetPasswordServices {
  final dio = DioUtilNew.dio;

  resetPassword({required String oldPassword,required String newPassword, context}) async {
    try {
      final response = await dio!
          .post(AppConstants.resetNewPassword, data: {"oldPassword": oldPassword, "newPassword": newPassword, });
      if (response.statusCode == 200) {
        Get.offAll(() => const HomeScreen());
        return BasicResponseModel.fromJson(response.data);
      } else {
        ErrorModel error = ErrorModel.fromJson(response.data);
        showCustomSnackBar(error.message.toString(), context);
        return HandleError.handleException(
            response: error.status, error: error.message);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
}
