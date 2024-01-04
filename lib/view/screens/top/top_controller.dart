import 'dart:developer';

import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/model/response/top_model.dart';
import 'package:Kitchen_system/view/screens/top/top_screen.dart';
import 'package:Kitchen_system/view/screens/top/top_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../enum/view_state.dart';
import '../../../model/response/maintenance_model.dart';
import '../../../model/response/user_ids_model.dart';
import '../../../utill/images.dart';
import '../contracts/contracts_screen.dart';
import '../home/home_screen.dart';
import '../maintenance/maintenance_screen.dart';
import '../offer_price/controller/offer_screen_controller.dart';
import '../offer_price/offer_price_screen.dart';
import '../payment/payment_screen.dart';
import '../production_requests/production_requests_screen.dart';
import '../shortfalls/shortfalls_screen.dart';

class TopController extends BaseController {
  final services = TopService();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var loading = false.obs;
  final selected = 0.obs;
  final checkedValue = 0.obs;
  final usersList = <UsersDataModel>[].obs;

  // final itemList = <Statuses>[].obs;
  final userSelectedFilter = 0.obs;
  TopModel? topModel;

  final userSelected = UsersDataModel().obs;

  //////// util using api and shortfalls model

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
  List topList = <Data>[].obs;
  var groupValue = DropdownModel().obs;
  final labels = <DropdownModel>[
    DropdownModel(label: "المطابخ", id: 1),
    DropdownModel(label: "الابواب", id: 2),
    DropdownModel(label: "الاعمال الخشبية", id: 6),
    DropdownModel(label: "خزائن الحائط", id: 4),
  ].obs;

  @override
  onInit() async {
    super.onInit();
    setState(ViewState.busy);
    await getShortClient();
    setState(ViewState.idle);
  }

  getShortClient() async {
    loading.value = true;

    topModel = await services.getShortClientFiles(
        // pageType: 4,
        // userId: userSelectedFilter.value,
        // finalStatusId: itemSelectedFilter.value,
        // fileTypeId: groupValue.value.id
        // fileTypeId: 1
        );
    topList.assignAll(topModel!.data ?? []);
    log(topModel.toString());
    log(topList.toString());
    loading.value = false;
  }

  deleteTop(
    BuildContext context, {
    required int id,
  }) async {
    await services.deleteTop(context, id: id);
    loading.value = true;
    getShortClient();
   // if (context.mounted) Navigator.pop(context);
    loading.value = false;
  }
}
