import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/screens/reset_password/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/configs/app.dart';
import '../../../helper/configs/app_dimensions.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../base/custom_button.dart';
import '../../base/custom_circle_progress_indecator.dart';
import '../../base/custom_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    AppSetting.init(context);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AppDimensions.space(3).sBH,
              Text(
                "تغيير كلمة المرور",
                style: cairoBold.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: AppDimensions.font(Dimensions.FONT_SIZE_DEFAULT)),
              ),
              AppDimensions.space(Dimensions.heightSmall).sBH,
              Image.asset(
                Images.login,
                width: AppDimensions.space(Dimensions.FONT_SIZE_DEFAULT),
                height: AppDimensions.space(Dimensions.FONT_SIZE_DEFAULT),
              ),
              AppDimensions.space(Dimensions.heightSmall).sBH,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    vertical: Dimensions.FONT_SIZE_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "كلمة المرور الحالية",
                      style: cairoMedium.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: AppDimensions.font(
                              Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    ),
                    Obx(() => CustomTextField(
                          controller: controller.oldPasswordController,
                          errorLabel: controller.oldPassword.error,
                          onChanged: (value) {
                            //controller.checkEmailIsValid(value);
                          },
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    vertical: Dimensions.FONT_SIZE_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "كلمة المرور الجديده",
                      style: cairoMedium.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: AppDimensions.font(
                              Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    ),
                    Obx(() => CustomTextField(
                          controller: controller.newPasswordController,
                          errorLabel: controller.newPassword.error,
                          onChanged: (value) {
                            controller.checkPasswordIsValid(value);
                          },
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    vertical: Dimensions.FONT_SIZE_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تأكيد المرور الجديده",
                      style: cairoMedium.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: AppDimensions.font(
                              Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    ),
                    Obx(() => CustomTextField(
                          controller: controller.confirmNewPasswordController,
                          errorLabel: controller.confirmNewPassword.error,
                          onChanged: (value) {
                            controller.checkMatchValidation(value);
                          },
                        )),
                  ],
                ),
              ),
              AppDimensions.space(Dimensions.heightSmall).sBH,
              Obx(() => controller.loading
                  ? const CustomCircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.FONT_SIZE_EXTRA_LARGE,
                      ),
                      child: CustomButton(
                        radius: 9,
                        onPressed: () {
                          controller.resetPassword(context);
                        },
                        buttonText: "حفظ",
                      ),
                    ))
            ],
          ),
        ),
      ),
    ));
  }
}
