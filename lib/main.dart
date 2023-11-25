import 'dart:io';

import 'package:Kitchen_system/controller/language_controller.dart';
import 'package:Kitchen_system/controller/theme_controller.dart';
import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/theme/dark_theme.dart';
import 'package:Kitchen_system/theme/light_theme.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/utill/messages.dart';
import 'package:Kitchen_system/view/screens/home/home_screen.dart';
import 'package:Kitchen_system/view/screens/login/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_file.dart';

import 'helper/get_di.dart' as di;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
        final isValidHost = ["192.163.132.242"].contains(host); // <-- allow only hosts in array
        return isValidHost;
      });
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di.init();
  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp(
    languages: languages,
  ));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;

  const MyApp({Key? key, this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SplashController());
    return GetBuilder<LocalizationController>(builder: (localizeController) {
      return GetBuilder<ThemeController>(builder: (themeController) {
        return Portal(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: Get.key,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            ),
            theme: themeController.darkTheme ? dark : light,
            locale: localizeController.locale,
            translations: Messages(languages: languages!),
            fallbackLocale:
                Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode!),

            home: CacheHelper.getData(key: AppConstants.token) != null
                ? const HomeScreen()
                : const LoginScreen(),
            // getPages: AppScreen.screen,
            // initialRoute: AppRoute.splashScreen,
            // defaultTransition: Transition.topLevel,
            // transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      });
    });
  }
}
