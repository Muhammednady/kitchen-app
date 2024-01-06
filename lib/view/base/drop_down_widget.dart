import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/model/response/departments_list_model.dart';
import 'package:Kitchen_system/model/response/kitchen_model.dart';
import 'package:Kitchen_system/utill/color_resources.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget(
      {Key? key, this.type, required this.list, this.onchange, this.label = ""})
      : super(key: key);
  final Statuses? type;
  final List<Statuses> list;
  final Function(Statuses?)? onchange;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(label ?? "",
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
            ),
          ),
        ],
      ),
    );
  }
}
