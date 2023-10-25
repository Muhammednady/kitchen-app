import 'package:Kitchen_system/helper/configs/app.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/base/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomRowTextField extends StatelessWidget {
  const CustomRowTextField(
      {super.key,
      this.label,
      this.type,
      this.onSubmit,
      this.onChange,
      this.controller,
      this.errorLabel});

  final String? label;
  final String? errorLabel;
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    AppSetting.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label!,
              textAlign: TextAlign.center,
              style: cairoBold.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize:
                      AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
            ),
          ),
          Flexible(
              flex: 2,
              child: CustomTextField(
                controller: controller,
                errorLabel: errorLabel,
                onChanged: onChange,
                inputType: type,
                onSubmit: onSubmit,
              )),
        ],
      ),
    );
  }
}
