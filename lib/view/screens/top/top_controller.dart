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

  //////// util using api and shortfalls model
  final maintenanceList = <Maintenance>[].obs;

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
}