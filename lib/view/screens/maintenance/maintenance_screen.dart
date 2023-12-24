import 'dart:developer';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../enum/view_state.dart';
import '../../../helper/cache_helper.dart';
import '../../../helper/configs/app.dart';
import '../../../helper/configs/app_dimensions.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../base/custom_circle_progress_indecator.dart';
import '../../base/custom_drawer.dart';
import '../../base/not_found.dart';
import '../../base/row_text_field.dart';
import 'maintenance_controller.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaintenanceController());
    controller.selected.value = 6.abs();
    bool isCustomerChanged = false;
    AppSetting.init(context);
    return WillPopScope(
      onWillPop: () async {
       // Get.offAll(const HomeScreen());
        return true;
      },
      child: Scaffold(
          key: controller.scaffoldKey,
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
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          20.sBH,
                          Expanded(
                            child: CustomRowTextField(
                              label: "الزبون",
                              isDisable: true,
                              controller: controller.clientController,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          Expanded(
                            child: CustomRowTextField(
                              label: "رقم",
                              type: TextInputType.number,
                              controller: controller.numberController,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          Expanded(
                            child: CustomRowTextField(
                              label: "العنوان",
                              type: TextInputType.text,
                              controller: controller.addressController,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          Expanded(
                            child: CustomRowTextField(
                              isDisable: true,
                              label: "التاريخ",
                              controller: controller.dateController,
                              onTap: () {
                                controller.selectDate(context);
                              },
                              // type: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: CustomRowTextField(
                              label: "طلب الصيانة",
                              type: TextInputType.text,
                              controller: controller.requestController,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          CustomButton(
                            buttonText: 'حفظ',
                            height: 40,
                            width: 100,
                            onPressed: () {
                              DateFormat originalDateFormat =
                                  DateFormat('MM/dd/yyyy');
                              DateTime originalDate = originalDateFormat
                                  .parse(controller.dateController.text);
                              DateFormat targetDateFormat =
                                  DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ');
                              String targetDateString =
                                  targetDateFormat.format(originalDate);
                              log(targetDateString);
                              controller.addMaintenance(
                                  clientId: CacheHelper.getData(key: AppConstants.clientId),
                                  note: controller.requestController.text,
                                  date: targetDateString);
                            },
                          ),
                          20.sBH,
                          Obx(
                            () => controller.loading.value
                                ? const CustomCircularProgressIndicator()
                                : controller.maintenanceList.isEmpty
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
                                                    'المستخدم',
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Expanded(
                                                  child: Text(
                                                    'طلب الصيانة',
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Expanded(
                                                  child: Text(
                                                    'التاريخ',
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Expanded(
                                                  child: Text(
                                                    'تاريخ التركيب',
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Expanded(
                                                  child: Text(
                                                    'حذف',
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
                                                    'مرفقات',
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            rows: controller.maintenanceList
                                                .map(((row) => DataRow(
                                                      color:
                                                          MaterialStateProperty
                                                              .all(Colors.grey
                                                                  .withOpacity(
                                                                      0.3)),
                                                      cells: <DataCell>[
                                                        DataCell(Text(
                                                          row.user!,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        )),
                                                        DataCell(Text(
                                                          row.note!,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        )),
                                                        DataCell(Text(
                                                          row.creationDate!
                                                              .substring(0, 10),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        )),
                                                        DataCell(Text(
                                                          row.installDate!
                                                              .substring(0, 10),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        )),
                                                        DataCell(Image.asset(
                                                          'assets/image/delete.png',
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
                  ),
          )),
    );
  }
}
