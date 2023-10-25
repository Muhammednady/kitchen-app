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
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:Kitchen_system/view/base/custom_text_field.dart';
import 'package:Kitchen_system/view/base/drop_down_users.dart';
import 'package:Kitchen_system/view/base/drop_down_widget.dart';
import 'package:Kitchen_system/view/base/not_found.dart';
import 'package:Kitchen_system/view/screens/attachments/attachments_screen.dart';
import 'package:Kitchen_system/view/screens/edit_price_details/edit_price_details.dart';
import 'package:Kitchen_system/view/screens/followers/followers_screen.dart';
import 'package:Kitchen_system/view/screens/offer_price/controller/offer_screen_controller.dart';
import 'package:Kitchen_system/view/screens/price_details/price_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferPriceScreen extends StatelessWidget {
  const OfferPriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final controller = Get.put(OfferScreenController());
    controller.selected.value= 1.obs();
    AppSetting.init(context);
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
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
                                  AppDimensions.space(Dimensions.heightSmall)
                                      .sBW,
                                  Image.asset(controller.images[index],
                                      color: controller.selected.value == index
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      width: AppDimensions.space(2)),
                                  AppDimensions.space(Dimensions.heightSmall)
                                      .sBW,
                                  Expanded(
                                    child: Text(
                                      controller.labelsList[index],
                                      style: cairoBold.copyWith(
                                          color: controller.selected.value ==
                                                  index
                                              ? Theme.of(context).primaryColor
                                              : Colors.white,
                                          fontSize: AppDimensions.font(
                                              Dimensions
                                                  .FONT_SIZE_EXTRA_SMALL)),
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
                      GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.labels.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2 / 0.7, crossAxisCount: 2),
                        itemBuilder: (_, index) => Obx(() => RadioListTile(
                              title: Text(controller.labels[index].label!),
                              value: controller.labels[index],
                              groupValue: controller.groupValue.value,
                              onChanged: (value) {
                                controller.groupValue.value = value!;
                                controller.checkedValue.value =
                                    controller.groupValue.value.id!;
                                controller.getShortClient();
                              },
                            )),
                      ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_SMALL,
                            horizontal: Dimensions.PADDING_SIZE_SMALL),
                        child: CustomTextField(
                          onSubmit: (v) {},
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
                                  itemBuilder: (_, index) => Padding(
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
                                                            color: Colors.black,
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
                                                            color: Colors.black,
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
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: AppDimensions
                                                                    .font(Dimensions
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
                                                            child: CustomButton(
                                                              onPressed: () {
                                                                if (i == 1) {
                                                                  CacheHelper.saveData(
                                                                      key: AppConstants
                                                                          .typeId,
                                                                      value: controller
                                                                          .datFilterList[
                                                                              index]
                                                                          .fileTypeId);
                                                                  CacheHelper.saveData(
                                                                      key: AppConstants
                                                                          .clientId,
                                                                      value: controller
                                                                          .datFilterList[
                                                                              index]
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
                                                                  DialogUtils
                                                                      .showCustomDialog(
                                                                          context,
                                                                          onTap:
                                                                              () {
                                                                    controller.deleteOffer(
                                                                        context,
                                                                        id: controller
                                                                            .datFilterList[index]
                                                                            .clientFileId);
                                                                  }, label: "هل تريد الحذف");
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
                                                              buttonText: controller
                                                                  .labelsCard[i],
                                                              icon: controller
                                                                  .imagesCard[i],
                                                            ),
                                                          ))
                                            ],
                                          ),
                                        ),
                                      )))
                    ],
                  ),
                ),
        ));
  }
}
