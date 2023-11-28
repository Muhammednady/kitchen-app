import 'package:Kitchen_system/model/response/client_emails_model.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/screens/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../enum/view_state.dart';
import '../../../helper/cache_helper.dart';
import '../../../helper/configs/app.dart';
import '../../../helper/configs/app_dimensions.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';
import '../../base/custom_drawer.dart';
import '../../base/drop_down_users.dart';
import '../../base/row_text_field.dart';
import '../home/home_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final controller = Get.put(PaymentController());
    controller.selected.value = 10.obs();

    AppSetting.init(context);
    var paymentValue = ''.obs;

    return WillPopScope(
        onWillPop: () async {
          Get.offAll(const HomeScreen());
          return true;
        },
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
                onTap: () {
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState?.openEndDrawer();
                  } else {
                    scaffoldKey.currentState?.openDrawer();
                  }
                },
                child: Icon(Icons.menu, color: Theme.of(context).primaryColor)),
            centerTitle: true,
            title: Text("سندات القبض",
                style: cairoRegular.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL))),
          ),
          drawer: CustomDrawer(
            controller: controller,
            scaffoldKey: scaffoldKey,
          ),
          body: Obx(
            () => controller.state == ViewState.busy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          20.sBH,
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "الزبون",
                                        style: cairoBold.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: AppDimensions.font(
                                                Dimensions
                                                    .FONT_SIZE_EXTRA_SMALL)),
                                      ),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 0,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor:
                                            ColorResources.CATEGORY_SHADOW,
                                        child: DropdownButtonFormField<Clients>(
                                          isExpanded: true,
                                          value:
                                              controller.clientsSelected.value,
                                          onChanged: (value) {
                                            controller.clientsSelected.value =
                                                value!;
                                            CacheHelper.saveData(
                                                key: AppConstants.clientId,
                                                value: controller
                                                    .clientsSelected
                                                    .value
                                                    .clientId);
                                            controller.getClientsPayment(
                                                controller.clientsSelected.value
                                                    .clientId!);
                                            controller.loading.value = false;
                                          },
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor:
                                                  Theme.of(context).cardColor,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              constraints: const BoxConstraints(
                                                  maxHeight: 50),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide.none)),
                                          items: controller.clientsList
                                              .map<DropdownMenuItem<Clients>>(
                                                  (Clients type) {
                                            return DropdownMenuItem<Clients>(
                                              value: type,
                                              child:
                                                  Text(type.clientName ?? ""),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              /*
                              Obx(() => CustomDropDownClients(
                          type: controller.clientsSelected.value,
                          list: controller.clientsList,
                          onchange: (value) {
                            controller.clientsSelected.value = value!;
                            CacheHelper.saveData(
                                key: AppConstants.clientId,
                                value: controller
                                    .clientsSelected.value.clientId);
                            controller.loading.value = false;
                          },
                          )),
                             */
                              ),
                          Expanded(
                            child: CustomRowTextField(
                              label: "الاجمالي",
                              controller: controller.amountController,
                              type: TextInputType.number,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          Expanded(
                            child: CustomRowTextField(
                              label: "المدفوع",
                              type: TextInputType.number,
                              controller: controller.paidController,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          Expanded(
                            child: CustomRowTextField(
                              controller: controller.remainingController,
                              label: "المتبقي",
                              type: TextInputType.number,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          Expanded(
                            child: CustomRowTextField(
                              isDisable: true,
                              label: "التاريخ",
                              controller: controller.dateController,
                              onTap: () {
                                controller.selectDate(context);
                              },
                              // type: TextInputType.number,
                            ),
                          ),
                          const Expanded(
                            child: CustomRowTextField(
                              label: "رقم",
                              type: TextInputType.number,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          const Expanded(
                            child: CustomRowTextField(
                              label: "المبلغ",
                              type: TextInputType.number,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          const Expanded(
                            child: CustomRowTextField(
                              label: "ملاحظات",
                              type: TextInputType.text,
                              // onSubmit: (v) {
                              //   // controller.items.add(Items(
                              //   //   itemCount: int.parse(v ?? "0"),
                              //   //   itemTypeId: 4,
                              //   //   // categoryId: controller.data?.data
                              //   //   //     ?.garanet?.statusCategoryId,
                              //   //   itemId: controller.garanetSelected.value.statusId,
                              //   // ));
                              // },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.PADDING_SIZE_SMALL),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "طريقة الدفع",
                                          style: cairoBold.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: AppDimensions.font(
                                                  Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL)),
                                        ),
                                      ),
                                      5.sBW,
                                      Expanded(
                                        child: Material(
                                          elevation: 0,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          shadowColor:
                                              ColorResources.CATEGORY_SHADOW,
                                          child:
                                              DropdownButtonFormField<String>(
                                            isExpanded: true,
                                            hint:
                                                const Text('اختر طريقه الدفع '),
                                            value: controller.selectedPayment,
                                            onChanged: (value) {
                                              controller.selectedPayment =
                                                  value;
                                              paymentValue.value = value!;
                                            },
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    Theme.of(context).cardColor,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                constraints:
                                                    const BoxConstraints(
                                                        maxHeight: 50),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        BorderSide.none)),
                                            items: controller.paymentMethods
                                                .map<DropdownMenuItem<String>>(
                                                    (String type) {
                                              return DropdownMenuItem<String>(
                                                value: type,
                                                child: Text(type),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          Obx(
                            () => Visibility(
                                visible: paymentValue.value ==
                                    controller.paymentMethods[1],
                                child: Column(
                                  children: [
                                    5.sBH,
                                    CustomRowTextField(
                                      isDisable: true,
                                      label: "تاريخ الشيك",
                                      controller: controller.dateController,
                                      onTap: () {
                                        controller.selectDate(context);
                                      },
                                      // type: TextInputType.number,
                                    ),
                                    5.sBH,
                                    const CustomRowTextField(
                                      label: "رقم الشيك",
                                      type: TextInputType.number,
                                      // onSubmit: (v) {
                                      //   // controller.items.add(Items(
                                      //   //   itemCount: int.parse(v ?? "0"),
                                      //   //   itemTypeId: 4,
                                      //   //   // categoryId: controller.data?.data
                                      //   //   //     ?.garanet?.statusCategoryId,
                                      //   //   itemId: controller.garanetSelected.value.statusId,
                                      //   // ));
                                      // },
                                    ),
                                    5.sBH,
                                    const CustomRowTextField(
                                      label: "اسم الساحب",
                                      type: TextInputType.text,
                                      // onSubmit: (v) {
                                      //   // controller.items.add(Items(
                                      //   //   itemCount: int.parse(v ?? "0"),
                                      //   //   itemTypeId: 4,
                                      //   //   // categoryId: controller.data?.data
                                      //   //   //     ?.garanet?.statusCategoryId,
                                      //   //   itemId: controller.garanetSelected.value.statusId,
                                      //   // ));
                                      // },
                                    ),
                                    5.sBH,
                                  ],
                                )),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: DropDownUsersWidget(
                                hint: 'اختر مندوب المبيعات',
                                label: "مندوب المبيعات",
                                type: controller.userSelected.value,
                                list: controller.usersList,
                                onchange: (value) {
                                  controller.userSelected.value = value!;
                                  controller.userSelectedFilter.value =
                                      controller.userSelected.value.id!;
                                  //controller.getShortClient();
                                },
                              ),
                            ),
                          ),
                          32.sBH,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomButton(
                                buttonText: 'حفظ',
                                height: 40,
                                width: 100,
                                onPressed: () {},
                              ),
                              CustomButton(
                                buttonText: 'عودة',
                                height: 40,
                                width: 100,
                                onPressed: () {},
                                hasColor: false,
                                bgColor: Colors.grey.shade300,
                              ),
                            ],
                          ),
                          80.sBH
                        ],
                      ),
                    ),
                  ),
          ),
        ));
  }
}
