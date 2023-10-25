import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/view/screens/contracts/contracts_screen.dart';
import 'package:Kitchen_system/view/screens/offer_price/offer_price_screen.dart';
import 'package:Kitchen_system/view/screens/production_requests/production_requests_screen.dart';
import 'package:get/get.dart';

class HomeScreenController extends BaseController {
  static HomeScreenController to = Get.find();
  final selected = 0.obs;
  final labels = [
   // "الصفحة الرئيسية",
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
  final images = [
  //  Images.home,
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
   // HomeScreen(),
    OfferPriceScreen(),
    OfferPriceScreen(),
    OfferPriceScreen(),
    ContractsScreen(),
    ProductionRequestsScreen(),
    ProductionRequestsScreen(),
  ];
}
