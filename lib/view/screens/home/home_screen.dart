import 'package:Kitchen_system/helper/configs/app.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/screens/home/controller/home_controller.dart';
import 'package:Kitchen_system/view/screens/login/login_screen.dart';
import 'package:Kitchen_system/view/screens/notifications/notitfication_screen.dart';
import 'package:Kitchen_system/view/screens/reset_password/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/cache_helper.dart';
import '../../../utill/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    AppSetting.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leadingWidth: AppDimensions.space(6),
          leading: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.to(const NotificationScreen());
                },
                child: Image.asset(
                  Images.notificationIcon,
                  width: AppDimensions.space(2),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Get.to(()=>const  ResetPasswordScreen());
                  },
                  icon: const Icon(
                    Icons.lock_reset_rounded,
                    size: 32,
                  )),
            ],
          ),
          title: Text(
            "الصفحة الرئيسية",
            style: cairoBold.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL)),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 30),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.labels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 3 / 2),
          itemBuilder: (_, index) => Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (index == controller.labels.length - 1) {
                    CacheHelper.removeData(key: AppConstants.token);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (route) => false);
                  } else {
                    Get.to(() => controller.screens[index]);
                  }
                },
                child: Container(
                  width: AppDimensions.space(5),
                  height: AppDimensions.space(5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle),
                  child: Center(
                      child: Image.asset(
                    controller.images[index],
                    width: AppDimensions.space(1.8),
                    color: Theme.of(context).primaryColor,
                  )),
                ),
              ),
              Text(
                controller.labels[index],
                style: cairoRegular.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize:
                        AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
