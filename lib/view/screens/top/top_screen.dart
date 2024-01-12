import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/screens/top/add_top_screen.dart';
import 'package:Kitchen_system/view/screens/top/top_controller.dart';
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
import '../../base/custom_circle_progress_indecator.dart';
import '../../base/custom_drawer.dart';
import '../../base/custom_snackbar.dart';
import '../../base/custom_text_field.dart';
import '../../base/drop_down_users.dart';
import '../../base/drop_down_widget.dart';
import '../../base/not_found.dart';
import '../home/home_screen.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({super.key});

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
                                Get.to(()=>const AddTopScreen());
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
                      // Row(
                      //   children: [
                      //     AppDimensions.space(Dimensions.heightSmall).sBW,
                      //     Text(
                      //       "البحث",
                      //       style: cairoRegular.copyWith(
                      //           fontSize: AppDimensions.font(
                      //               Dimensions.FONT_SIZE_EXTRA_SMALL)),
                      //     ),
                      //   ],
                      // ),
                      // const   Padding(
                      //   padding:  EdgeInsets.symmetric(
                      //       vertical: Dimensions.PADDING_SIZE_SMALL,
                      //       horizontal: Dimensions.PADDING_SIZE_SMALL),
                      //   child: CustomTextField(
                      //     //onSubmit: (v) {},
                      //     isShowPrefixIcon: true,
                      //     prefixIconUrl: Images.search,
                      //   ),
                      // ),
                      // Obx(() => DropDownUsersWidget(
                      //   label: "المبيعات",
                      //   type: controller.userSelected.value,
                      //   list: controller.usersList,
                      //   onchange: (value) {
                      //     controller.userSelected.value = value!;
                      //     controller.userSelectedFilter.value =
                      //     controller.userSelected.value.id!;
                      //     controller.getShortClient();
                      //   },
                      // )),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Obx(() => DropDownWidget(
                      //   label: "الحالة",
                      //   type: controller.itemSelected.value,
                      //   list: controller.itemList,
                      //   onchange: (value) {
                      //     controller.itemSelected.value = value!;
                      //     controller.itemSelectedFilter.value =
                      //     controller.itemSelected.value.statusId!;
                      //     controller.getShortClient();
                      //   },
                      // )),
                      const SizedBox(
                        height: 30,
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      Obx(
                        () => controller.loading.value
                            ? const CustomCircularProgressIndicator()
                            //     : controller.topList.isEmpty
                            //     ? const NotFound(
                            //   label: "لا توجد معلومات",
                            // )
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'نوع التوب',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'لون التوب',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'نوع البانيل',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'ارتفاع التوب',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'حفره المجلي',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'المبيعات',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'الزبون',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'تعديل',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'حذف',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: controller.topList
                                        .map(((row) => DataRow(
                                              color: MaterialStateProperty.all(
                                                  Colors.grey.withOpacity(0.3)),
                                              cells: <DataCell>[
                                                DataCell(Text(
                                                  row.type.defaultDesc,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                )),
                                                DataCell(Text(
                                                  row.topColor.defaultDesc,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                )),
                                                DataCell(Text(
                                                  row.panelType.defaultDesc,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                )),
                                                DataCell(Text(
                                                  row.topHieght.defaultDesc,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                )),
                                                DataCell(
                                                  Text(
                                                    row.sinkHole.defaultDesc,
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                DataCell(Text(
                                                  row.user.userName,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                )),
                                                DataCell(Text(
                                                  row.client.clientName,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                )),
                                                DataCell(InkWell(
                                                  onTap: () {
                                                    //Get.to(const ShortfallsScreen());
                                                  },
                                                  child: Image.asset(
                                                    Images.edit,
                                                    color: Colors.black,
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                )),
                                                DataCell(InkWell(
                                                  onTap: () {
                                                    controller.deleteTop(
                                                        context,
                                                        id: row.id);
                                                  },
                                                  child: Image.asset(
                                                    'assets/image/delete.png',
                                                    color: Colors.black,
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                )),
                                              ],
                                            )))
                                        .toList()),
                              ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
