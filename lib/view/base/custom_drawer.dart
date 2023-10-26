import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/screens/home/controller/home_controller.dart';
import 'package:Kitchen_system/view/screens/offer_price/offer_price_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer(
      {super.key,
      this.close,
      required this.controller,
      required this.scaffoldKey});

  late GlobalKey<ScaffoldState> scaffoldKey;

  final Function()? close;
  late var controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppDimensions.space(Dimensions.heightSmall).sBH,
            IconButton(
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState?.openEndDrawer();
                } else {
                  scaffoldKey.currentState?.openDrawer();
                }
              },
              icon: const Icon(Icons.clear, color: Colors.white, size: 35),
            ),
            AppDimensions.space(Dimensions.heightSmall).sBH,
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.labelsList.length,
                itemBuilder: (ctx, index) => Obx(() => GestureDetector(
                      onTap: () {
                        controller.selected.value = index;
                        controller.selected.value = index;
                        scaffoldKey.currentState?.openEndDrawer();
                        Get.to(controller.screens[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        child: Container(
                          height: AppDimensions.space(2.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(27),
                              color: controller.selected.value == index
                                  ? Colors.white
                                  : Colors.transparent),
                          child: Row(
                            children: [
                              AppDimensions.space(Dimensions.heightSmall).sBW,
                              Image.asset(controller.images[index],
                                  color: controller.selected.value == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                  width: AppDimensions.space(2)),
                              AppDimensions.space(Dimensions.heightSmall).sBW,
                              Expanded(
                                child: Text(
                                  controller.labelsList[index],
                                  style: cairoBold.copyWith(
                                      color: controller.selected.value == index
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      fontSize: AppDimensions.font(
                                          Dimensions.FONT_SIZE_EXTRA_SMALL)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
