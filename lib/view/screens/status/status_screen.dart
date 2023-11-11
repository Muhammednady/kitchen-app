import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/base/custom_drawer.dart';
import 'package:Kitchen_system/view/base/custom_text_field.dart';
import 'package:Kitchen_system/view/screens/status/controller/status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/configs/app_dimensions.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';
import '../../base/custom_circle_progress_indecator.dart';
import '../../base/drop_down_widget.dart';
import '../../base/not_found.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final controller = Get.put(StatusController());
    controller.selected.value = 2.abs();
    controller.getAllStatuses(id);

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
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text("الحالة",
            style: cairoRegular.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(() => DropDownWidget(
                  label: "الحالة",
                  type: controller.itemSelected.value,
                  list: controller.itemList,
                  onchange: (value) {
                    controller.itemSelected.value = value!;
                    controller.itemSelectedFilter.value =
                        controller.itemSelected.value.statusId!;
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomTextField(
                controller: controller.noteController,
                maxLines: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonText: 'حفظ',
                      onPressed: () {
                        controller.saveNewState(id: id);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'التاريخ :',
                                              style: cairoBold.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller
                                                  .dataList[index].creationDate
                                                  .substring(0, 10),
                                              style: cairoMedium.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'عدل بواسطة :',
                                              style: cairoBold.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller
                                                  .dataList[index].createdBy,
                                              style: cairoMedium.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'الحالة القديمة :',
                                              style: cairoBold.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller
                                                  .dataList[index].fromValue,
                                              overflow: TextOverflow.ellipsis,
                                              style: cairoMedium.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'الحالة الجديدة :',
                                              style: cairoBold.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller
                                                  .dataList[index].toValue,
                                              overflow: TextOverflow.ellipsis,
                                              style: cairoMedium.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'ملاحظات :',
                                              style: cairoBold.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller.dataList[index].notes,
                                              overflow: TextOverflow.ellipsis,
                                              style: cairoMedium.copyWith(
                                                fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                ),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  )),
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
