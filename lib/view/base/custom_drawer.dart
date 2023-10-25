import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/screens/home/controller/home_controller.dart';
import 'package:Kitchen_system/view/screens/offer_price/offer_price_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, this.close});

  final Function()? close;

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
              onPressed: close,
              icon: const Icon(Icons.clear, color: Colors.white, size: 35),
            ),
            AppDimensions.space(Dimensions.heightSmall).sBH,
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: HomeScreenController.to.labels.length,
                itemBuilder: (ctx, index) => Obx(() => GestureDetector(
                      onTap: () {
                        HomeScreenController.to.selected.value = index;
                        Get.to(() => HomeScreenController.to.screens[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        child: Container(
                          height: AppDimensions.space(2.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(27),
                              color: HomeScreenController.to.selected.value ==
                                      index
                                  ? Colors.white
                                  : Colors.transparent),
                          child: Row(
                            children: [
                              AppDimensions.space(Dimensions.heightSmall).sBW,
                              Image.asset(HomeScreenController.to.images[index],
                                  color:
                                      HomeScreenController.to.selected.value ==
                                              index
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                  width: AppDimensions.space(2)),
                              AppDimensions.space(Dimensions.heightSmall).sBW,
                              Expanded(
                                child: Text(
                                  HomeScreenController.to.labels[index],
                                  style: cairoBold.copyWith(
                                      color: HomeScreenController
                                                  .to.selected.value ==
                                              index
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
