import 'package:dio/dio.dart';
import 'package:Kitchen_system/helper/network/dio_integration.dart';
import 'package:Kitchen_system/helper/network/error_handler.dart';
import 'package:Kitchen_system/model/body/error_model.dart';
import 'package:Kitchen_system/model/response/user_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/screens/home/home_screen.dart';
import 'package:get/get.dart';

class LoginServices {
  final dio = DioUtilNew.dio;

  login({String? name, password}) async {
    try {
      final response = await dio!
          .post(AppConstants.login, data: {"name": name, "password": password});
      if (response.statusCode == 200) {
        Get.offAll(() => const HomeScreen());
        return UserModel.fromJson(response.data);
      } else {
        ErrorModel error = ErrorModel.fromJson(response.data);
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
