import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/model/response/departments_list_model.dart';
import 'package:Kitchen_system/model/response/kitchen_model.dart';
import 'package:Kitchen_system/model/response/user_ids_model.dart';
import 'package:Kitchen_system/utill/color_resources.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';

class DropDownUsersWidget extends StatelessWidget {
  const DropDownUsersWidget(
      {Key? key, this.type, this.list, this.onchange, this.label = "", this.hint= ''})
      : super(key: key);
  final UsersDataModel? type;
  final List<UsersDataModel>? list;
  final Function(UsersDataModel?)? onchange;
  final String? label;
  final String?hint;

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
                style:cairoBold.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize:
                    AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
            ),
          ),
          5.sBW,
          Expanded(
            child: Material(
              elevation: 0,
              borderRadius: BorderRadius.circular(8),
              shadowColor: ColorResources.CATEGORY_SHADOW,
              child: DropdownButtonFormField<UsersDataModel>(
                isExpanded: true,
                value: type,

                onChanged: onchange,
                hint: Text(hint!, style: TextStyle(color: Colors.grey.shade700),),
                decoration: InputDecoration(
                  filled: true,
                    fillColor: Theme.of(context).cardColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    constraints: const BoxConstraints(maxHeight: 50),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)),
                items: list!.map<DropdownMenuItem<UsersDataModel>>(
                    (UsersDataModel type) {
                  return DropdownMenuItem<UsersDataModel>(
                    value: type,
                    child: Text(type.userName ?? ""),
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
