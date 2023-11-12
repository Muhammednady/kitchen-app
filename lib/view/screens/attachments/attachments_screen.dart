import 'dart:io';

import 'package:Kitchen_system/enum/view_state.dart';
import 'package:Kitchen_system/helper/date_convert.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/base/custom_dialoge.dart';
import 'package:Kitchen_system/view/base/custom_image.dart';
import 'package:Kitchen_system/view/base/drop_down_widget.dart';
import 'package:Kitchen_system/view/base/not_found.dart';
import 'package:Kitchen_system/view/screens/attachments/controller/attachment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttachmentScreen extends StatelessWidget {
  const AttachmentScreen({super.key, this.clientFileId});

  final int? clientFileId;

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(AttachmentController(clientFileId: clientFileId));
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    DialogUtils.showCustomDialog(
                      context,
                      actionButtonText: 'الغاء',
                      leadingButtonLabel: 'اضافة',
                      body: Column(
                        children: [
                          Obx(() => DropDownWidget(
                            label: "تصنيف الملف",
                            type: controller.categorySelected.value,
                            list: controller.categories,
                            onchange: (value) {
                              controller.categorySelected.value = value!;
                            },
                          )),
                          20.sBH,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "لاضافة صورة انقر هنا:",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                               const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.upload,
                                      color: Colors.black, size: 35),
                                  onPressed: () {
                                    controller.selectFile();
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: Obx(
                                  () => controller.files.isEmpty
                                  ? const SizedBox()
                                  : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.files.length,
                                  itemBuilder: (_, index) => Container(
                                    margin: const EdgeInsets.all(4),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey)),
                                    child: Image.file(
                                      File(
                                        controller.files[index].path,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                          ),
                          20.sBH,
                        ],
                      ),
                      onTap: ()=> controller.addAttachments(
                          clientFileId: clientFileId),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
              title: const Text("المرفقات",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            body: Obx(
              () => controller.state == ViewState.busy
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          20.sBH,
                          Obx(() => DropDownWidget(
                                label: "تصنيف الملف",
                                type: controller.categoryFilterSelected.value,
                                list: controller.categories,
                                onchange: (value) {
                                  controller.categoryFilterSelected.value =
                                      value!;
                                  controller.filterData(
                                      statusId: controller
                                          .categoryFilterSelected
                                          .value
                                          .statusId,
                                      clientFileId: clientFileId);
                                },
                              )),
                          Obx(() => controller.loadingAttachment.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : controller.attachmentsFilter.isEmpty
                                  ? const NotFound(label: "لا توجد معلومات")
                                  : ListView.builder(
                                      itemCount:
                                          controller.attachmentsFilter.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (_, index) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                              elevation: 1,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomImage(
                                                      height: 120,
                                                      width: 120,
                                                      image:
                                                          "${AppConstants.baseurlImages}${controller.attachmentsFilter[index].attachmentPath}"),
                                                  Text(
                                                      "تاريخ الرفع:${DateConverter.isoStringToLocalDateOnly(controller.attachmentsFilter[index].creationDate ?? "")}"),
                                                  Text(
                                                      "التصنيف:${controller.attachmentsFilter[index].statusName}"),
                                                  Row(
                                                    children: [
                                                      CustomButton(
                                                        buttonText: "حذف",
                                                        width: 80,
                                                        height: 30,
                                                        onPressed: () {
                                                          DialogUtils
                                                              .showCustomDialog(
                                                                  context,
                                                                  label:
                                                                      "هل تريد الحذف ؟",
                                                                  onTap: () {
                                                            controller.deleteAttachment(
                                                                context,
                                                                attachmentId: controller
                                                                    .attachmentsFilter[
                                                                        index]
                                                                    .id,
                                                                clientFileId:
                                                                    clientFileId,
                                                                statusId: controller
                                                                    .categoryFilterSelected
                                                                    .value
                                                                    .statusId);
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )))
                        ],
                      ),
                    ),
            )));
  }
}
