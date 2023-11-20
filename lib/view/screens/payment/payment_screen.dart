import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/screens/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../enum/view_state.dart';
import '../../../helper/configs/app.dart';
import '../../../helper/configs/app_dimensions.dart';
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
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    20.sBH,
                    Expanded(
                      child: CustomRowTextField(
                        label: "الزبون",
                        type: TextInputType.number,
                        onSubmit: (v) {
                          // controller.items.add(Items(
                          //   itemCount: int.parse(v ?? "0"),
                          //   itemTypeId: 4,
                          //   // categoryId: controller.data?.data
                          //   //     ?.garanet?.statusCategoryId,
                          //   itemId: controller.garanetSelected.value.statusId,
                          // ));
                        },
                      ),
                    ),
                    Expanded (
                      child: CustomRowTextField(
                        label: "الاجمالي",
                        type: TextInputType.number,
                        onSubmit: (v) {
                          // controller.items.add(Items(
                          //   itemCount: int.parse(v ?? "0"),
                           //   itemTypeId: 4,
                          //   // categoryId: controller.data?.data
                          //   //     ?.garanet?.statusCategoryId,
                          //   itemId: controller.garanetSelected.value.statusId,
                          // ));
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomRowTextField(
                        label: "المدفوع",
                         type: TextInputType.number,
                        onSubmit: (v) {
                          // controller.items.add(Items(
                          //   itemCount: int.parse(v ?? "0"),
                          //   itemTypeId: 4,
                          //   // categoryId: controller.data?.data
                          //   //     ?.garanet?.statusCategoryId,
                          //   itemId: controller.garanetSelected.value.statusId,
                           // ));
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomRowTextField(
                        label: "المتبقي",
                        type: TextInputType.number,
                        onSubmit: (v) {
                          // controller.items.add(Items(
                          //   itemCount: int.parse(v ?? "0"),
                          //   itemTypeId: 4,
                          //   // categoryId: controller.data?.data
                          //   //     ?.garanet?.statusCategoryId,
                          //   itemId: controller.garanetSelected.value.statusId,
                          // ));
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: DropDownUsersWidget(
                          label: "التاريخ",
                          type: controller.userSelected.value,
                          list: controller.usersList,
                          onchange: (value) {
                            // controller.userSelected.value = value!;
                            // controller.userSelectedFilter.value =
                            // controller.userSelected.value.id!;
                            // controller.getShortClient();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomRowTextField(
                        label: "رقم",
                         type: TextInputType.number,
                        onSubmit: (v) {
                          // controller.items.add(Items(
                          //   itemCount: int.parse(v ?? "0"),
                          //   itemTypeId: 4,
                          //   // categoryId: controller.data?.data
                          //   //     ?.garanet?.statusCategoryId,
                          //   itemId: controller.garanetSelected.value.statusId,
                          // ));
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomRowTextField(
                        label: "المبلغ",
                        type: TextInputType.number,
                        onSubmit: (v) {
                          // controller.items.add(Items(
                          //   itemCount: int.parse(v ?? "0"),
                          //   itemTypeId: 4,
                          //   // categoryId: controller.data?.data
                          //   //     ?.garanet?.statusCategoryId,
                          //   itemId: controller.garanetSelected.value.statusId,
                          // ));
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomRowTextField(
                         label: "ملاحظات",
                        type: TextInputType.number,
                        onSubmit: (v) {
                          // controller.items.add(Items(
                          //   itemCount: int.parse(v ?? "0"),
                          //   itemTypeId: 4,
                          //   // categoryId: controller.data?.data
                          //   //     ?.garanet?.statusCategoryId,
                          //   itemId: controller.garanetSelected.value.statusId,
                          // ));
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: DropDownUsersWidget(
                          label: "طريقة الدفع",
                          type: controller.userSelected.value,
                          list: controller.usersList,
                          onchange: (value) {
                            // controller.userSelected.value = value!;
                            // controller.userSelectedFilter.value =
                            // controller.userSelected.value.id!;
                            // controller.getShortClient();
                          },
                        ),
                      ),
                    ), 
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropDownUsersWidget(
                      label: "مندوب المبيعات",
                      type: controller.userSelected.value,
                      list: controller.usersList,
                      onchange: (value) {
                        // controller.userSelected.value = value!;
                        // controller.userSelectedFilter.value =
                        // controller.userSelected.value.id!;
                        // controller.getShortClient();
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
        ));
  }
}