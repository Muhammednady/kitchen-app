import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/screens/top/top_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/cache_helper.dart';
import '../../../helper/configs/app_dimensions.dart';
import '../../../model/response/client_emails_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../base/custom_button.dart';
import '../../base/custom_text_field.dart';

class AddTopScreen extends StatelessWidget {
  const AddTopScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TopController());
    bool isCustomerChanged = false;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              20.sBH,
              Text("اضافة توب",
                  style: cairoRegular.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL))),
              20.sBH,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.sBH,
                      InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'معلومات الزبون',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "الزبون",
                                        style: cairoBold.copyWith(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: AppDimensions.font(
                                                Dimensions.FONT_SIZE_EXTRA_SMALL)),
                                      ),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 0,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor: ColorResources.CATEGORY_SHADOW,
                                        child: DropdownButtonFormField<Clients>(
                                          isExpanded: true,
                                          hint: Text('اختر الزبون',
                                              style: TextStyle(color: Colors.grey.shade700)),
                                          value: isCustomerChanged
                                              ? controller.clientsSelected.value
                                              : null,
                                          onChanged: (value) {
                                            controller.clientsSelected.value = value!;
                                            CacheHelper.saveData(
                                                key: AppConstants.clientId,
                                                value: controller.clientsSelected.value.clientId);
                                            controller.getClientsPayment(controller.clientsSelected.value.clientId!);
                                            isCustomerChanged = true;
                                            controller.loading.value = false;
                                          },
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Theme.of(context).cardColor,
                                              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                              constraints: const BoxConstraints(maxHeight: 50),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide.none)),
                                          items: controller.clientsList.map<DropdownMenuItem<Clients>>((Clients type) {
                                            return DropdownMenuItem<Clients>(
                                              value: type,
                                              child: Text(type.clientName ?? ""),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text("رقم",
                                          style: cairoRegular.copyWith(
                                            fontSize: AppDimensions.font(
                                              Dimensions.FONT_SIZE_EXTRA_SMALL,
                                            ),
                                          )),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor: ColorResources.CATEGORY_SHADOW,
                                        child: CustomTextField(
                                          controller: controller.numberFileController,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text("العنوان",
                                          style: cairoRegular.copyWith(
                                            fontSize: AppDimensions.font(
                                              Dimensions.FONT_SIZE_EXTRA_SMALL,
                                            ),
                                          )),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor: ColorResources.CATEGORY_SHADOW,
                                        child: CustomTextField(
                                          controller: controller.clientAddressController,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.sBH,
                      InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'معلومات الطلب',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text("ملف طلب",
                                          style: cairoRegular.copyWith(
                                            fontSize: AppDimensions.font(
                                              Dimensions.FONT_SIZE_EXTRA_SMALL,
                                            ),
                                          )),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor: ColorResources.CATEGORY_SHADOW,
                                        child: DropdownButtonFormField<String>(
                                          isExpanded: true,
                                          value: controller.selectedType!.defaultDesc,
                                          onChanged: (String? value) {
                                            controller.selectedType!.defaultDesc = value!;
                                          },
                                          decoration: InputDecoration(
                                              contentPadding:
                                              const EdgeInsets.symmetric(horizontal: 10),
                                              constraints:
                                              const BoxConstraints(maxHeight: 50),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide.none)),
                                          items: controller.type
                                              .map<DropdownMenuItem<String>>((type) {
                                            return DropdownMenuItem<String>(
                                              value: type.defaultDesc,
                                              // Use the unique identifier for each item
                                              child: Text(type.defaultDesc ?? ""),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text("الجرانيت",
                                          style: cairoRegular.copyWith(
                                            fontSize: AppDimensions.font(
                                              Dimensions.FONT_SIZE_EXTRA_SMALL,
                                            ),
                                          )),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor: ColorResources.CATEGORY_SHADOW,
                                        child: DropdownButtonFormField<String>(
                                          isExpanded: true,
                                          value: controller.selectedType!.defaultDesc,
                                          onChanged: (String? value) {
                                            controller.selectedType!.defaultDesc = value!;
                                          },
                                          decoration: InputDecoration(
                                              contentPadding:
                                              const EdgeInsets.symmetric(horizontal: 10),
                                              constraints:
                                              const BoxConstraints(maxHeight: 50),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide.none)),
                                          items: controller.type
                                              .map<DropdownMenuItem<String>>((type) {
                                            return DropdownMenuItem<String>(
                                              value: type.defaultDesc,
                                              // Use the unique identifier for each item
                                              child: Text(type.defaultDesc ?? ""),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Obx(
                                    () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Dimensions.PADDING_SIZE_SMALL),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text("نوع التوب",
                                            style: cairoRegular.copyWith(
                                              fontSize: AppDimensions.font(
                                                Dimensions.FONT_SIZE_EXTRA_SMALL,
                                              ),
                                            )),
                                      ),
                                      5.sBW,
                                      Expanded(
                                        child: Material(
                                          elevation: 1,
                                          borderRadius: BorderRadius.circular(8),
                                          shadowColor: ColorResources.CATEGORY_SHADOW,
                                          child: DropdownButtonFormField<String>(
                                            isExpanded: true,
                                            value: controller.selectedType!.defaultDesc,
                                            onChanged: (String? value) {
                                              controller.selectedType!.defaultDesc = value!;
                                            },
                                            decoration: InputDecoration(
                                                contentPadding:
                                                const EdgeInsets.symmetric(horizontal: 10),
                                                constraints:
                                                const BoxConstraints(maxHeight: 50),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                    borderSide: BorderSide.none)),
                                            items: controller.type
                                                .map<DropdownMenuItem<String>>((type) {
                                              return DropdownMenuItem<String>(
                                                value: type.defaultDesc,
                                                // Use the unique identifier for each item
                                                child: Text(type.defaultDesc ?? ""),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Obx(
                                    () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Dimensions.PADDING_SIZE_SMALL),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text("لون التوب",
                                            style: cairoRegular.copyWith(
                                              fontSize: AppDimensions.font(
                                                Dimensions.FONT_SIZE_EXTRA_SMALL,
                                              ),
                                            )),
                                      ),
                                      5.sBW,
                                      Expanded(
                                        child: Material(
                                          elevation: 1,
                                          borderRadius: BorderRadius.circular(8),
                                          shadowColor: ColorResources.CATEGORY_SHADOW,
                                          child: DropdownButtonFormField<String>(
                                            isExpanded: true,
                                            value: controller.selectedTopColor!.defaultDesc,
                                            onChanged: (String? value) {
                                              controller.selectedTopColor!.defaultDesc = value!;
                                            },
                                            decoration: InputDecoration(
                                                contentPadding:
                                                const EdgeInsets.symmetric(horizontal: 10),
                                                constraints:
                                                const BoxConstraints(maxHeight: 50),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                    borderSide: BorderSide.none)),
                                            items: controller.topColor
                                                .map<DropdownMenuItem<String>>((type) {
                                              return DropdownMenuItem<String>(
                                                value: type.defaultDesc,
                                                // Use the unique identifier for each item
                                                child: Text(type.defaultDesc ?? ""),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Obx(
                                    () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Dimensions.PADDING_SIZE_SMALL),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text("نوع البانيل",
                                            style: cairoRegular.copyWith(
                                              fontSize: AppDimensions.font(
                                                Dimensions.FONT_SIZE_EXTRA_SMALL,
                                              ),
                                            )),
                                      ),
                                      5.sBW,
                                      Expanded(
                                        child: Material(
                                          elevation: 1,
                                          borderRadius: BorderRadius.circular(8),
                                          shadowColor: ColorResources.CATEGORY_SHADOW,
                                          child: DropdownButtonFormField<String>(
                                            isExpanded: true,
                                            value: controller.selectedPanelType!.defaultDesc,
                                            onChanged: (String? value) {
                                              controller.selectedPanelType!.defaultDesc =
                                              value!;
                                            },
                                            decoration: InputDecoration(
                                                contentPadding:
                                                const EdgeInsets.symmetric(horizontal: 10),
                                                constraints:
                                                const BoxConstraints(maxHeight: 50),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                    borderSide: BorderSide.none)),
                                            items: controller.panelType
                                                .map<DropdownMenuItem<String>>((type) {
                                              return DropdownMenuItem<String>(
                                                value: type.defaultDesc,
                                                // Use the unique identifier for each item
                                                child: Text(type.defaultDesc ?? ""),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Obx(
                                    () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Dimensions.PADDING_SIZE_SMALL),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text("ارتفاع التوب",
                                            style: cairoRegular.copyWith(
                                              fontSize: AppDimensions.font(
                                                Dimensions.FONT_SIZE_EXTRA_SMALL,
                                              ),
                                            )),
                                      ),
                                      5.sBW,
                                      Expanded(
                                        child: Material(
                                          elevation: 1,
                                          borderRadius: BorderRadius.circular(8),
                                          shadowColor: ColorResources.CATEGORY_SHADOW,
                                          child: DropdownButtonFormField<String>(
                                            isExpanded: true,
                                            value: controller.selectedTopHeight!.defaultDesc,
                                            onChanged: (String? value) {
                                              controller.selectedTopHeight!.defaultDesc =
                                              value!;
                                            },
                                            decoration: InputDecoration(
                                                contentPadding:
                                                const EdgeInsets.symmetric(horizontal: 10),
                                                constraints:
                                                const BoxConstraints(maxHeight: 50),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                    borderSide: BorderSide.none)),
                                            items: controller.topHeight
                                                .map<DropdownMenuItem<String>>((type) {
                                              return DropdownMenuItem<String>(
                                                value: type.defaultDesc,
                                                // Use the unique identifier for each item
                                                child: Text(type.defaultDesc ?? ""),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text("سماكة التوب",
                                          style: cairoRegular.copyWith(
                                            fontSize: AppDimensions.font(
                                              Dimensions.FONT_SIZE_EXTRA_SMALL,
                                            ),
                                          )),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor: ColorResources.CATEGORY_SHADOW,
                                        child: DropdownButtonFormField<String>(
                                          isExpanded: true,
                                          value: controller.selectedType!.defaultDesc,
                                          onChanged: (String? value) {
                                            controller.selectedType!.defaultDesc = value!;
                                          },
                                          decoration: InputDecoration(
                                              contentPadding:
                                              const EdgeInsets.symmetric(horizontal: 10),
                                              constraints:
                                              const BoxConstraints(maxHeight: 50),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide.none)),
                                          items: controller.type
                                              .map<DropdownMenuItem<String>>((type) {
                                            return DropdownMenuItem<String>(
                                              value: type.defaultDesc,
                                              // Use the unique identifier for each item
                                              child: Text(type.defaultDesc ?? ""),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Obx(
                                    () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Dimensions.PADDING_SIZE_SMALL),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text("حفرة المجلي",
                                            style: cairoRegular.copyWith(
                                              fontSize: AppDimensions.font(
                                                Dimensions.FONT_SIZE_EXTRA_SMALL,
                                              ),
                                            )),
                                      ),
                                      5.sBW,
                                      Expanded(
                                        child: Material(
                                          elevation: 1,
                                          borderRadius: BorderRadius.circular(8),
                                          shadowColor: ColorResources.CATEGORY_SHADOW,
                                          child: DropdownButtonFormField<String>(
                                            isExpanded: true,
                                            value: controller.selectedSinkHole!.defaultDesc,
                                            onChanged: (String? value) {
                                              controller.selectedSinkHole!.defaultDesc = value!;
                                            },
                                            decoration: InputDecoration(
                                                contentPadding:
                                                const EdgeInsets.symmetric(horizontal: 10),
                                                constraints:
                                                const BoxConstraints(maxHeight: 50),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                    borderSide: BorderSide.none)),
                                            items: controller.sinkHole
                                                .map<DropdownMenuItem<String>>((type) {
                                              return DropdownMenuItem<String>(
                                                value: type.defaultDesc,
                                                // Use the unique identifier for each item
                                                child: Text(type.defaultDesc ?? ""),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.sBH,
                      InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'معلومات الاجهزة',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text("الطول",
                                          style: cairoRegular.copyWith(
                                            fontSize: AppDimensions.font(
                                              Dimensions.FONT_SIZE_EXTRA_SMALL,
                                            ),
                                          )),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor: ColorResources.CATEGORY_SHADOW,
                                        child: CustomTextField(
                                          controller: controller.heightController,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text("العرض",
                                          style: cairoRegular.copyWith(
                                            fontSize: AppDimensions.font(
                                              Dimensions.FONT_SIZE_EXTRA_SMALL,
                                            ),
                                          )),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor: ColorResources.CATEGORY_SHADOW,
                                        child: CustomTextField(
                                          controller: controller.widthController,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text("الارتفاع",
                                          style: cairoRegular.copyWith(
                                            fontSize: AppDimensions.font(
                                              Dimensions.FONT_SIZE_EXTRA_SMALL,
                                            ),
                                          )),
                                    ),
                                    5.sBW,
                                    Expanded(
                                      child: Material(
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(8),
                                        shadowColor: ColorResources.CATEGORY_SHADOW,
                                        child: CustomTextField(
                                          controller: controller.riseController,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.sBH,
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: CustomTextField(
                                  maxLines: 3,
                                  hintText: 'ادخل الملاحظة',
                                  controller: controller.noteController,
                                  validatorMessage: 'لا يجب ان تكون الملاحظة فارغة',
                                ),
                              ),
                            ),
                            10.sBH,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  width: AppDimensions.space(Dimensions.FONT_SIZE_EXTRA_SMALL),
                                  radius: 9,
                                  onPressed: () {},
                                  buttonText: "تحميل مرفق",
                                  icon: Images.add,
                                ),
                                20.sBW,
                                CustomButton(
                                  width: AppDimensions.space(Dimensions.FONT_SIZE_EXTRA_SMALL),
                                  radius: 9,
                                  onPressed: () {},
                                  buttonText: "إضافة",
                                  icon: Images.add,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              10.sBH,
              CustomButton(
                width: AppDimensions.space(Dimensions.FONT_SIZE_EXTRA_SMALL),
                radius: 9,
                onPressed: () {
                  // CacheHelper.saveData(
                  //     key: AppConstants.typeId,
                  //     value: controller.checkedValue.value);
                  //  Get.to(() => const PriceDetailsScreen());
                },
                buttonText: "إضافة",
                icon: Images.add,
              ),
              10.sBH,
            ],
          ),
        ),
      ),
    );
  }
}
