import 'package:Kitchen_system/model/response/kitchen_model.dart';
import 'package:Kitchen_system/utill/color_resources.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, this.type, this.list, this.onchange});

  final Statuses? type;
  final List<Statuses>? list;
  final Function(Statuses?)? onchange;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(8),
      shadowColor: ColorResources.CATEGORY_SHADOW,
      child: DropdownButtonFormField<Statuses>(
        isExpanded: true,
        value: type,
        onChanged: onchange,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: const BoxConstraints(maxHeight: 50),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none)),
        items: list!.map<DropdownMenuItem<Statuses>>((Statuses type) {
          return DropdownMenuItem<Statuses>(
            value: type,
            child: Text(type.description ?? ""),
          );
        }).toList(),
      ),
    );
  }
}
