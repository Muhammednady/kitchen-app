import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/enum/view_state.dart';
import 'package:Kitchen_system/model/response/data_filter_model.dart';
import 'package:Kitchen_system/model/response/data_filter_model.dart';
import 'package:Kitchen_system/model/response/details_offer_prices_model.dart';
import 'package:Kitchen_system/model/response/item_model.dart';
import 'package:Kitchen_system/model/response/kitchen_model.dart';
import 'package:Kitchen_system/model/response/user_ids_model.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/view/screens/followers/followers_screen.dart';
import 'package:Kitchen_system/view/screens/home/home_screen.dart';
import 'package:Kitchen_system/view/screens/offer_price/offer_price_screen.dart';
import 'package:Kitchen_system/view/screens/offer_price/services/offer_services.dart';
import 'package:Kitchen_system/view/screens/price_details/price_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferScreenController extends BaseController {
  final services = OfferServices();
  UserIdsModel? userIdsModel;
  ItemModel? itemModel;
  final usersList = <UsersDataModel>[].obs;
  final itemList = <Statuses>[].obs;
  final userSelected = UsersDataModel().obs;
  final itemSelected = Statuses().obs;
  DataFilterModel? dataFilterModel;
  final datFilterList = <DataFilter>[].obs;
  final loading = false.obs;
  DetailsOfferPricesModel? detailsOfferPricesModel;
  final itemSelectedFilter = 0.obs;
  final userSelectedFilter = 0.obs;
  final labels = <DropdownModel>[
    DropdownModel(label: "المطابخ", id: 1),
    DropdownModel(label: "الابواب", id: 2),
    DropdownModel(label: "الاعمال الخشبية", id: 6),
    DropdownModel(label: "خزائن الحائط", id: 4),
  ].obs;
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
  final screensCard = [const PriceDetailsScreen(), const FollowersScreen()];
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
  final screens = [const HomeScreen(), const OfferPriceScreen()];

  @override
  onInit() async {
    super.onInit();
    setState(ViewState.busy);
    userIdsModel = await services.getAllUsers();
    itemModel = await services.getAllItemType(id: 0);
    await userList();
    await getItemList();
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
                userId:  userSelectedFilter.value,
                finalStatusId:
                itemSelectedFilter.value,
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

  getDetails({int? id}) async {
    detailsOfferPricesModel = await services.getDetails(id: id);
  }

  deleteOffer(BuildContext context, {int? id}) async {
    await services.deleteOffer(context, id: id);
    loading.value = true;
    dataFilterModel = await services.getShortClientFiles(
        pageType: 0,
        userId: userSelectedFilter.value,
        finalStatusId:
        itemSelectedFilter.value,
        fileTypeId: groupValue.value.id
        // fileTypeId: 1
        );
    datFilterList.assignAll(dataFilterModel?.data ?? []);
    Get.back();
    loading.value = false;
  }
}

class DropdownModel {
  String? label;
  int? id;

  DropdownModel({this.label, this.id});
}
