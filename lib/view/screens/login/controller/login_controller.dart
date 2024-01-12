import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/helper/network/dio_integration.dart';
import 'package:Kitchen_system/model/response/user_model.dart';
import 'package:Kitchen_system/model/valid_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:Kitchen_system/view/screens/login/services/login_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final services = LoginServices();
  final _email = Valid().obs;
  final _password = Valid().obs;
  final _loading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Valid get email => _email.value;

  Valid get password => _password.value;

  bool get loading => _loading.value;

  checkPasswordIsValid(String password) {
    if (password.trim().length < 8) {
      _password.value = Valid(error: "يجب ان يكون الرقم السرى اكبر من 8 احرف");
    } else {
      _password.value = Valid(value: password);
    }
  }

  checkEmailIsValid(String mail) {
    if (mail.trim().length < 8) {
      _email.value = Valid(error: "يجب ان يكون البريد اكبر من 8 احرف");
    } else {
      _email.value = Valid(value: mail);
    }
  }

  login(BuildContext context) async {
    try {
      if (_email.value.isValid() && _password.value.isValid()) {
        _loading.value = true;
        UserModel user = await services.login(
            name: _email.value.value, password: _password.value.value);
        CacheHelper.saveData(
            key: AppConstants.expireOn, value: user.data!.expiresOn);
        CacheHelper.saveData(key: AppConstants.token, value: user.data!.token);
        emailController.clear();
        passwordController.clear();
        DioUtilNew.setDioAgain();
        _loading.value = false;
      } else {
        _loading.value = false;
        showCustomSnackBar("تأكد من كتابه المعلومات بشكل صحيح", context);
      }
    } catch (e) {
      _loading.value = false;
    }
  }
}
