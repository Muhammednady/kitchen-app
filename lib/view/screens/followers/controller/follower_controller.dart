import 'dart:io';

import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/enum/view_state.dart';
import 'package:Kitchen_system/model/response/follow_up_model.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:Kitchen_system/view/screens/followers/services/follower_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../model/body/attachment_model.dart';
import '../../../../model/response/kitchen_model.dart';
import '../../../../model/response/status_category_model.dart';

class FollowerController extends BaseController {
  FollowerController({int? id}) {
    getAllFollowUp(id: id);
  }

  FollowUpModel? followUpModel;
  TextEditingController followUpController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final data = <FollowList>[].obs;
  final services = FollowerServices();
  final attachments = <AttachmentModel>[].obs;
  StatusCategoryModel? statusCategoryModel;
  final categories = <Statuses>[].obs;
  final categorySelected = Statuses().obs;
  final categoryFilterSelected = Statuses().obs;
  final path = "".obs;
  final note = "".obs;
  final files = <File>[].obs;
  final loading = false.obs;
  final loadingAttachment = false.obs;

  selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    if (result != null) {
      files.value = result.paths.map((path) => File(path!)).toList();
      for (var element in files) {
        attachments.add(AttachmentModel(
            attachmentPath: element,
            statusId: categorySelected.value.statusId));
      }
    } else {
      // User canceled the picker
    }
  }

  addFollowUp(BuildContext context, {int? clientFileId, required String note}) async {
    loading.value = true;
    await services.addClientFileFollowUp(
        note: note, files: attachments, clientFileId: clientFileId);
    attachments.clear();
    files.clear();
    await getAllFollowUp(id: clientFileId);
    loading.value = false;
  }

  getAllFollowUp({int? id}) async {
    setState(ViewState.busy);
    followUpModel = await services.getFollowUp(clientFileId: id);
    data.assignAll(followUpModel?.data ?? []);
    setState(ViewState.idle);
  }

  deleteFollowUp(BuildContext context,
      {required int followUpId, required int clientFieldId}) async {
    await services.deleteFollowUp(context: context, followUpId: followUpId);
    loadingAttachment.value = true;
    getAllFollowUp(id: clientFieldId);
    Navigator.pop(context);
    loadingAttachment.value = false;
  }
}
