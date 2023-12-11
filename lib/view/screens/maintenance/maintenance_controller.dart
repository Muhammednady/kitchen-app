import 'dart:developer';

import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/model/response/maintenance_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/base_controller.dart';
import '../../../enum/view_state.dart';
import '../../../model/response/basic_response_model.dart';
import '../../../model/response/client_emails_model.dart';
import '../../../model/response/data_filter_model.dart';
import '../../../model/response/get_clients_payment.dart';
import '../../../model/response/user_ids_model.dart';
import '../../../utill/images.dart';
import '../contracts/contracts_screen.dart';
import '../home/home_screen.dart';
import '../offer_price/offer_price_screen.dart';
import '../payment/payment_screen.dart';
import '../production_requests/production_requests_screen.dart';
import 'maintenance_screen.dart';
import 'maintenance_services.dart';

class MaintenanceController extends BaseController {
  final userSelected = UsersDataModel().obs;
  UserIdsModel? userIdsModel;
  final selected = 0.obs;
  final maintenanceList = <Maintenance>[].obs;
  var loading = false.obs;
  final clientsList = <Clients>[].obs;
  //final clientsSelected = Clients().obs;
  ClientEmailsModel? clientEmailsModel;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ClientPaymentModel? clientMaintenance;
  var services = MaintenanceService();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final dateController = TextEditingController();
  final requestController = TextEditingController();
  final clientController = TextEditingController();
  MaintenanceModel? maintenanceModel;
  BasicResponseModel? responseModel;
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

  // final screensCard = [const PriceDetailsScreen(), const FollowersScreen()];
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
  final screens = const [
    HomeScreen(),
    OfferPriceScreen(),
    OfferPriceScreen(),
    OfferPriceScreen(),
    ContractsScreen(),
    ProductionRequestsScreen(),
    ProductionRequestsScreen(),
    ProductionRequestsScreen(),
    ProductionRequestsScreen(),
    ProductionRequestsScreen(),
    PaymentScreen(),
  ];

  @override
  onInit() async {
    super.onInit();
    setState(ViewState.busy);
    // userIdsModel = await services.getAllUsers();await userList();
    await getClients();
    await getMaintenanceList(CacheHelper.getData(key: AppConstants.clientId));

    //await getClientsPayment(1);
    setState(ViewState.idle);
  }

  getClients() async {
    clientEmailsModel = await services.getClient();
    clientsList.assignAll(clientEmailsModel?.data ?? []);
    for (int i = 0; i < clientsList.length; i++) {
      if (clientsList[i].clientId ==
          CacheHelper.getData(key: AppConstants.clientId)) {
        clientController.text = clientsList[i].clientName!;
      }
    }
  }

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

  getMaintenanceList(clientId) async {
    loading = true.obs;
    maintenanceModel = await services.getClientMaintenance(clientId);
    maintenanceList.assignAll(maintenanceModel?.data ?? []);
    log(maintenanceList.toString());
    loading = false.obs;
  }

  addMaintenance({
    required int clientId,
    required String note,
    required String date,
  }) async {
    loading = true.obs;
    responseModel = await services.addClientMaintenance(
        clientId: clientId, note: note, date: date);
    loading = false.obs;
  }
}
