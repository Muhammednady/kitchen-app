import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/base_controller.dart';
import '../../../model/valid_model.dart';

class ResetPasswordController extends BaseController {
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
}
