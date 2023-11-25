import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/view/screens/payment/payment_screen.dart';
import 'package:Kitchen_system/view/screens/payment/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

import '../../../enum/view_state.dart';
import '../../../model/response/client_emails_model.dart';
import '../../../model/response/data_filter_model.dart';
import '../../../model/response/item_model.dart';
import '../../../model/response/kitchen_model.dart';
import '../../../model/response/user_ids_model.dart';
import '../../../utill/images.dart';
import '../contracts/contracts_screen.dart';
import '../home/home_screen.dart';
import '../maintenance/maintenance_screen.dart';
import '../offer_price/controller/offer_screen_controller.dart';
import '../offer_price/offer_price_screen.dart';
import '../production_requests/production_requests_screen.dart';

class PaymentController extends BaseController {
  UserIdsModel? userIdsModel;
  ItemModel? itemModel;

  final usersList = <UsersDataModel>[].obs;
  final itemList = <Statuses>[].obs;
  final paymentMethods = ['Cash', 'check'];
  final userSelected = UsersDataModel().obs;
  final itemSelected = Statuses().obs;
  DataFilterModel? dataFilterModel;
  final datFilterList = <DataFilter>[].obs;
  final loading = false.obs;

  // DetailsOfferPricesModel? detailsOfferPricesModel;
  final itemSelectedFilter = 0.obs;
  final userSelectedFilter = 0.obs;
  var services = PaymentService();
  ClientEmailsModel? clientEmailsModel;
  final clientsList = <Clients>[].obs;
  final clientsSelected = Clients().obs;

  // final labels = <DropdownModel>[
  //   DropdownModel(label: "المطابخ", id: 1),
  //   DropdownModel(label: "الابواب", id: 2),
  //   DropdownModel(label: "الاعمال الخشبية", id: 6),
  //   DropdownModel(label: "خزائن الحائط", id: 4),
  // ].obs;
  final checkedValue = 0.obs;
  var groupValue = DropdownModel().obs;
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
    MaintenanceScreen(),
    ProductionRequestsScreen(),
    ProductionRequestsScreen(),
    ProductionRequestsScreen(),
    PaymentScreen(),
  ];

  @override
  onInit() async {
    super.onInit();
    setState(ViewState.busy);
    userIdsModel = await services.getAllUsers();
    await userList();
    await getClients();
    setState(ViewState.idle);
  }

  // getShortClient() async {
  //   loading.value = true;
  //   dataFilterModel = await services.getShortClientFiles(
  //       pageType: 0,
  //       userId: userSelectedFilter.value,
  //       finalStatusId: itemSelectedFilter.value,
  //       fileTypeId: groupValue.value.id
  //       // fileTypeId: 1
  //       );
  //   datFilterList.assignAll(dataFilterModel?.data ?? []);
  //   loading.value = false;
  // }

  // getItemList() async {
  //   itemList.assignAll(itemModel?.data?.statuses ??
  //       [
  //         Statuses(statusId: 0, description: "لاتوجد معلومات"),
  //       ]);
  //
  //   itemList.isNotEmpty
  //       ? {
  //           itemSelected.value = itemList[0],
  //           dataFilterModel = await services.getShortClientFiles(
  //               pageType: 0,
  //               userId: userSelectedFilter.value,
  //               finalStatusId: itemSelectedFilter.value,
  //               fileTypeId: groupValue.value.id
  //               // fileTypeId: 1
  //               ),
  //           datFilterList.assignAll(dataFilterModel?.data ?? []),
  //         }
  //       : {
  //           itemList.assignAll([
  //             Statuses(statusId: 0, description: "لاتوجد معلومات"),
  //           ]),
  //           itemSelected.value = itemList[0],
  //         };
  // }

  userList() async {
    usersList.assignAll(userIdsModel?.data ??
        [
          UsersDataModel(id: 0, userName: "لاتوجد معلومات"),
        ]);

    usersList.isNotEmpty
        ? {
            userSelected.value = usersList[0],
          }
        : {
            usersList.assignAll([
              UsersDataModel(id: 0, userName: "لاتوجد معلومات"),
            ]),
            userSelected.value = usersList[0],
          };
  }

  getClients() async {
    clientEmailsModel = await services.getClient();
    clientsList.assignAll(clientEmailsModel?.data ?? []);
    clientsSelected.value = clientsList[0];
  }

  DateTime? selectedDate;
  final dateController = TextEditingController();

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
