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
            ),
            body: Obx(
              () => controller.state == ViewState.busy
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "تفاصيل الطلب",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "ملف طلب",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Obx(() =>
                                          controller.path.value == ""
                                              ? Image.asset(
                                                  Images.placeholder,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  File(controller.path.value), fit: BoxFit.cover,)),
                                    ),
                                IconButton(
                                  icon: const Icon(Icons.upload,
                                      color: Colors.black, size: 35),
                                  onPressed: () {
                                    controller.selectFile();
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "ملاحظة",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Expanded(child: CustomTextField(
                                  onChanged: (value) {
                                    controller.note.value = value;
                                  },
                                ))
                              ],
                            ),
                          ),
                          20.sBH,
                          Obx(() => controller.loading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomButton(
                                  width: AppDimensions.space(10),
                                  buttonText: "اضافه",
                                  onPressed: () {
                                    controller.addFollowUp(context,
                                        clientFileId: clientFileId);
                                  },
                                )),
                          40.sBH,
                          Obx(() => controller.data.isEmpty
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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImage(
                                                  height: 120,
                                                  width: 120,
                                                  image:
                                                      "${AppConstants.baseurlImages}${controller.data[index].attachmentPath}"),
                                              Text(
                                                  "تاريخ الرفع:${DateConverter.isoStringToLocalDateOnly(controller.data[index].creationDate ?? "")}"),
                                              Text(
                                                  "الملاحظات:${controller.data[index].note}"),
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
