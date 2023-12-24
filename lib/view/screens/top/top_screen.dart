import 'package:Kitchen_system/view/screens/top/top_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../helper/configs/app.dart';
import '../../../helper/configs/app_dimensions.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';
import '../../base/custom_drawer.dart';
import '../home/home_screen.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TopController());
    controller.selected.value = 13.obs();
    AppSetting.init(context);

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(const HomeScreen());
        return true;
      },
      child: Scaffold(
        drawer: CustomDrawer(
          controller: controller,
          scaffoldKey: controller.scaffoldKey,
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                if (controller.scaffoldKey.currentState!.isDrawerOpen) {
                  controller.scaffoldKey.currentState?.openEndDrawer();
                } else {
                  controller.scaffoldKey.currentState?.openDrawer();
                }
              },
              child: Icon(Icons.menu, color: Theme.of(context).primaryColor)),
          centerTitle: true,
          title: Text(
            "التوب",
            style: cairoRegular.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL),
            ),
          ),
        ),
      ),
    );
  }
}
