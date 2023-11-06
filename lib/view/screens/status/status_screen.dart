import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/base/custom_drawer.dart';
import 'package:Kitchen_system/view/screens/status/controller/status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/configs/app_dimensions.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';
import '../../base/custom_circle_progress_indecator.dart';
import '../../base/custom_dialoge.dart';
import '../../base/not_found.dart';
import '../attachments/attachments_screen.dart';
import '../edit_price_details/edit_price_details.dart';
import '../followers/followers_screen.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final controller = Get.put(StatusController());
    controller.selected.value = 2.abs();
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(
          close: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState?.openEndDrawer();
            } else {
              scaffoldKey.currentState?.openDrawer();
            }
          },
          controller: controller,
          scaffoldKey: scaffoldKey),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState?.openEndDrawer();
            } else {
              scaffoldKey.currentState?.openDrawer();
            }
          },
          child: Icon(Icons.menu, color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        title: Text("الحالة",
            style: cairoRegular.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => controller.loading.value
              ? const CustomCircularProgressIndicator()
              : controller.dataList.isEmpty
                  ? const NotFound(
                      label: "لا توجد معلومات",
                    )
                  : ListView.builder(
                      itemCount: controller.dataList.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            color: const Color(0xFFE6E6E6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "الاسم / الرقم :",
                                        style: cairoBold.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: AppDimensions.font(
                                                Dimensions
                                                    .FONT_SIZE_EXTRA_SMALL)),
                                      ),
                                      Text(
                                        'Hesham',
                                        style: cairoMedium.copyWith(
                                            color: Colors.black,
                                            fontSize: AppDimensions.font(
                                                Dimensions
                                                    .FONT_SIZE_EXTRA_SMALL)),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '17/7/2023',
                                    style: cairoMedium.copyWith(
                                        color: Colors.grey,
                                        fontSize: AppDimensions.font(
                                            Dimensions.FONT_SIZE_EXTRA_SMALL)),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "المبيعات :",
                                        style: cairoBold.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: AppDimensions.font(
                                                Dimensions
                                                    .FONT_SIZE_EXTRA_SMALL)),
                                      ),
                                      Text(
                                        'hesham@gmail.com',
                                        style: cairoMedium.copyWith(
                                            color: Colors.black,
                                            fontSize: AppDimensions.font(
                                                Dimensions
                                                    .FONT_SIZE_EXTRA_SMALL)),
                                      ),
                                    ],
                                  ),
                                  AppDimensions.space(
                                          Dimensions.heightExtraSmall)
                                      .sBW,
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Text(
                                          "الحاله :",
                                          style: cairoBold.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL)),
                                        ),
                                        Flexible(
                                          child: Text(
                                            '${controller.dataList[index].defaultDesc}',
                                            style: cairoMedium.copyWith(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black,
                                                fontSize: AppDimensions.font(
                                                    Dimensions
                                                        .FONT_SIZE_EXTRA_SMALL)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AppDimensions.space(Dimensions.heightExtraSmall)
                                  .sBH,
                              GridView.builder(
                                itemCount: 6,
                                shrinkWrap: true,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 5 / 2,
                                        crossAxisCount: 3),
                                itemBuilder: (BuildContext context, int i) =>
                                    GestureDetector(
                                  onTap: () {
                                    if (i == 1) {
                                      Get.to(() => const EditPriceDetailsScreen(
                                            id: 2,
                                          ));
                                    } else if (i == 2) {
                                      DialogUtils.showCustomDialog(context,
                                          onTap: () {}, label: "هل تريد الحذف");
                                    } else if (i == 3) {
                                      Get.to(() => const FollowersScreen(
                                            clientFileId: 2,
                                          ));
                                    } else if (i == 4) {
                                      Get.to(() => const AttachmentScreen(
                                            clientFileId: 2,
                                          ));
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      controller.titles[i],
                                      style: cairoBold.copyWith(
                                          overflow: TextOverflow.ellipsis,
                                          color: Theme.of(context).primaryColor,
                                          fontSize: AppDimensions.font(
                                              Dimensions
                                                  .FONT_SIZE_EXTRA_SMALL)),
                                    ),
                                  ),
                                ),
                              )
                            ])),
                      ),
                    ),
        ),
      ),
    );
  }
}
