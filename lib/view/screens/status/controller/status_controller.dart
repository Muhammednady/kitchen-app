import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/model/response/item_model.dart';
import 'package:get/get.dart';

import '../../../../model/response/data_filter_model.dart';
import '../../../../model/response/final_status_files_model.dart';
import '../../../../model/response/kitchen_model.dart';
import '../../../../utill/images.dart';
import '../../contracts/contracts_screen.dart';
import '../../home/home_screen.dart';
import '../../offer_price/controller/offer_screen_controller.dart';
import '../../offer_price/offer_price_screen.dart';
import '../../offer_price/services/offer_services.dart';
import '../../production_requests/production_requests_screen.dart';

class StatusController extends BaseController {
  final selected = 0.obs;
  final loading = false.obs;
  DataFilterModel? dataFilterModel;
  final datFilterList = <DataFilter>[].obs;
  final userSelectedFilter = 0.obs;
  var groupValue = DropdownModel().obs;
  final services = OfferServices();
  ItemModel? itemModel;
  final itemList = <Statuses>[].obs;
  final itemSelected = Statuses().obs;
  final itemSelectedFilter = 0.obs;
  FinalStatusFilesModel? dataModel;
  final dataList = <FileModel>[].obs;

  @override
  void onInit() async {
    itemModel = await services.getAllItemType(id: 0);
    getItemList();
    super.onInit();
  }

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
    dataModel = await services.getAllFinalStatus(id: id);
    dataList.assignAll(dataModel?.statusFiles ?? []);
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

  saveNewState({required int id}) {
    services
        .changeFinalStatus(
            clientFileId: id,
            finalStatusId: itemSelected.value.statusId!,
            notes: '')
        .whenComplete(() => getAllStatuses(id));
  }

  getShortClient() async {
    loading.value = true;
    dataFilterModel = await services.getShortClientFiles(
        pageType: 0,
        userId: userSelectedFilter.value,
        finalStatusId: itemSelectedFilter.value,
        fileTypeId: groupValue.value.id
        // fileTypeId: 1
        );
    datFilterList.assignAll(dataFilterModel?.data ?? []);
    loading.value = false;
  }
}
