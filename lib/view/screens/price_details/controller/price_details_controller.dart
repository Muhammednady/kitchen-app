import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/enum/view_state.dart';
import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/model/body/AddClientModel.dart';
import 'package:Kitchen_system/model/body/add_client_file_model.dart';
import 'package:Kitchen_system/model/response/client_emails_model.dart';
import 'package:Kitchen_system/model/response/client_model.dart';
import 'package:Kitchen_system/model/response/kitchen_model.dart';
import 'package:Kitchen_system/model/response/units_model.dart';
import 'package:Kitchen_system/model/valid_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:Kitchen_system/view/screens/price_details/services/price_details_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PriceDetailsController extends BaseController {
  final services = PriceDetailsServices();
  ClientEmailsModel? clientEmailsModel;
  KitchenModel? data;
  UnitsModel? unitsModel;
  final _name = Valid().obs;
  final _phone = Valid().obs;
  final _address = Valid().obs;
  final granetList = <Statuses>[].obs;
  final clientsList = <Clients>[].obs;
  final wallList = <Statuses>[].obs;
  final thickeningList = <Statuses>[].obs;
  final woodList = <Statuses>[].obs;
  final pannelList = <Statuses>[].obs;
  final handList = <Statuses>[].obs;
  final cornashList = <Statuses>[].obs;
  final lightingList = <Statuses>[].obs;
  final maglaList = <Statuses>[].obs;
  final maglaHoleList = <Statuses>[].obs;
  final outList = <Statuses>[].obs;
  final batteryList = <Statuses>[].obs;
  final unitsList = <Statuses>[].obs;
  final unitList = <Statuses>[].obs;
  final shafatList = <Statuses>[].obs;
  final healthList = <Statuses>[].obs;
  final accessioresList = <Statuses>[].obs;
  final garanetSelected = Statuses().obs;
  final clientsSelected = Clients().obs;
  final wallSelected = Statuses().obs;
  final thickeningSelected = Statuses().obs;
  final woodSelected = Statuses().obs;
  final pannelSelected = Statuses().obs;
  final handSelected = Statuses().obs;
  final cornashSelected = Statuses().obs;
  final lightingSelected = Statuses().obs;
  final maglaSelected = Statuses().obs;
  final maglaHoleSelected = Statuses().obs;
  final outSelected = Statuses().obs;
  final shafatSelected = Statuses().obs;
  final batterySelected = Statuses().obs;
  final unitsSelected = Statuses().obs;
  final unitSelected = Statuses().obs;
  final accessioresSelected = Statuses().obs;
  final healthSelected = Statuses().obs;
  final loading = true.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController numberAccessioresController = TextEditingController();
  TextEditingController priceAccessioresController = TextEditingController();
  TextEditingController notesAccessioresController = TextEditingController();
  final clientNeed = "".obs;
  final number = 0.obs;
  final numberAccessiores = 0.obs;
  final price = 0.0.obs;
  final priceAccessiores = 0.0.obs;
  final notes = "".obs;
  final notesAccessiores = "".obs;
  final additionalDiscount = 0.0.obs;
  final items = <Items>[].obs;
  final itemsUnites = <Items>[].obs;
  final itemsAccessiores = <Items>[].obs;

  Valid get name => _name.value;

  Valid get phone => _phone.value;

  Valid get address => _address.value;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setState(ViewState.busy);
    data = await services.getPriceDetails();
    unitsModel = await services.getUnits();
    await getgranetList();
    await getwallList();
    await getThickeningList();
    await getwoodList();
    await getPannelList();
    await getHandList();
    await getCornashList();
    await getLightingList();
    await getOutList();
    await getBatteryList();
    await getUnitsList();
    await getUnitList();
    await getaccessioresList();
    await getMaglaHoleList();
    await getShafatList();
    await getHealthtList();
    await getClients();
    setState(ViewState.idle);
  }

  getClients() async {
    clientEmailsModel = await services.getClient();
    clientsList.assignAll(clientEmailsModel?.data ?? []);
    clientsSelected.value = clientsList[0];
  }

  changeEmail(String email) {
    if (email.trim().length < 4) {
      _name.value = Valid(error: "تأكد من ادخال الاسم ".tr);
    } else {
      _name.value = Valid(value: email);
    }
  }

  changePhone(String email) {
    if (email.trim().length < 4) {
      _phone.value = Valid(error: "تأكد من ادخال رقم الهاتف ".tr);
    } else {
      _phone.value = Valid(value: email);
    }
  }

  getgranetList() async {
    granetList.assignAll(data?.data?.garanet?.statuses ?? []);
    granetList.isNotEmpty
        ? {
            garanetSelected.value = granetList[0],
          }
        : {
            granetList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            garanetSelected.value = granetList[0],
          };
  }

  getwallList() async {
    wallList.assignAll(data?.data?.platingTopWall?.statuses ?? []);
    wallList.isNotEmpty
        ? {
            wallSelected.value = wallList[0],
          }
        : {
            wallList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            wallSelected.value = wallList[0],
          };
  }

  getThickeningList() async {
    thickeningList.assignAll(data?.data?.thickeningTop?.statuses ?? []);
    thickeningList.isNotEmpty
        ? {
            thickeningSelected.value = thickeningList[0],
          }
        : {
            thickeningList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            thickeningSelected.value = thickeningList[0],
          };
  }

  getwoodList() async {
    woodList.assignAll(data?.data?.panel?.statuses ?? []);
    woodList.isNotEmpty
        ? {
            woodSelected.value = woodList[0],
          }
        : {
            woodList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            woodSelected.value = woodList[0],
          };
  }

  getPannelList() async {
    pannelList.assignAll(data?.data?.panel?.statuses ?? []);
    pannelList.isNotEmpty
        ? {
            pannelSelected.value = pannelList[0],
          }
        : {
            pannelList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            pannelSelected.value = pannelList[0],
          };
  }

  getHandList() async {
    handList.assignAll(data?.data?.handType?.statuses ?? []);
    handList.isNotEmpty
        ? {
            handSelected.value = handList[0],
          }
        : {
            handList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            handSelected.value = handList[0],
          };
  }

  getCornashList() async {
    cornashList.assignAll(data?.data?.corniche?.statuses ?? []);
    cornashList.isNotEmpty
        ? {
            cornashSelected.value = cornashList[0],
          }
        : {
            cornashList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            cornashSelected.value = cornashList[0],
          };
  }

  getLightingList() async {
    print(data?.data?.lighting?.statuses);
    lightingList.assignAll(data?.data?.lighting?.statuses ?? []);
    lightingList.isNotEmpty
        ? {
            lightingSelected.value = lightingList[0],
          }
        : {
            lightingList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            lightingSelected.value = lightingList[0],
          };
  }

  getMaglaList() async {
    maglaList.assignAll(data?.data?.magla?.statuses ?? []);
    maglaList.isNotEmpty
        ? {
            maglaSelected.value = maglaList[0],
          }
        : {
            maglaList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            maglaSelected.value = maglaList[0],
          };
  }

  getMaglaHoleList() async {
    maglaHoleList.assignAll(data?.data?.maglaHole?.statuses ?? []);
    maglaHoleList.isNotEmpty
        ? {
            maglaHoleSelected.value = maglaHoleList[0],
          }
        : {
            maglaHoleList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            maglaHoleSelected.value = maglaHoleList[0],
          };
  }

  getOutList() async {
    outList.assignAll(data?.data?.outerStrop?.statuses ?? []);
    outList.isNotEmpty
        ? {
            outSelected.value = outList[0],
          }
        : {
            outList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            outSelected.value = outList[0],
          };
  }

  getBatteryList() async {
    batteryList.assignAll(data?.data?.batery?.statuses ?? []);
    batteryList.isNotEmpty
        ? {
            batterySelected.value = batteryList[0],
          }
        : {
            batteryList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            batterySelected.value = batteryList[0],
          };
  }

  getShafatList() async {
    shafatList.assignAll(data?.data?.shafat?.statuses ?? []);
    shafatList.isNotEmpty
        ? {
            shafatSelected.value = shafatList[0],
          }
        : {
            shafatList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            shafatSelected.value = shafatList[0],
          };
  }

  getHealthtList() async {
    healthList.assignAll(data?.data?.healthLinking?.statuses ?? []);
    healthList.isNotEmpty
        ? {
            healthSelected.value = healthList[0],
          }
        : {
            healthList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            healthSelected.value = healthList[0],
          };
  }

  getUnitsList() async {
    unitsList.assignAll(data?.data?.unites?.statuses ??
        [
          Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
        ]);
    unitsList.isNotEmpty
        ? {
            unitsSelected.value = unitsList[0],
          }
        : {
            unitsList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            unitsSelected.value = unitsList[0],
          };
  }

  getUnitList() async {
    unitList.assignAll(unitsModel?.data?.statuses ?? []);
    unitList.isNotEmpty
        ? {
            unitSelected.value = unitList[0],
          }
        : {
            unitList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            unitSelected.value = unitsList[0],
          };
  }

  getaccessioresList() async {
    accessioresList.assignAll(data?.data?.accessories?.statuses ?? []);
    accessioresList.isNotEmpty
        ? {
            accessioresSelected.value = accessioresList[0],
          }
        : {
            accessioresList.assignAll([
              Statuses(statusId: 0, defaultDesc: "لاتوجد معلومات"),
            ]),
            accessioresSelected.value = accessioresList[0],
          };
  }

  addClient(BuildContext context) async {
    try {
      if (_name.value.isValid() && _phone.value.isValid()) {
        loading.value = true;
        ClientModel clientModel = await services.addClient(context,
            clientModel: AddClientModel(
                clientAddress: _address.value.value,
                clientName: _name.value.value,
                mobile: _phone.value.value));
        CacheHelper.saveData(
            key: AppConstants.clientId, value: clientModel.data!.clientId);
        nameController.clear();
        phoneController.clear();
        addressController.clear();
        loading.value = false;
      } else {
        loading.value = true;
        showCustomSnackBar("تاكد من ادخال المعلومات بشكل صحيح", context);
      }
    } catch (e) {
      loading.value = true;
    }
  }

  addClientFile(BuildContext context) async {
    try {
      itemsUnites.forEach((element) {
        if (element.itemTypeId == 1) {
          items.add(element);
        }
      });
      itemsAccessiores.forEach((element) {
        if (element.itemTypeId == 3) {
          items.add(element);
        }
      });
      await services.addClientFile(context,
          clientModel: AddClientFileModel(
              clientId: CacheHelper.getData(key: AppConstants.clientId),
              fileTypeId: CacheHelper.getData(key: AppConstants.typeId),
              additionaldiscount: additionalDiscount.value.toInt(),
              clientNeed: clientNeed.value,
              items: items));
      itemsUnites.clear();
      itemsAccessiores.clear();
    } catch (e) {}
  }

  getItemsUnites() {
    items.forEach((element) {
      if (element.itemTypeId == 1) {
        itemsUnites.add(element);
      }
    });
  }

  removeUnites({String? notes}) {
    itemsUnites.removeWhere((element) => element.notes == notes);
    // items.removeWhere((element) => element.notes == notes);
  }

  removeAccessiores({String? notes}) {
    itemsAccessiores.removeWhere((element) => element.notes == notes);
    // items.removeWhere((element) => element.notes == notes);
  }
}
