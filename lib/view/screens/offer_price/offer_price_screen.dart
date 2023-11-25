import 'package:Kitchen_system/enum/view_state.dart';
import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/helper/configs/app.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/base/custom_circle_progress_indecator.dart';
import 'package:Kitchen_system/view/base/custom_dialoge.dart';
import 'package:Kitchen_system/view/base/custom_drawer.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:Kitchen_system/view/base/custom_text_field.dart';
import 'package:Kitchen_system/view/base/drop_down_users.dart';
import 'package:Kitchen_system/view/base/drop_down_widget.dart';
import 'package:Kitchen_system/view/base/not_found.dart';
import 'package:Kitchen_system/view/screens/attachments/attachments_screen.dart';
import 'package:Kitchen_system/view/screens/edit_price_details/edit_price_details.dart';
import 'package:Kitchen_system/view/screens/followers/followers_screen.dart';
import 'package:Kitchen_system/view/screens/notes/notes_screen.dart';
import 'package:Kitchen_system/view/screens/offer_price/controller/offer_screen_controller.dart';
import 'package:Kitchen_system/view/screens/price_details/price_details_screen.dart';
import 'package:Kitchen_system/view/screens/status/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/addition_grid_view.dart';
import '../home/home_screen.dart';

class OfferPriceScreen extends StatelessWidget {
  const OfferPriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final controller = Get.put(OfferScreenController());
    controller.selected.value = 1.obs();
    AppSetting.init(context);
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(const HomeScreen());
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(
          controller: controller,
          scaffoldKey: scaffoldKey,
        ),
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
              child: Icon(Icons.menu, color: Theme.of(context).primaryColor)),
          centerTitle: true,
          title: Text("عرض الاسعار",
              style: cairoRegular.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL))),
        ),
        body: Obx(
          () => controller.state == ViewState.busy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppDimensions.space(Dimensions.heightSmall).sBH,
                      Row(
                        children: [
                          AppDimensions.space(Dimensions.heightSmall).sBW,
                          Text(
                            "النوع",
                            style: cairoRegular.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: AppDimensions.font(
                                    Dimensions.FONT_SIZE_EXTRA_SMALL)),
                          ),
                        ],
                      ),
                      AppDimensions.space(Dimensions.heightExtraSmall).sBH,
                      Row(
                        children: [
                          AppDimensions.space(Dimensions.heightSmall).sBW,
                          CustomButton(
                            width: AppDimensions.space(
                                Dimensions.FONT_SIZE_EXTRA_SMALL),
                            radius: 9,
                            onPressed: () {
                              if (controller.checkedValue.value == 0) {
                                showCustomSnackBar(
                                    "يجب اختيار نوع اولا", context);
                              } else if (controller.checkedValue.value == 1) {
                                CacheHelper.saveData(
                                    key: AppConstants.typeId,
                                    value: controller.checkedValue.value);
                                Get.to(() => const PriceDetailsScreen());
                              }
                            },
                            buttonText: "إضافة",
                            icon: Images.add,
                          ),
                        ],
                      ),
                      AdditionGridView(controller: controller),
                      Row(
                        children: [
                          AppDimensions.space(Dimensions.heightSmall).sBW,
                          Text(
                            "البحث",
                            style: cairoRegular.copyWith(
                                fontSize: AppDimensions.font(
                                    Dimensions.FONT_SIZE_EXTRA_SMALL)),
                          ),
                        ],
                      ),
                      const   Padding(
                        padding:  EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_SMALL,
                            horizontal: Dimensions.PADDING_SIZE_SMALL),
                        child: CustomTextField(
                          //onSubmit: (v) {},
                          isShowPrefixIcon: true,
                          prefixIconUrl: Images.search,
                        ),
                      ),
                      Obx(() => DropDownUsersWidget(
                            label: "المبيعات",
                            type: controller.userSelected.value,
                            list: controller.usersList,
                            onchange: (value) {
                              controller.userSelected.value = value!;
                              controller.userSelectedFilter.value =
                                  controller.userSelected.value.id!;
                              controller.getShortClient();
                            },
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => DropDownWidget(
                            label: "الحالة",
                            type: controller.itemSelected.value,
                            list: controller.itemList,
                            onchange: (value) {
                              controller.itemSelected.value = value!;
                              controller.itemSelectedFilter.value =
                                  controller.itemSelected.value.statusId!;
                              controller.getShortClient();
                            },
                          )),
                      Obx(() => controller.loading.value
                          ? const CustomCircularProgressIndicator()
                          : controller.datFilterList.isEmpty
                              ? const NotFound(
                                  label: "لا توجد معلومات",
                                )
                              : ListView.builder(
                                  itemCount: controller.datFilterList.length,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) => InkWell(
                                        onTap: () => Get.to(
                                          StatusScreen(
                                            id: controller.datFilterList[index]
                                                    .clientFileId ??
                                                0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            color: const Color(0xFFE6E6E6),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "الاسم / الرقم :",
                                                          style: cairoBold.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              fontSize: AppDimensions
                                                                  .font(Dimensions
                                                                      .FONT_SIZE_EXTRA_SMALL)),
                                                        ),
                                                        Text(
                                                          controller
                                                                  .datFilterList[
                                                                      index]
                                                                  .client
                                                                  ?.clientName ??
                                                              "",
                                                          style: cairoMedium.copyWith(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: AppDimensions
                                                                  .font(Dimensions
                                                                      .FONT_SIZE_EXTRA_SMALL)),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      controller
                                                              .datFilterList[
                                                                  index]
                                                              .contractDate ??
                                                          "",
                                                      style: cairoMedium.copyWith(
                                                          color: Colors.grey,
                                                          fontSize: AppDimensions
                                                              .font(Dimensions
                                                                  .FONT_SIZE_EXTRA_SMALL)),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "المبيعات :",
                                                          style: cairoBold.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              fontSize: AppDimensions
                                                                  .font(Dimensions
                                                                      .FONT_SIZE_EXTRA_SMALL)),
                                                        ),
                                                        Text(
                                                          controller
                                                                  .datFilterList[
                                                                      index]
                                                                  .createdByUserName ??
                                                              "",
                                                          style: cairoMedium.copyWith(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: AppDimensions
                                                                  .font(Dimensions
                                                                      .FONT_SIZE_EXTRA_SMALL)),
                                                        ),
                                                      ],
                                                    ),
                                                    Flexible(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "الحاله :",
                                                            style: cairoBold.copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: AppDimensions
                                                                    .font(Dimensions
                                                                        .FONT_SIZE_EXTRA_SMALL)),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              controller
                                                                      .datFilterList[
                                                                          index]
                                                                      .finalStatusName ??
                                                                  "",
                                                              style: cairoMedium.copyWith(
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                  color: Colors
                                                                      .black,
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
                                                AppDimensions.space(Dimensions
                                                        .heightExtraSmall)
                                                    .sBH,
                                                GridView.builder(
                                                    itemCount: controller
                                                        .labelsCard.length,
                                                    shrinkWrap: true,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            childAspectRatio:
                                                                5 / 2,
                                                            crossAxisCount: 3),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                                int i) =>
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  CustomButton(
                                                                onPressed: () {
                                                                  if (i == 1) {
                                                                    CacheHelper.saveData(
                                                                        key: AppConstants
                                                                            .typeId,
                                                                        value: controller
                                                                            .datFilterList[index]
                                                                            .fileTypeId);
                                                                    CacheHelper.saveData(
                                                                        key: AppConstants
                                                                            .clientId,
                                                                        value: controller
                                                                            .datFilterList[index]
                                                                            .client
                                                                            ?.clientId);
                                                                    Get.to(() =>
                                                                        EditPriceDetailsScreen(
                                                                          id: controller
                                                                              .datFilterList[index]
                                                                              .clientFileId,
                                                                        ));
                                                                  } else if (i ==
                                                                      2) {
                                                                    DialogUtils.showCustomDialog(
                                                                        context,
                                                                        onTap:
                                                                            () {
                                                                      controller.deleteOffer(
                                                                          context,
                                                                          id: controller
                                                                              .datFilterList[index]
                                                                              .clientFileId);
                                                                    },
                                                                        label:
                                                                            "هل تريد الحذف");
                                                                  } else if (i ==
                                                                      3) {
                                                                    Get.to(() =>
                                                                        FollowersScreen(
                                                                          clientFileId: controller
                                                                              .datFilterList[index]
                                                                              .clientFileId,
                                                                        ));
                                                                  } else if (i ==
                                                                      4) {
                                                                    Get.to(() =>
                                                                        AttachmentScreen(
                                                                          clientFileId: controller
                                                                              .datFilterList[index]
                                                                              .clientFileId,
                                                                        ));
                                                                  }else if (i==5){
                                                                    Get.to(() =>
                                                                       NotesScreen(clientFileId: controller
                                                                           .datFilterList[index]
                                                                           .clientFileId!,));
                                                                  }
                                                                  // Get.to(() =>
                                                                  //     controller
                                                                  //             .screensCard[
                                                                  //         index]);
                                                                  // controller.getDetails(
                                                                  //     id: controller
                                                                  //         .datFilterList[
                                                                  //             index]
                                                                  //         .clientFileId);
                                                                },
                                                                radius: 9,
                                                                buttonText:
                                                                    controller
                                                                        .labelsCard[i],
                                                                icon: controller
                                                                    .imagesCard[i],
                                                              ),
                                                            ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      )))
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
