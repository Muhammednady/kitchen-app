import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/view/screens/contracts/contracts_screen.dart';
import 'package:Kitchen_system/view/screens/offer_price/offer_price_screen.dart';
import 'package:Kitchen_system/view/screens/payment/payment_screen.dart';
import 'package:Kitchen_system/view/screens/production_requests/production_requests_screen.dart';
import 'package:Kitchen_system/view/screens/shortfalls/shortfalls_screen.dart';
import 'package:Kitchen_system/view/screens/top/top_screen.dart';
import 'package:get/get.dart';

import '../../maintenance/maintenance_screen.dart';

class HomeScreenController extends BaseController {
  static HomeScreenController to = Get.find();
  final selected = 0.obs;
  final labels = [
    // "الصفحة الرئيسية",
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
    //  Images.home,
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
    // HomeScreen(),
    OfferPriceScreen(),
    ContractsScreen(), //ملاحظات
    ProductionRequestsScreen(),
    MaintenanceScreen(),
    TopScreen(),
    PaymentScreen(),

    PaymentScreen(),
    ShortfallsScreen(),
  ];
}
