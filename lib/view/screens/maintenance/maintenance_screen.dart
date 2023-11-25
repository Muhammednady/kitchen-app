import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
import '../production_requests/controllers/production_request_controller.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final controller = Get.put(ProductionRequestsController());
    controller.selected.value = 5.abs();
    AppSetting.init(context);
    return WillPopScope( onWillPop: () async {
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
            title: Text("الصيانة",
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
                  const  Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: Dimensions.PADDING_SIZE_SMALL,
                        horizontal: Dimensions.PADDING_SIZE_SMALL),
                    child: CustomTextField(
                    //  onSubmit: (v) {},
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
                  const SizedBox(
                    height: 30,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  Obx(
                        () => controller.loading.value
                        ? const CustomCircularProgressIndicator()
                        : controller.datFilterList.isEmpty
                        ? const NotFound(
                      label: "لا توجد معلومات",
                    )
                        : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'المبيعات',
                                  style: TextStyle(
                                      fontStyle:
                                      FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'اسم الزبون',
                                  style: TextStyle(
                                      fontStyle:
                                      FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'نوع الطلب',
                                  style: TextStyle(
                                      fontStyle:
                                      FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'تاريخ الانشاء',
                                  style: TextStyle(
                                      fontStyle:
                                      FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'تعديل',
                                  style: TextStyle(
                                      fontStyle:
                                      FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'طباعة',
                                  style: TextStyle(
                                      fontStyle:
                                      FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'الحالة',
                                  style: TextStyle(
                                      fontStyle:
                                      FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'المرافقات',
                                  style: TextStyle(
                                      fontStyle:
                                      FontStyle.italic),
                                ),
                              ),
                            ),
                          ],
                          rows: controller.datFilterList
                              .map(((row) => DataRow(
                            color: MaterialStateProperty
                                .all(Colors.grey
                                .withOpacity(0.3)),
                            cells: <DataCell>[
                              DataCell(Text(
                                row.createdByUserName!,
                                style: const TextStyle(
                                    fontSize: 20),
                              )),
                              DataCell(Text(
                                row.client!.clientName!,
                                style: const TextStyle(
                                    fontSize: 20),
                              )),
                              DataCell(Text(
                                row.fileTypeName!,
                                style: const TextStyle(
                                    fontSize: 20),
                              )),
                              DataCell(Text(
                                row.creationDate!
                                    .substring(0, 10),
                                style: const TextStyle(
                                    fontSize: 20),
                              )),
                              DataCell(Image.asset(
                                Images.editIcons,
                                color: Colors.black,
                                height: 30,
                                width: 30,
                              )),
                              DataCell(Image.asset(
                                Images.print,
                                color: Colors.black,
                                height: 30,
                                width: 30,
                              )),
                              DataCell(Text(
                                row.finalStatusName!,
                                style: const TextStyle(
                                    fontSize: 20),
                              )),
                              DataCell(Image.asset(
                                Images.contract,
                                color: Colors.black,
                                height: 30,
                                width: 30,
                              )),
                            ],
                          )))
                              .toList()),
                    ),

                  ),
                ],
              ),
            ),
          )),
    );
  }
}
