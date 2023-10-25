import 'package:Kitchen_system/helper/configs/app.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/base/custom_circle_progress_indecator.dart';
import 'package:Kitchen_system/view/base/custom_text_field.dart';
import 'package:Kitchen_system/view/screens/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    AppSetting.init(context);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AppDimensions.space(3).sBH,
              Text(
                "تسجيل الدخول",
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: Dimensions.FONT_SIZE_EXTRA_LARGE,
              //       vertical: Dimensions.FONT_SIZE_DEFAULT),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "الاسم",
              //         style: cairoMedium.copyWith(
              //             color: Theme.of(context).secondaryHeaderColor,
              //             fontSize: AppDimensions.font(
              //                 Dimensions.FONT_SIZE_EXTRA_SMALL)),
              //       ),
              //       CustomTextField(
              //         errorLabel: controller.email.error,
              //         onChanged: (value) {
              //           controller.checkEmailIsValid(value);
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    vertical: Dimensions.FONT_SIZE_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "البريد الالكتروني",
                      style: cairoMedium.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: AppDimensions.font(
                              Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    ),
                    Obx(() => CustomTextField(
                          controller: controller.emailController,
                          errorLabel: controller.email.error,
                          onChanged: (value) {
                            controller.checkEmailIsValid(value);
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
                      "الباسورد",
                      style: cairoMedium.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: AppDimensions.font(
                              Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    ),
                    Obx(() => CustomTextField(
                          controller: controller.passwordController,
                          errorLabel: controller.password.error,
                          onChanged: (value) {
                            controller.checkPasswordIsValid(value);
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
                          controller.login(context);
                        },
                        buttonText: "تسجيل",
                      ),
                    ))
            ],
          ),
        ),
      ),
    ));
  }
}
