import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/screens/production_requests/controllers/production_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../enum/view_state.dart';
import '../../../helper/configs/app.dart';
import '../../../helper/configs/app_dimensions.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../base/addition_grid_view.dart';
import '../../base/custom_button.dart';
import '../../base/custom_drawer.dart';
import '../../base/custom_snackbar.dart';
import '../../base/custom_text_field.dart';
import '../../base/drop_down_users.dart';
import '../../base/drop_down_widget.dart';
class ProductionRequestsScreen extends StatelessWidget {
  const ProductionRequestsScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final controller = Get.put(ProductionRequestsController());
    controller.selected.value = 5.abs();
    AppSetting.init(context);
    return Scaffold(
        key: scaffoldKey,
        drawer:CustomDrawer(controller: controller, scaffoldKey: scaffoldKey,),
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
          title: Text("طلبات الانتاج",
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
                          // CacheHelper.saveData(
                          //     key: AppConstants.typeId,
                          //     value: controller.checkedValue.value);
                        //  Get.to(() => const PriceDetailsScreen());
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
                // Obx(() => controller.loading.value
                //     ? const CustomCircularProgressIndicator()
                //     : controller.datFilterList.isEmpty
                //     ? const NotFound(
                //   label: "لا توجد معلومات",
                // )
                //     : ListView.builder(
                //     itemCount: controller.datFilterList.length,
                //     physics: const BouncingScrollPhysics(),
                //     shrinkWrap: true,
                //     itemBuilder: (_, index) => Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Card(
                //         color: const Color(0xFFE6E6E6),
                //         shape: RoundedRectangleBorder(
                //             borderRadius:
                //             BorderRadius.circular(9)),
                //         child: Column(
                //           children: [
                //             Row(
                //               mainAxisAlignment:
                //               MainAxisAlignment
                //                   .spaceBetween,
                //               children: [
                //                 Row(
                //                   children: [
                //                     Text(
                //                       "الاسم / الرقم :",
                //                       style: cairoBold.copyWith(
                //                           color: Theme.of(
                //                               context)
                //                               .primaryColor,
                //                           fontSize: AppDimensions
                //                               .font(Dimensions
                //                               .FONT_SIZE_EXTRA_SMALL)),
                //                     ),
                //                     Text(
                //                       controller
                //                           .datFilterList[
                //                       index]
                //                           .client
                //                           ?.clientName ??
                //                           "",
                //                       style: cairoMedium.copyWith(
                //                           color: Colors.black,
                //                           fontSize: AppDimensions
                //                               .font(Dimensions
                //                               .FONT_SIZE_EXTRA_SMALL)),
                //                     ),
                //                   ],
                //                 ),
                //                 Text(
                //                   controller
                //                       .datFilterList[
                //                   index]
                //                       .contractDate ??
                //                       "",
                //                   style: cairoMedium.copyWith(
                //                       color: Colors.grey,
                //                       fontSize: AppDimensions
                //                           .font(Dimensions
                //                           .FONT_SIZE_EXTRA_SMALL)),
                //                 ),
                //               ],
                //             ),
                //             Row(
                //               mainAxisAlignment:
                //               MainAxisAlignment
                //                   .spaceBetween,
                //               children: [
                //                 Row(
                //                   children: [
                //                     Text(
                //                       "المبيعات :",
                //                       style: cairoBold.copyWith(
                //                           color: Theme.of(
                //                               context)
                //                               .primaryColor,
                //                           fontSize: AppDimensions
                //                               .font(Dimensions
                //                               .FONT_SIZE_EXTRA_SMALL)),
                //                     ),
                //                     Text(
                //                       controller
                //                           .datFilterList[
                //                       index]
                //                           .createdByUserName ??
                //                           "",
                //                       style: cairoMedium.copyWith(
                //                           color: Colors.black,
                //                           fontSize: AppDimensions
                //                               .font(Dimensions
                //                               .FONT_SIZE_EXTRA_SMALL)),
                //                     ),
                //                   ],
                //                 ),
                //                 Flexible(
                //                   child: Row(
                //                     children: [
                //                       Text(
                //                         "الحاله :",
                //                         style: cairoBold.copyWith(
                //                             color: Theme.of(
                //                                 context)
                //                                 .primaryColor,
                //                             fontSize: AppDimensions
                //                                 .font(Dimensions
                //                                 .FONT_SIZE_EXTRA_SMALL)),
                //                       ),
                //                       Flexible(
                //                         child: Text(
                //                           controller
                //                               .datFilterList[
                //                           index]
                //                               .finalStatusName ??
                //                               "",
                //                           style: cairoMedium.copyWith(
                //                               overflow:
                //                               TextOverflow
                //                                   .ellipsis,
                //                               color: Colors
                //                                   .black,
                //                               fontSize: AppDimensions
                //                                   .font(Dimensions
                //                                   .FONT_SIZE_EXTRA_SMALL)),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             AppDimensions.space(Dimensions
                //                 .heightExtraSmall)
                //                 .sBH,
                //             GridView.builder(
                //                 itemCount: controller
                //                     .labelsCard.length,
                //                 shrinkWrap: true,
                //                 padding: const EdgeInsets
                //                     .symmetric(
                //                     horizontal: 10),
                //                 physics:
                //                 const BouncingScrollPhysics(),
                //                 gridDelegate:
                //                 const SliverGridDelegateWithFixedCrossAxisCount(
                //                     childAspectRatio:
                //                     5 / 2,
                //                     crossAxisCount: 3),
                //                 itemBuilder:
                //                     (BuildContext context,
                //                     int i) =>
                //                     Padding(
                //                       padding:
                //                       const EdgeInsets
                //                           .all(8.0),
                //                       child: CustomButton(
                //                         onPressed: () {
                //                           if (i == 1) {
                //                             CacheHelper.saveData(
                //                                 key: AppConstants
                //                                     .typeId,
                //                                 value: controller
                //                                     .datFilterList[
                //                                 index]
                //                                     .fileTypeId);
                //                             CacheHelper.saveData(
                //                                 key: AppConstants
                //                                     .clientId,
                //                                 value: controller
                //                                     .datFilterList[
                //                                 index]
                //                                     .client
                //                                     ?.clientId);
                //                             // Get.to(() =>
                //                             //     EditPriceDetailsScreen(
                //                             //       id: controller
                //                             //           .datFilterList[index]
                //                             //           .clientFileId,
                //                             //     ));
                //                           } else if (i ==
                //                               2) {
                //
                //
                //                             DialogUtils
                //                                 .showCustomDialog(
                //                                 context,
                //                                 onTap:
                //                                     () {
                //                                   controller.deleteOffer(
                //                                       context,
                //                                       id: controller
                //                                           .datFilterList[index]
                //                                           .clientFileId);
                //                                 }, label: "هل تريد الحذف");
                //                           } else if (i ==
                //                               3) {
                //                             Get.to(() =>
                //                                 FollowersScreen(
                //                                   clientFileId: controller
                //                                       .datFilterList[index]
                //                                       .clientFileId,
                //                                 ));
                //                           } else if (i ==
                //                               4) {
                //                             Get.to(() =>
                //                                 AttachmentScreen(
                //                                   clientFileId: controller
                //                                       .datFilterList[index]
                //                                       .clientFileId,
                //                                 ));
                //                           }
                //                           // Get.to(() =>
                //                           //     controller
                //                           //             .screensCard[
                //                           //         index]);
                //                           // controller.getDetails(
                //                           //     id: controller
                //                           //         .datFilterList[
                //                           //             index]
                //                           //         .clientFileId);
                //                         },
                //                         radius: 9,
                //                         buttonText: controller
                //                             .labelsCard[i],
                //                         icon: controller
                //                             .imagesCard[i],
                //                       ),
                //                     ))
                //           ],
                //         ),
                //       ),
                //     )))
              ],
            ),
          ),
        ));
  }
}
