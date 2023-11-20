import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/view/screens/payment/payment_screen.dart';
import 'package:get/get.dart';

import '../../../model/response/user_ids_model.dart';
import '../../../utill/images.dart';
import '../contracts/contracts_screen.dart';
import '../home/home_screen.dart';
import '../offer_price/offer_price_screen.dart';
import '../production_requests/production_requests_screen.dart';

class PaymentController extends BaseController{
  // UserIdsModel? userIdsModel;
  // ItemModel? itemModel;
   final usersList = <UsersDataModel>[].obs;
  // final itemList = <Statuses>[].obs;
   final userSelected = UsersDataModel().obs;
  // final itemSelected = Statuses().obs;
  //DataFilterModel? dataFilterModel;
 // final datFilterList = <DataFilter>[].obs;
  final loading = false.obs;
 // DetailsOfferPricesModel? detailsOfferPricesModel;
  final itemSelectedFilter = 0.obs;
  final userSelectedFilter = 0.obs;
  // final labels = <DropdownModel>[
  //   DropdownModel(label: "المطابخ", id: 1),
  //   DropdownModel(label: "الابواب", id: 2),
  //   DropdownModel(label: "الاعمال الخشبية", id: 6),
  //   DropdownModel(label: "خزائن الحائط", id: 4),
  // ].obs;
  final checkedValue = 0.obs;
 // var groupValue = DropdownModel().obs;
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
    "النواقص"
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
    Images.filter
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

}