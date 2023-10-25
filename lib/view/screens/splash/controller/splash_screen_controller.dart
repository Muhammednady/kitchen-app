import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/screens/home/home_screen.dart';
import 'package:Kitchen_system/view/screens/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      if (CacheHelper.getData(key: AppConstants.token) == null) {
        Get.offAll(const LoginScreen());
      } else if (differenceBetweenExpireNow() < 1) {
        Get.offAll(const LoginScreen());
      } else {
        Get.offAll(const HomeScreen());
      }
    });
  }

  int differenceBetweenExpireNow() {
    if (CacheHelper.getData(key: AppConstants.expireOn) != null) {
      DateTime expireDate =
          DateTime.parse(CacheHelper.getData(key: AppConstants.expireOn));
      DateTime now = DateTime.now();
      int diff = expireDate.difference(now).inHours;
      print(diff);
      return diff;
    } else {
      return 0;
    }
  }
}
