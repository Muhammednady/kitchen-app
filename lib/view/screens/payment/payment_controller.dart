import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/view/screens/payment/payment_screen.dart';
import 'package:Kitchen_system/view/screens/payment/payment_service.dart';
import 'package:get/get.dart';

import '../../../enum/view_state.dart';
import '../../../model/response/data_filter_model.dart';
import '../../../model/response/item_model.dart';
import '../../../model/response/kitchen_model.dart';
import '../../../model/response/user_ids_model.dart';
import '../../../utill/images.dart';
import '../contracts/contracts_screen.dart';
import '../home/home_screen.dart';
import '../offer_price/controller/offer_screen_controller.dart';
import '../offer_price/offer_price_screen.dart';
import '../production_requests/production_requests_screen.dart';

class PaymentController extends BaseController {
  UserIdsModel? userIdsModel;
  ItemModel? itemModel;

  final usersList = <UsersDataModel>[].obs;
  final itemList = <Statuses>[].obs;
  final userSelected = UsersDataModel().obs;
  final itemSelected = Statuses().obs;
  DataFilterModel? dataFilterModel;
  final datFilterList = <DataFilter>[].obs;
  final loading = false.obs;

  // DetailsOfferPricesModel? detailsOfferPricesModel;
  final itemSelectedFilter = 0.obs;
  final userSelectedFilter = 0.obs;
  var services = PaymentService();

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

  @override
  onInit() async {
    super.onInit();
    setState(ViewState.busy);
    userIdsModel = await services.getAllUsers();
    await usersList();
    await getItemList();
    setState(ViewState.idle);

  }
  getShortClient() async {
    loading.value = true;
    dataFilterModel = await services.getShortClientFiles(
        pageType: 0,
        userId:  userSelectedFilter.value,
        finalStatusId:
        itemSelectedFilter.value,
        fileTypeId: groupValue.value.id
      // fileTypeId: 1
    );
    datFilterList.assignAll(dataFilterModel?.data ?? []);
    loading.value = false;
  }

  getItemList() async {
    itemList.assignAll(itemModel?.data?.statuses ??
        [
          Statuses(statusId: 0, description: "لاتوجد معلومات"),
        ]);

    itemList.isNotEmpty
        ? {
            itemSelected.value = itemList[0],
            dataFilterModel = await services.getShortClientFiles(
                pageType: 0,
                userId: userSelectedFilter.value,
                finalStatusId: itemSelectedFilter.value,
                fileTypeId: groupValue.value.id
                // fileTypeId: 1
                ),
            datFilterList.assignAll(dataFilterModel?.data ?? []),
          }
        : {
            itemList.assignAll([
              Statuses(statusId: 0, description: "لاتوجد معلومات"),
            ]),
            itemSelected.value = itemList[0],
          };
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
}
