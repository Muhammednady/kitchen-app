import 'dart:io';
import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/enum/view_state.dart';
import 'package:Kitchen_system/model/body/attachment_model.dart';
import 'package:Kitchen_system/model/response/client_fileAttachment_model.dart';
import 'package:Kitchen_system/model/response/kitchen_model.dart';
import 'package:Kitchen_system/model/response/status_category_model.dart';
import 'package:Kitchen_system/view/screens/attachments/attachment_services/attachment_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AttachmentController extends BaseController {
  AttachmentController({int?clientFileId}) {
    loadData(clientFileId: clientFileId);
  }
  final service = AttachmentService();
  final files = <File>[].obs;
  final attachments = <AttachmentModel>[].obs;
  StatusCategoryModel? statusCategoryModel;
  final categories = <Statuses>[].obs;
  final categorySelected = Statuses().obs;
  final categoryFilterSelected = Statuses().obs;
  ClientFileAttachmentModel? clientFileAttachmentModel;
  final attachmentsFilter = <AttachmentsData>[].obs;
  final loading = false.obs;
  final loadingAttachment = false.obs;

  loadData({int?clientFileId}) async {
    setState(ViewState.busy);
    statusCategoryModel = await service.getStatusCategory();
    getAllCategoryStatus(clientFileId: clientFileId);
    setState(ViewState.idle);
  }

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

  addAttachments({int? clientFileId}) async {
    loading.value = true;
    await service.addAttachments(
        clientFileId: clientFileId, files: attachments);
    attachments.clear();
    files.clear();
    filterData(
        clientFileId: clientFileId, statusId: categorySelected.value.statusId);
    loading.value = false;
  }

  getAllCategoryStatus({int? clientFileId}) async {
    categories.assignAll(statusCategoryModel?.data?.statuses ?? []);
    categorySelected.value = categories.first;
    categoryFilterSelected.value = categories.first;
    filterData(
        clientFileId: clientFileId, statusId: categorySelected.value.statusId);
  }

  filterData({int? statusId, clientFileId}) async {
    loadingAttachment.value = true;
    clientFileAttachmentModel = await service.getFileAttachments(
        clientFileId: clientFileId, statusId: statusId);
    attachmentsFilter.assignAll(clientFileAttachmentModel?.data ?? []);
    loadingAttachment.value = false;
  }

  deleteAttachment(BuildContext context,
      {int? statusId, clientFileId, attachmentId}) async {
    await service.deleteFileAttachments(context,
        clientFileId: clientFileId, attachmentId: attachmentId);
    loadingAttachment.value = true;
    clientFileAttachmentModel = await service.getFileAttachments(
        clientFileId: clientFileId, statusId: statusId);
    attachmentsFilter.assignAll(clientFileAttachmentModel?.data ?? []);
    Navigator.pop(context);
    loadingAttachment.value = false;
  }
}
