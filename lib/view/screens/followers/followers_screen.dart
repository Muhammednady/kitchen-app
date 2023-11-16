import 'dart:developer';
import 'dart:io';

import 'package:Kitchen_system/enum/view_state.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/helper/date_convert.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/base/custom_image.dart';
import 'package:Kitchen_system/view/base/custom_text_field.dart';
import 'package:Kitchen_system/view/base/not_found.dart';
import 'package:Kitchen_system/view/screens/followers/controller/follower_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_dialoge.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key, this.clientFileId});

  final int? clientFileId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FollowerController(id: clientFileId));
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
              )),
          title: const Text("المتابعات",
              style: TextStyle(fontSize: 20, color: Colors.black)),
          actions: [IconButton(
            onPressed: () async {
              DialogUtils.showCustomDialog(
                context,
                actionButtonText: 'الغاء',
                leadingButtonLabel: 'اضافة',
                body: Column(
                  children: [
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomTextField(
                          maxLines: 4,
                          hintText: 'اضافة متابعة',
                          controller: controller.followUpController,
                          validatorMessage: 'لا يجب ان تكون الملاحظة فارغة',
                          //  errorLabel: 'لا يجب ان تكون الملاحظة فارغة',
                        ),
                      ),
                    ),
                    20.sBH,
                    SizedBox(
                      width: 180,
                      child: TextButton(
                        style:
                        TextButton.styleFrom(side: const BorderSide()),
                        onPressed: () {
                          controller.selectFile();
                        },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "اضافة مرفق",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                            Icon(Icons.upload,
                                color: Colors.black, size: 30),
                          ],
                        ),
                      ),
                    ),
                    10.sBH,
                    SizedBox(
                      height: controller.files.isEmpty ? 0 : 100,
                      child: Obx(() => controller.files.isEmpty
                          ? const SizedBox()
                          : Container(
                        margin: const EdgeInsets.all(4),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: Image.file(
                          File(
                            controller.files[0].path,
                          ),
                          fit: BoxFit.cover,
                        ),
                      )),
                    ),
                    20.sBH,

                  ],
                ),
                onTap: (){
                  if (controller.formKey.currentState!
                      .validate()) {
                    log(controller.followUpController.text);
                    controller.addFollowUp(context,
                        clientFileId: clientFileId,
                        note:
                        controller.followUpController.text);
                  }
                }

              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),],
        ),
        body: Obx(
          () => controller.state == ViewState.busy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        // const Text(
                        //   "تفاصيل المرفق",
                        //   style: TextStyle(color: Colors.black, fontSize: 18),
                        // ),

                        20.sBH,
                        // Obx(() => DropDownWidget(
                        //       label: "تصنيف الملف",
                        //       type: controller.categoryFilterSelected.value,
                        //       list: controller.categories,
                        //       onchange: (value) {
                        //         controller.categoryFilterSelected.value =
                        //             value!;
                        //         controller.filterData(
                        //             statusId: controller
                        //                 .categoryFilterSelected
                        //                 .value
                        //                 .statusId,
                        //             clientFileId: clientFileId);
                        //       },
                        //     )),
                        Obx(
                          () => controller.loadingAttachment.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : controller.data.isEmpty
                                  ? const NotFound(label: "لا توجد معلومات")
                                  : ListView.builder(
                                      itemCount: controller.data.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          elevation: 1,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // CustomImage(
                                                //     height: 120,
                                                //     width: 120,
                                                //     image:
                                                //         "${AppConstants.baseurlImages}${controller.attachmentsFilter[index].attachmentPath}"),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          "الاسم: ${controller.data[index].createdBy ?? ""}"),
                                                      const Spacer(),
                                                      Text(
                                                          "التاريخ: ${DateConverter.isoStringToLocalDateOnly(controller.data[index].creationDate!)}"),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0),
                                                  child: Text(
                                                      "الملاحظة: ${controller.data[index].note}"),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CustomButton(
                                                        buttonText: "مرفق",
                                                        width: 80,
                                                        height: 30,
                                                        onPressed: () {
                                                          log(controller
                                                              .data[index]
                                                              .attachmentPath!);
                                                          DialogUtils
                                                              .showPhotoDialog(
                                                                  context:
                                                                      context,
                                                                  imgSrc:
                                                                      '${AppConstants.baseurlImages}${controller.data[index].attachmentPath!}');
                                                        },
                                                      ),
                                                      30.sBW,
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
                                                           controller.deleteFollowUp(context, followUpId: controller.data[index].id!, clientFieldId: clientFileId!);
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
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
