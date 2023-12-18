import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/view/screens/payment/payment_screen.dart';
import 'package:Kitchen_system/view/screens/shortfalls/shortfalls_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/response/maintenance_model.dart';
import '../contracts/contracts_screen.dart';
import '../home/home_screen.dart';
import '../maintenance/maintenance_screen.dart';
import '../offer_price/offer_price_screen.dart';
import '../production_requests/production_requests_screen.dart';

class ShortfallsController extends BaseController{
  final selected = 0.obs;
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final dateController = TextEditingController();
  final requestController = TextEditingController();
  final clientController = TextEditingController();
  final labelsList = [
    "الصفحة الرئيسية",
    "عروض الاسعار",
    "المتابعات",
    "الملاحظات",
    "العقد",
    "طلبات الانتاج",
    "الصيانة",
    "التحليل",
    "محضر استقبال",
    "التوب",
    "سندات القبض",
    "التقارير",
    "توصيلات صحية",
    "النواقص",
    'تسجيل الخروج'

  ];
  final labelsCard = [
    "طباعة",
    "تعديل",
    "تراجع",
    "متابعات",
    "مرافقات",
    "ملاحظات"
  ];
  final imagesCard = [
    Images.print,
    Images.editIcons,
    Images.remove,
    Images.followers,
    Images.contract,
    Images.notification,
  ];
  //final screensCard = [const PriceDetailsScreen(), const FollowersScreen()];
  final images = [
    Images.home,
    Images.signDolar,
    Images.followers,
    Images.notification,
    Images.contract,
    Images.orders,
    Images.setting,
    Images.analysis,
    Images.reception,
    Images.top,
    Images.sanad,
    Images.report,
    Images.health,
    Images.filter,
    Images.logout
  ];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var loading = false.obs;
  //////// util using api and shortfalls model
  final maintenanceList = <Maintenance>[].obs;

  final screens = const [
    HomeScreen(),
    OfferPriceScreen(),
    OfferPriceScreen(),
    OfferPriceScreen(),
    ContractsScreen(),
    ProductionRequestsScreen(),
    MaintenanceScreen(),
    MaintenanceScreen(),
    MaintenanceScreen(),
    MaintenanceScreen(),
    PaymentScreen(),
    PaymentScreen(),
    PaymentScreen(),
    ShortfallsScreen(),
  ];

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

}