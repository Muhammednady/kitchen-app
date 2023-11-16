import 'dart:developer';
import 'dart:io';

import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/screens/notes/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../enum/view_state.dart';
import '../../../helper/configs/app_dimensions.dart';

import '../../../helper/date_convert.dart';
import '../../../utill/app_constants.dart';
import '../../base/custom_button.dart';
import '../../base/custom_dialoge.dart';
import '../../base/custom_image.dart';
import '../../base/custom_text_field.dart';
import '../../base/drop_down_widget.dart';
import '../../base/not_found.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({
    Key? key,
    required this.clientFileId,
  }) : super(key: key);
  final int clientFileId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController(
        //    clientFileId: clientFileId
        ));
    controller.getAllNotes(clientFileId: clientFileId);
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
              title: const Text("الملاحظات",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              actions: [
                IconButton(
                  onPressed: () async {
                    DialogUtils.showCustomDialog(
                      context,
                      actionButtonText: 'الغاء',
                      leadingButtonLabel: 'اضافة',
                      body: Column(
                        children: [
                          20.sBH,
                          Form(
                            key: controller.formKey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: CustomTextField(
                                maxLines: 4,
                                hintText: 'ادخل الملاحظة',
                                controller: controller.noteController,
                                validatorMessage: 'لا يجب ان تكون الملاحظة فارغة',
                                //  errorLabel: 'لا يجب ان تكون الملاحظة فارغة',
                              ),
                            ),
                          ),
                          20.sBH,
                          SizedBox(
                            width: 180,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  side: const BorderSide()),
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
                          // Obx(() => controller.loading.value
                          //     ? const Center(
                          //   child: CircularProgressIndicator(),
                          // )
                          //     : CustomButton(
                          //   width: AppDimensions.space(10),
                          //   buttonText: "اضافه",
                          //   onPressed: () {
                          //     if (controller.formKey.currentState!
                          //         .validate()) {
                          //       log(controller.noteController.text);
                          //       controller.addNotes(
                          //           clientFileId: clientFileId,
                          //           note: controller.noteController.text);
                          //     } // controller.addAttachments(
                          //     //     clientFileId: clientFileId);
                          //   },
                          // )),
                        ],
                      ),
                      onTap: (){
                        if (controller.formKey.currentState!
                            .validate()) {
                          log(controller.noteController.text);
                          controller.addNotes(
                              clientFileId: clientFileId,
                              note: controller.noteController.text);
                        }
                      }
                      // onTap: ()=> controller.addAttachments(
                      //     clientFileId: clientFileId),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            body: Obx(() => controller.state == ViewState.busy
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
                          Obx(() => controller.loadingAttachment.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : controller.notesData.isEmpty
                                  ? const NotFound(label: "لا توجد معلومات")
                                  : ListView.builder(
                                      itemCount: controller.notesData.length,
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
                                                          "الاسم: ${controller.notesData[index].createdBy ?? ""}"),
                                                      const Spacer(),
                                                      Text(
                                                          "التاريخ: ${DateConverter.isoStringToLocalDateOnly(controller.notesData[index].creationDate!)}"),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0),
                                                  child: Text(
                                                      "الملاحظة: ${controller.notesData[index].note}"),
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
                                                              .notesData[index]
                                                              .attachmentPath!);
                                                          DialogUtils
                                                              .showPhotoDialog(
                                                                  context:
                                                                      context,
                                                                  imgSrc:
                                                                      '${AppConstants.baseurlImages}${controller.notesData[index].attachmentPath!}');
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
                                                            controller.deleteNote(
                                                                context,
                                                                noteId: controller
                                                                    .notesData[
                                                                        index]
                                                                    .id!,
                                                                clientFieldId:
                                                                    clientFileId);
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
                                    ))
                        ],
                      ),
                    ),
                  ))));
  }
}
