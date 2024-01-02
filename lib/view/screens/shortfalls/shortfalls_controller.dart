import 'dart:io';

import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/view/screens/payment/payment_screen.dart';
import 'package:Kitchen_system/view/screens/shortfalls/shortfalls_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../enum/view_state.dart';
import '../../../model/body/attachment_model.dart';
import '../../../model/response/kitchen_model.dart';
import '../../../model/response/maintenance_model.dart';
import '../../../model/response/units_model.dart';
import '../contracts/contracts_screen.dart';
import '../home/home_screen.dart';
import '../maintenance/maintenance_screen.dart';
import '../offer_price/offer_price_screen.dart';
import '../production_requests/production_requests_screen.dart';
import '../top/top_screen.dart';

class ShortfallsController extends BaseController {
  final selected = 0.obs;
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final dateController = TextEditingController();
  final requestController = TextEditingController();
  final clientController = TextEditingController();
  final images = [
    Images.home,
    Images.signDolar,
    Images.contract,
    Images.orders,
    Images.setting,
    Images.top,
    Images.sanad,
    Images.health,
    Images.filter,
    Images.logout
  ];
  final screens = const [
    HomeScreen(),
    OfferPriceScreen(),
    ContractsScreen(),
    ProductionRequestsScreen(),
    MaintenanceScreen(),
    TopScreen(),
    PaymentScreen(),
    PaymentScreen(),

    ShortfallsScreen(),
  ];
  final labelsList = [
    "الصفحة الرئيسية",
    "عروض الاسعار",
    "العقد",
    "طلبات الانتاج",
    "الصيانة",
    "التوب",
    "سندات القبض",
    "توصيلات صحية",
    "النواقص",
    'تسجيل الخروج'

  ];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var loading = false.obs;

  //////// util using api and shortfalls model
  final maintenanceList = <Maintenance>[].obs;

  DateTime? selectedDate;

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        // selectableDayPredicate: (DateTime val) {
        //   String sanitized = sanitizeDateTime(val);
        //   return !unselectableDates.contains(sanitized);
        // },
        initialDatePickerMode: DatePickerMode.day,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.black,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(2023, 6),
        lastDate: DateTime(2025, 9));
    if (picked != null) {
      selectedDate = picked;
      dateController.text = DateFormat.yMd().format(selectedDate!);
    }
  }

  final files = <File>[].obs;
  final attachments = <AttachmentModel>[].obs;
  final categorySelected = Statuses().obs;

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

  final thickeningList = <Statuses>[].obs;
  final thickeningSelected = Statuses().obs;
  KitchenModel? data;
  UnitsModel? unitsModel;

  @override
  onInit() async {
  super.onInit();
  setState(ViewState.busy);
  // data = await services.getPriceDetails();
  // unitsModel = await services.getUnits();

  await getThickeningList();
}
  getThickeningList() async {
    thickeningList.assignAll(data?.data?.thickeningTop?.statuses ?? []);
    thickeningList.isNotEmpty
        ? {
      thickeningSelected.value = thickeningList[0],
    }
        : {
      thickeningList.assignAll([
        Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
      ]),
      thickeningSelected.value = thickeningList[0],
    };
  }

}
