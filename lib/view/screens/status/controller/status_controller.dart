import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/model/response/item_model.dart';
import 'package:get/get.dart';

import '../../../../model/response/kitchen_model.dart';
import '../../../../utill/images.dart';
import '../../contracts/contracts_screen.dart';
import '../../home/home_screen.dart';
import '../../offer_price/offer_price_screen.dart';
import '../../offer_price/services/offer_services.dart';
import '../../production_requests/production_requests_screen.dart';

class StatusController extends BaseController {
  final selected = 0.obs;
  final loading = false.obs;
  final services = OfferServices();
  ItemModel? dataModel;
  final dataList = <Statuses>[].obs;

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
  final List<String> titles = [
    'ملاحظات',
    'تعديل',
    'تراجع',
    'متابعات',
    'مرافقات',
    'طباعة',
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
    ContractsScreen(),
    ContractsScreen(),
    ProductionRequestsScreen(),
  ];

  getAllStatuses(int id) async {
    loading.value = true;
    dataModel = await services.getAllItemType(id: id);
    dataList.assignAll(dataModel?.data!.statuses ?? []);
    loading.value = false;
  }
}
