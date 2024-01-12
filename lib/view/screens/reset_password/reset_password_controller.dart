
import 'package:Kitchen_system/model/response/basic_response_model.dart';
import 'package:Kitchen_system/view/screens/reset_password/reset_password_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/base_controller.dart';
import '../../../helper/network/dio_integration.dart';
import '../../../model/valid_model.dart';
import '../../base/custom_snackbar.dart';

class ResetPasswordController extends BaseController {
  final services = ResetPasswordServices();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  final _oldPassword = Valid().obs;
  final _newPassword = Valid().obs;
  final _confirmNewPassword = Valid().obs;
  final _loading = false.obs;

  Valid get oldPassword => _oldPassword.value;

  Valid get newPassword => _newPassword.value;

  Valid get confirmNewPassword => _confirmNewPassword.value;

  bool get loading => _loading.value;

  checkPasswordIsValid(String password) {
    if (password.trim().length < 8) {
      _newPassword.value =
          Valid(error: "يجب ان يكون الرقم السرى اكبر من 8 احرف");
    } else {
      _newPassword.value = Valid(value: password);
    }
  }

  checkMatchValidation(val) {
    if (val.isEmpty) {
      return 'Empty';
    }
    if (val != newPasswordController.text) {
      return 'Not Match';
    } else {
      return null;
    }
  }

  resetPassword(context) async{
    try {
      if (_newPassword.value.isValid() && _oldPassword.value.isValid()& _confirmNewPassword.value.isValid()) {
        _loading.value = true;
        BasicResponseModel user = await services.resetPassword(
            oldPassword: oldPasswordController.text, newPassword: newPasswordController.text, context: context);

        oldPasswordController.clear();
        newPasswordController.clear();
        confirmNewPasswordController.clear();
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
