import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/routes/app_route.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityController extends BaseController {
  static ConnectivityController to = Get.find();
  final connectionStatus = 0.obs;

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatus.value = _getStatusFromResult(result);
    });
    Future.delayed(const Duration(seconds: 3),(){
      if (CacheHelper.getData(key: AppConstants.token) == null) {
        Get.offAllNamed(AppRoute.signIn);
      } else if (differenceBetweenExpireNow() < 1) {
        Get.offAllNamed(AppRoute.signIn);
      } else {
        Get.offAllNamed(AppRoute.homeScreen);
      }
    });
  }

  int _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return 1;
      case ConnectivityResult.wifi:
        return 2;
      case ConnectivityResult.none:
        showDialogBox();
        return 0;
      default:
        return 0;
    }
  }

  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    connectionStatus.value = _getStatusFromResult(connectivityResult);
    return connectionStatus.value > 0;
  }

  int differenceBetweenExpireNow() {
    if (CacheHelper.getData(key: AppConstants.expireOn) != null) {
      DateTime expireDate =
          DateTime.parse(CacheHelper.getData(key: AppConstants.expireOn));
      DateTime now = DateTime.now();
      int diff = expireDate.difference(now).inHours;
      return diff;
    } else {
      return 0;
    }
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: Get.context!,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                var connectivityResult =
                    await Connectivity().checkConnectivity();
                connectionStatus.value =
                    _getStatusFromResult(connectivityResult);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
