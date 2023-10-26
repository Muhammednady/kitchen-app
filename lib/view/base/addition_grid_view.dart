import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class AdditionGridView extends StatelessWidget {
   AdditionGridView({Key? key, required this.controller,}) : super(key: key);
late var controller;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.labels.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 0.7, crossAxisCount: 2),
      itemBuilder: (_, index) => Obx(() => RadioListTile(
        title: Text(controller.labels[index].label!),
        value: controller.labels[index],
        groupValue: controller.groupValue.value,
        onChanged: (value) {
          controller.groupValue.value = value!;
          controller.checkedValue.value =
          controller.groupValue.value.id!;
          controller.getShortClient();
        },
      )),
    );
  }
}
