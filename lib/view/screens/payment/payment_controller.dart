
import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/model/response/basic_response_model.dart';
import 'package:Kitchen_system/view/screens/payment/payment_screen.dart';
import 'package:Kitchen_system/view/screens/payment/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../enum/view_state.dart';
import '../../../model/response/client_emails_model.dart';
import '../../../model/response/data_filter_model.dart';
import '../../../model/response/get_clients_payment.dart';
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
import '../shortfalls/shortfalls_screen.dart';
import '../top/top_screen.dart';

class PaymentController extends BaseController {
  UserIdsModel? userIdsModel;
  ItemModel? itemModel;
  ClientPaymentModel? clientPayment;
  final usersList = <UsersDataModel>[].obs;
  final itemList = <Statuses>[].obs;
  final paymentMethods = ['Cash', 'check'];
  String? selectedPayment;
  final userSelected = UsersDataModel().obs;
  final itemSelected = Statuses().obs;
  DataFilterModel? dataFilterModel;
  BasicResponseModel? addPaymentResponse;
  final datFilterList = <DataFilter>[].obs;
  var loading = false.obs;
  var added = false.obs;
  var paymentValue = ''.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // DetailsOfferPricesModel? detailsOfferPricesModel;
  final itemSelectedFilter = 0.obs;
  final userSelectedFilter = 0.obs;
  var services = PaymentService();
  ClientEmailsModel? clientEmailsModel;
  BasicResponseModel? responseModel;

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
  // final screensCard = [const PriceDetailsScreen(), const FollowersScreen()];

  @override
  onInit() async {
    super.onInit();
    setState(ViewState.busy);
    userIdsModel = await services.getAllUsers();
    await userList();
    await getClients();
    //await getClientsPayment(1);
    setState(ViewState.idle);
  }

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

  getClientsPayment(int clientId) async {
    loading = true.obs;
    clientPayment = await services.getClientsPayment(clientId);
    paidController.text = clientPayment!.data!.paid.toString();
    amountController.text = clientPayment!.data!.amount.toString();
    remainingController.text = clientPayment!.data!.remaining.toString();
    loading = false.obs;
  }

  addClientPayment() async {
    loading = true.obs;
    responseModel = await services.addClientPayment(
      amount: amountController.text,
      clientId: clientPayment!.data!.clientId!,
      checkDate: checkSelectedDate.toString(),
      paymentDate: selectedDate.toString(),
      checkNo: numberController.text,
      notes: notesController.text,
      paidTypeId: paymentMethods.indexOf(selectedPayment!),
    );

    loading = false.obs;
    added = true.obs;
  }

  DateTime? selectedDate;
  DateTime? checkSelectedDate;
  final dateController = TextEditingController();
  final checkDateController = TextEditingController();
  final paidController = TextEditingController();
  final notesController = TextEditingController();
  final numberController = TextEditingController();
  final amountController = TextEditingController();
  final remainingController = TextEditingController();

  Future selectDate(BuildContext context, {bool isCheck = false}) async {
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
      isCheck
      ?checkSelectedDate=picked: selectedDate = picked;
      isCheck
          ? checkDateController.text = DateFormat.yMd().format(checkSelectedDate!)
          : dateController.text = DateFormat.yMd().format(selectedDate!);
    }
  }
}
