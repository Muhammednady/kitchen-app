import 'dart:io';

import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/enum/view_state.dart';
import 'package:Kitchen_system/model/response/follow_up_model.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:Kitchen_system/view/screens/followers/services/follower_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FollowerController extends BaseController {
  FollowerController({int? id}) {
    getAllFollowUp(id: id);
  }

  FollowUpModel? followUpModel;
  final data = <FollowList>[].obs;
  final services = FollowerServices();
  final path = "".obs;
  final note = "".obs;
  final file = File("").obs;
  final loading = false.obs;

  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file.value = File(result.files.single.path!);
      print(file.value);
      path.value = file.value.path;
    } else {
      // User canceled the picker
    }
  }

  addFollowUp(BuildContext context, {int? clientFileId}) async {
    if (file.value.path == "") {
      showCustomSnackBar("يجب اختيار ملف", context);
    } else {
      loading.value = true;
      await services.addClientFileFollowUp(
          note: note.value, file: file.value, clientFileId: clientFileId);
     await getAllFollowUp(id: clientFileId);
      loading.value = false;
    }
  }

  getAllFollowUp({int? id}) async {
    setState(ViewState.busy);
    followUpModel = await services.getFollowUp(clientFileId: id);
    data.assignAll(followUpModel?.data??[]);
    setState(ViewState.idle);
  }
}
