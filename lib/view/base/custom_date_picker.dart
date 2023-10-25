import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/color_resources.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key, this.label, this.onTap});

  final Function()? onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_SMALL,
            vertical: Dimensions.PADDING_SIZE_SMALL),
        child: Material(
          elevation: 2,
          shadowColor: ColorResources.COLOR_GREY,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label ?? "",
                      style: cairoRegular.copyWith(

                          fontSize: AppDimensions.font(
                            Dimensions.FONT_SIZE_EXTRA_SMALL,
                          ))),
                  Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                    size: AppDimensions.space(1.5),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
