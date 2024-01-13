import 'dart:developer';

import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/model/response/top_data_model.dart';
import 'package:Kitchen_system/model/response/top_model.dart';
import 'package:Kitchen_system/view/screens/top/top_screen.dart';
import 'package:Kitchen_system/view/screens/top/top_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../enum/view_state.dart';
import '../../../helper/network/dio_integration.dart';
import '../../../helper/network/error_handler.dart';
import '../../../model/response/client_emails_model.dart';
import '../../../model/response/get_clients_payment.dart';
import '../../../model/response/maintenance_model.dart';
import '../../../model/response/user_ids_model.dart';
import '../../../utill/app_constants.dart';
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
  final clientsSelected = Clients().obs;
  final clientsList = <Clients>[].obs;
  ClientPaymentModel? clientPayment;
  final usersList = <UsersDataModel>[].obs;
  List type = <Statuses>[].obs;
  List topColor = <Statuses>[].obs;
  List panelType = <Statuses>[].obs;
  List topHeight = <Statuses>[].obs;
  List sinkHole = <Statuses>[].obs;
  Statuses? selectedType;
  Statuses? selectedPanelType;
  Statuses? selectedTopColor;
  Statuses? selectedTopHeight;
  Statuses? selectedSinkHole;
  TextEditingController noteController = TextEditingController();
  TextEditingController numberFileController = TextEditingController();
  TextEditingController numberClientController = TextEditingController();
  TextEditingController clientAddressController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController granetController = TextEditingController();
  TextEditingController thicknessController = TextEditingController();

  // final itemList = <Statuses>[].obs;
  final userSelectedFilter = 0.obs;
  TopModel? topModel;
  TopDataModel? topDataModel;
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
    await getTopData();

    setState(ViewState.idle);
  }

  final dio = DioUtilNew.dio;

  getTopData() async {
    loading.value = true;
    topDataModel = await services.getTopPage();
    topColor.assignAll(topDataModel!.data!.topColor!.statuses ?? []);
    topHeight.assignAll(topDataModel!.data!.topHieght!.statuses ?? []);
    type.assignAll(topDataModel!.data!.type!.statuses ?? []);
    panelType.assignAll(topDataModel!.data!.panelType!.statuses ?? []);
    sinkHole.assignAll(topDataModel!.data!.sinkHole!.statuses ?? []);
    selectedType = type[0];
    selectedTopHeight = topHeight[0];
    selectedTopColor = topColor[0];
    selectedSinkHole = sinkHole[0];
    selectedPanelType = panelType[0];

    loading.value = false;
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

  getClientsPayment(int clientId) async {
    loading = true.obs;
    clientPayment = await services.getClientsPayment(clientId);
    loading = false.obs;
  }
}
