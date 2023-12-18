import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/view/screens/top/top_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/response/maintenance_model.dart';
import '../../../utill/images.dart';
import '../contracts/contracts_screen.dart';
import '../home/home_screen.dart';
import '../maintenance/maintenance_screen.dart';
import '../offer_price/offer_price_screen.dart';
import '../payment/payment_screen.dart';
import '../production_requests/production_requests_screen.dart';
import '../shortfalls/shortfalls_screen.dart';

class TopController extends BaseController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var loading = false.obs;
  final selected = 0.obs;
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
    TopScreen(),
    PaymentScreen(),
    PaymentScreen(),
    PaymentScreen(),
    ShortfallsScreen(),
  ];
}