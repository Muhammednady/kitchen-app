import 'dart:developer';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../enum/view_state.dart';
import '../../../../helper/configs/app.dart';
import '../../../../helper/configs/app_dimensions.dart';
import '../../../../utill/dimensions.dart';
import '../../../../utill/images.dart';
import '../../../../utill/styles.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_circle_progress_indecator.dart';
import '../../../base/drop_down_widget.dart';
import '../../../base/not_found.dart';
import '../../../base/row_text_field.dart';
import '../shortfalls_controller.dart';

class AddShortfallScreen extends StatelessWidget {
  const AddShortfallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShortfallsController());
    AppSetting.init(context);

    return WillPopScope(
      onWillPop: () async {
        //  Get.offAll(const HomeScreen());
        return true;
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "اضافه نواقص",
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
                            child: Obx(() => DropDownWidget(
                              label: "سماكة التوب",
                              type: controller
                                  .thickeningSelected.value,
                              list: controller.thickeningList,
                              onchange: (value) {
                                controller.thickeningSelected
                                    .value = value!;
                              },
                            ))),
                        Expanded(
                          child: CustomRowTextField(
                            label: "ملاحظات",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomButton(
                              buttonText: 'تحميل مرفق',
                              height: 40,
                              width: 100,
                              onPressed: () {
                                controller.selectFile();
                              },
                            ),
                            CustomButton(
                              buttonText: 'حفظ',
                              height: 40,
                              width: 100,
                              onPressed: () {},
                            ),
                          ],
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
                                                  'الطول',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Expanded(
                                                child: Text(
                                                  'العرض',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Expanded(
                                                child: Text(
                                                  'الارتفاع',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Expanded(
                                                child: Text(
                                                  'ملاحظات',
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
                                                  'مرفقات',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ),
                                            ),
                                          ],
                                          rows: controller.maintenanceList
                                              .map(
                                                ((row) => DataRow(
                                                      color:
                                                          MaterialStateProperty
                                                              .all(Colors.grey
                                                                  .withOpacity(
                                                                      0.3)),
                                                      cells: <DataCell>[
                                                        //طول
                                                        DataCell(Text(
                                                          row.user!,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        )),
                                                        //عرض
                                                        DataCell(Text(
                                                          row.note!,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        )),
                                                        //ارتفاع
                                                        DataCell(Text(
                                                          row.creationDate!
                                                              .substring(0, 10),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        )),
                                                        //ملاحظات
                                                        DataCell(Text(
                                                          row.installDate!
                                                              .substring(0, 10),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                        )),
                                                        //حذف
                                                        DataCell(Image.asset(
                                                          'assets/image/delete.png',
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
                                                    )),
                                              )
                                              .toList()),
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
