import 'dart:io';
import 'package:Kitchen_system/view/screens/notes/notes_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/base_controller.dart';
import '../../../model/body/attachment_model.dart';
import '../../../model/response/client_fileAttachment_model.dart';
import '../../../model/response/kitchen_model.dart';
import '../../../model/response/status_category_model.dart';

class NotesController extends BaseController {
  final service = NotesServices();
  TextEditingController noteController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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

  filterData({int? statusId, clientFileId}) async {
    loadingAttachment.value = true;
    clientFileAttachmentModel = await service.getFileAttachments(
        clientFileId: clientFileId, statusId: statusId);
    //  attachmentsFilter.assignAll(clientFileAttachmentModel?.data ?? []);
    loadingAttachment.value = false;
  }

  getAllCategoryStatus({int? clientFileId}) async {
    categories.assignAll(statusCategoryModel?.data?.statuses ?? []);
    categorySelected.value = categories.first;
    categoryFilterSelected.value = categories.first;
    filterData(
        clientFileId: clientFileId, statusId: categorySelected.value.statusId);
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

  addNotes({required int clientFileId,
    required   String attachment,
    required  String note,})async{
    loading.value = true;
     await service.addNote(clientFileId: clientFileId, attachment: attachment, note: note);
    attachments.clear();
    files.clear();
    loading.value = false;

  }
}
