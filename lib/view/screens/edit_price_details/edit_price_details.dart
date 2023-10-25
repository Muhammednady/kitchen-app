import 'package:Kitchen_system/enum/view_state.dart';
import 'package:Kitchen_system/helper/configs/app.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/model/body/add_client_file_model.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/base/custom_drop_down.dart';
import 'package:Kitchen_system/view/base/drop_down_widget.dart';
import 'package:Kitchen_system/view/base/row_text_field.dart';
import 'package:Kitchen_system/view/screens/edit_price_details/controller/edit_price_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPriceDetailsScreen extends StatelessWidget {
  const EditPriceDetailsScreen({super.key, this.id});

  final int? id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditPriceDetailsController());
    AppSetting.init(context);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
            ),
            centerTitle: true,
            title: Text(
              "عرض الاسعار",
              style: cairoBold.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize:
                      AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
            )),
        body: Obx(
          () => controller.state == ViewState.busy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Row(
                      children: [
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Text(
                          "المطبخ ",
                          style: cairoBold.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: AppDimensions.font(
                                  Dimensions.FONT_SIZE_EXTRA_SMALL)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "الجرانيت",
                                  type: controller.garanetSelected.value,
                                  list: controller.granetList,
                                  onchange: (value) {
                                    controller.garanetSelected.value = value!;
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: CustomRowTextField(
                          label: "العدد",
                          type: TextInputType.number,
                          onSubmit: (v) {
                            controller.items.add(Items(
                              itemCount: int.parse(v ?? "0"),
                              itemTypeId: 4,
                              // categoryId: controller.data?.data
                              //     ?.garanet?.statusCategoryId,
                              itemId: controller.garanetSelected.value.statusId,
                            ));
                          },
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "تصفيح الجدران",
                                  type: controller.wallSelected.value,
                                  list: controller.wallList,
                                  onchange: (value) {
                                    controller.wallSelected.value = value!;
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: CustomRowTextField(
                          label: "العدد",
                          type: TextInputType.number,
                          onSubmit: (v) {
                            controller.items.add(Items(
                              itemCount: int.parse(v ?? "0"),
                              itemTypeId: 4,
                              // categoryId: controller
                              //     .data
                              //     ?.data
                              //     ?.platingTopWall
                              //     ?.statusCategoryId,
                              itemId: controller.wallSelected.value.statusId,
                            ));
                          },
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "تسميك التوب",
                                  type: controller.thickeningSelected.value,
                                  list: controller.thickeningList,
                                  onchange: (value) {
                                    controller.thickeningSelected.value =
                                        value!;
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: CustomRowTextField(
                          label: "العدد",
                          type: TextInputType.number,
                          onSubmit: (v) {
                            controller.items.add(Items(
                              itemCount: int.parse(v ?? "0"),
                              itemTypeId: 4,
                              // categoryId: controller.data?.data
                              //     ?.thickeningTop?.statusCategoryId,
                              itemId:
                                  controller.thickeningSelected.value.statusId,
                            ));
                          },
                        ))
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: Obx(() => DropDownWidget(
                    //               label: "تصفيح الخشب",
                    //               type:
                    //                   controller.woodSelected.value,
                    //               list: controller.woodList,
                    //               onchange: (value) {
                    //                 controller.woodSelected.value =
                    //                     value!;
                    //               },
                    //             ))),
                    //     AppDimensions.space(Dimensions.heightSmall)
                    //         .sBW,
                    //     const Expanded(
                    //         child:
                    //             CustomRowTextField(label: "العدد"))
                    //   ],
                    // ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "البانيل",
                                  type: controller.pannelSelected.value,
                                  list: controller.pannelList,
                                  onchange: (value) {
                                    controller.pannelSelected.value = value!;
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: CustomRowTextField(
                          label: "العدد",
                          type: TextInputType.number,
                          onSubmit: (v) {
                            controller.items.add(Items(
                              itemCount: int.parse(v ?? "0"),
                              itemTypeId: 4,
                              // categoryId: controller.data?.data
                              //     ?.panel?.statusCategoryId,
                              itemId: controller.pannelSelected.value.statusId,
                            ));
                          },
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "نوع الايادى",
                                  type: controller.handSelected.value,
                                  list: controller.handList,
                                  onchange: (value) {
                                    controller.handSelected.value = value!;
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: CustomRowTextField(
                          label: "العدد",
                          type: TextInputType.number,
                          onSubmit: (v) {
                            controller.items.add(Items(
                              itemCount: int.parse(v ?? "0"),
                              itemTypeId: 4,
                              // categoryId: controller.data?.data
                              //     ?.handType?.statusCategoryId,
                              itemId: controller.handSelected.value.statusId,
                            ));
                          },
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "الكورنيش",
                                  type: controller.cornashSelected.value,
                                  list: controller.cornashList,
                                  onchange: (value) {
                                    controller.cornashSelected.value = value!;
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: CustomRowTextField(
                          label: "العدد",
                          type: TextInputType.number,
                          onSubmit: (v) {
                            controller.items.add(Items(
                              itemCount: int.parse(v ?? "0"),
                              itemTypeId: 4,
                              // categoryId: controller.data?.data
                              //     ?.corniche?.statusCategoryId,
                              itemId: controller.cornashSelected.value.statusId,
                            ));
                          },
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "الاناره",
                                  type: controller.lightingSelected.value,
                                  list: controller.lightingList,
                                  onchange: (value) {
                                    controller.lightingSelected.value = value!;
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: CustomRowTextField(
                          label: "العدد",
                          type: TextInputType.number,
                          onSubmit: (v) {
                            controller.items.add(Items(
                              itemCount: int.parse(v ?? "0"),
                              itemTypeId: 4,
                              // categoryId: controller.data?.data
                              //     ?.lighting?.statusCategoryId,
                              itemId:
                                  controller.lightingSelected.value.statusId,
                            ));
                          },
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "المجلى",
                                  type: controller.maglaSelected.value,
                                  list: controller.maglaList,
                                  onchange: (value) {
                                    controller.maglaSelected.value = value!;
                                    controller.items.add(Items(
                                      itemTypeId: 4,
                                      // categoryId: controller
                                      //     .data
                                      //     ?.data
                                      //     ?.magla
                                      //     ?.statusCategoryId,
                                      itemId: controller
                                          .maglaSelected.value.statusId,
                                    ));
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "حفره المجلى",
                                  type: controller.maglaHoleSelected.value,
                                  list: controller.maglaHoleList,
                                  onchange: (value) {
                                    controller.maglaHoleSelected.value = value!;
                                    controller.items.add(Items(
                                      itemTypeId: 4,
                                      // categoryId: controller
                                      //     .data
                                      //     ?.data
                                      //     ?.maglaHole
                                      //     ?.statusCategoryId,
                                      itemId: controller
                                          .maglaHoleSelected.value.statusId,
                                    ));
                                  },
                                ))),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "سترب خارجي",
                                  type: controller.outSelected.value,
                                  list: controller.outList,
                                  onchange: (value) {
                                    controller.outSelected.value = value!;
                                    controller.items.add(Items(
                                      itemTypeId: 4,
                                      // categoryId: controller
                                      //     .data
                                      //     ?.data
                                      //     ?.outerStrop
                                      //     ?.statusCategoryId,
                                      itemId:
                                          controller.outSelected.value.statusId,
                                    ));
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "شفاط",
                                  type: controller.shafatSelected.value,
                                  list: controller.shafatList,
                                  onchange: (value) {
                                    controller.shafatSelected.value = value!;
                                    controller.items.add(Items(
                                      itemTypeId: 4,
                                      // categoryId: controller
                                      //     .data
                                      //     ?.data
                                      //     ?.shafat
                                      //     ?.statusCategoryId,
                                      itemId: controller
                                          .shafatSelected.value.statusId,
                                    ));
                                  },
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "البطارية",
                                  type: controller.batterySelected.value,
                                  list: controller.batteryList,
                                  onchange: (value) {
                                    controller.batterySelected.value = value!;
                                    controller.items.add(Items(
                                      itemTypeId: 4,
                                      // categoryId: controller
                                      //     .data
                                      //     ?.data
                                      //     ?.batery
                                      //     ?.statusCategoryId,
                                      itemId: controller
                                          .batterySelected.value.statusId,
                                    ));
                                  },
                                ))),
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Expanded(
                            child: Obx(() => DropDownWidget(
                                  label: "توصيلات صحيه",
                                  type: controller.healthSelected.value,
                                  list: controller.healthList,
                                  onchange: (value) {
                                    controller.healthSelected.value = value!;
                                    controller.items.add(Items(
                                      itemTypeId: 4,
                                      // categoryId: controller
                                      //     .data
                                      //     ?.data
                                      //     ?.healthLinking
                                      //     ?.statusCategoryId,
                                      itemId: controller
                                          .healthSelected.value.statusId,
                                    ));
                                  },
                                ))),
                      ],
                    ),
                    CustomRowTextField(
                        label: "خصم اضافى",
                        onChange: (v) {
                          controller.additionalDiscount.value =
                              double.parse(v ?? "0.0");
                        },
                        type: TextInputType.number),
                    CustomRowTextField(
                        label: "متطلبات العميل",
                        onChange: (v) {
                          controller.clientNeed.value = v;
                        },
                        type: TextInputType.text),
                    const Divider(endIndent: 20, indent: 20),
                    Row(
                      children: [
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Text(
                          "الوحدات ",
                          style: cairoBold.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: AppDimensions.font(
                                  Dimensions.FONT_SIZE_EXTRA_SMALL)),
                        )
                      ],
                    ),
                    Obx(() => CustomDropDown(
                          type: controller.unitsSelected.value,
                          list: controller.unitsList,
                          onchange: (value) {
                            controller.unitsSelected.value = value!;
                          },
                        )),
                    20.sBH,
                    Obx(() => Row(
                          children: [
                            Text("الوحده",
                                style: cairoRegular.copyWith(
                                  fontSize: AppDimensions.font(
                                    Dimensions.FONT_SIZE_EXTRA_SMALL,
                                  ),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: CustomDropDown(
                                type: controller.unitSelected.value,
                                list: controller.unitList,
                                onchange: (value) {
                                  controller.unitSelected.value = value!;
                                },
                              ),
                            ),
                          ],
                        )),
                    Row(
                      children: [
                        Expanded(
                            child: CustomRowTextField(
                          controller: controller.numberController,
                          label: "العدد",
                          onChange: (v) {
                            controller.number.value = int.parse(v ?? "0");
                          },
                        )),
                        Expanded(
                            child: CustomRowTextField(
                          controller: controller.priceController,
                          label: "السعر",
                          onChange: (v) {
                            controller.price.value = double.parse(v ?? "0");
                          },
                        ))
                      ],
                    ),
                    CustomRowTextField(
                        controller: controller.noteController,
                        label: "ملاحظات",
                        onChange: (v) {
                          controller.notes.value = v;
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.itemsUnites.add(Items(
                                itemCount: controller.number.value,
                                itemPrice: controller.price.value.toInt(),
                                notes: controller.notes.value,
                                itemTypeId: 1,
                                categoryId:
                                    controller.unitsSelected.value.statusId,
                                itemId: controller.unitSelected.value.statusId,
                              ));
                              controller.number.value = 0;
                              controller.price.value = 0.0;
                              controller.notes.value = "";
                              controller.numberController.clear();
                              controller.priceController.clear();
                              controller.noteController.clear();
                            },
                            child: Text("إضافة؟",
                                style: cairoRegular.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                    Obx(() => controller.itemsUnites.isEmpty
                        ? const SizedBox()
                        : Column(
                            children: [
                              Row(children: [
                                AppDimensions.space(
                                        Dimensions.PADDING_SIZE_EXTRA_SMALL)
                                    .sBW,
                                Expanded(
                                  child: Text(
                                    "الاسم",
                                    style: cairoMedium.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: AppDimensions.font(
                                            Dimensions.FONT_SIZE_EXTRA_SMALL)),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "السعر",
                                    style: cairoMedium.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: AppDimensions.font(
                                            Dimensions.FONT_SIZE_EXTRA_SMALL)),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "الحذف",
                                    style: cairoMedium.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: AppDimensions.font(
                                            Dimensions.FONT_SIZE_EXTRA_SMALL)),
                                  ),
                                ),
                              ]),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.itemsUnites.length,
                                  itemBuilder: (_, index) => Row(
                                        children: [
                                          AppDimensions.space(Dimensions
                                                  .PADDING_SIZE_EXTRA_SMALL)
                                              .sBW,
                                          Expanded(
                                            child: Text(
                                              controller.itemsUnites[index]
                                                      .notes ??
                                                  "",
                                              style: cairoMedium.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: AppDimensions.font(
                                                      Dimensions
                                                          .FONT_SIZE_EXTRA_SMALL)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller.itemsUnites[index]
                                                      .itemPrice
                                                      .toString() ??
                                                  "",
                                              style: cairoMedium.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: AppDimensions.font(
                                                      Dimensions
                                                          .FONT_SIZE_EXTRA_SMALL)),
                                            ),
                                          ),
                                          Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    controller.removeUnites(
                                                      notes: controller
                                                              .itemsUnites[
                                                                  index]
                                                              .notes ??
                                                          "",
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  )))
                                        ],
                                      ))
                            ],
                          )),

                    Divider(endIndent: 20, indent: 20),
                    Row(
                      children: [
                        AppDimensions.space(Dimensions.heightSmall).sBW,
                        Text(
                          "إضافات ",
                          style: cairoBold.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: AppDimensions.font(
                                  Dimensions.FONT_SIZE_EXTRA_SMALL)),
                        )
                      ],
                    ),
                    Obx(() => Row(
                          children: [
                            Text("الاكسسورات",
                                style: cairoRegular.copyWith(
                                  fontSize: AppDimensions.font(
                                    Dimensions.FONT_SIZE_EXTRA_SMALL,
                                  ),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: CustomDropDown(
                                type: controller.accessioresSelected.value,
                                list: controller.accessioresList,
                                onchange: (value) {
                                  controller.accessioresSelected.value = value!;
                                },
                              ),
                            ),
                          ],
                        )),
                    Row(
                      children: [
                        Expanded(
                            child: CustomRowTextField(
                          controller: controller.numberAccessioresController,
                          label: "العدد",
                          onChange: (v) {
                            controller.numberAccessiores.value =
                                int.parse(v ?? "0");
                          },
                        )),
                        Expanded(
                            child: CustomRowTextField(
                          controller: controller.priceAccessioresController,
                          label: "السعر",
                          onChange: (v) {
                            controller.priceAccessiores.value =
                                double.parse(v ?? "0");
                          },
                        ))
                      ],
                    ),
                    CustomRowTextField(
                        controller: controller.notesAccessioresController,
                        label: "ملاحظات",
                        onChange: (v) {
                          controller.notesAccessiores.value = v;
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.itemsAccessiores.add(Items(
                                itemCount: controller.numberAccessiores.value,
                                itemPrice:
                                    controller.priceAccessiores.value.toInt(),
                                notes: controller.notesAccessiores.value,
                                itemTypeId: 3,
                                // categoryId: controller.data?.data
                                //     ?.accessories?.statusCategoryId,
                                itemId: controller
                                    .accessioresSelected.value.statusId,
                              ));
                              controller.numberAccessiores.value = 0;
                              controller.priceAccessiores.value = 0.0;
                              controller.notesAccessiores.value = "";
                              controller.priceAccessioresController.clear();
                              controller.notesAccessioresController.clear();
                              controller.numberAccessioresController.clear();
                            },
                            child: Text("إضافة؟",
                                style: cairoRegular.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                    Divider(endIndent: 20, indent: 20),
                    Obx(() => controller.itemsAccessiores.isEmpty
                        ? const SizedBox()
                        : Column(
                            children: [
                              Row(children: [
                                AppDimensions.space(
                                        Dimensions.PADDING_SIZE_EXTRA_SMALL)
                                    .sBW,
                                Expanded(
                                  child: Text(
                                    "الاسم",
                                    style: cairoMedium.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: AppDimensions.font(
                                            Dimensions.FONT_SIZE_EXTRA_SMALL)),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "السعر",
                                    style: cairoMedium.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: AppDimensions.font(
                                            Dimensions.FONT_SIZE_EXTRA_SMALL)),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "الحذف",
                                    style: cairoMedium.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: AppDimensions.font(
                                            Dimensions.FONT_SIZE_EXTRA_SMALL)),
                                  ),
                                ),
                              ]),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.itemsAccessiores.length,
                                  itemBuilder: (_, index) => Row(
                                        children: [
                                          AppDimensions.space(Dimensions
                                                  .PADDING_SIZE_EXTRA_SMALL)
                                              .sBW,
                                          Expanded(
                                            child: Text(
                                              controller.itemsAccessiores[index]
                                                      .notes ??
                                                  "",
                                              style: cairoMedium.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: AppDimensions.font(
                                                      Dimensions
                                                          .FONT_SIZE_EXTRA_SMALL)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller.itemsAccessiores[index]
                                                      .itemPrice
                                                      .toString() ??
                                                  "",
                                              style: cairoMedium.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: AppDimensions.font(
                                                      Dimensions
                                                          .FONT_SIZE_EXTRA_SMALL)),
                                            ),
                                          ),
                                          Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .removeAccessiores(
                                                      notes: controller
                                                              .itemsAccessiores[
                                                                  index]
                                                              .notes ??
                                                          "",
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  )))
                                        ],
                                      ))
                            ],
                          )),

                    const Divider(endIndent: 20, indent: 20),
                    CustomButton(
                      width: AppDimensions.space(Dimensions.PADDING_SIZE_SMALL),
                      onPressed: () {
                        controller.updateClientFile(context, id: id);
                      },
                      buttonText: "تعديل",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
        ));
  }
}
