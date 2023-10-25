import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconRow extends StatelessWidget {
  const CustomIconRow(
      {super.key,
      this.imagePath,
      this.image = false,
      this.label,
      this.iconData});

  final IconData? iconData;
  final String? label;
  final String? imagePath;
  final bool? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image!
            ? Image.asset(imagePath!,
                color: Theme.of(context).primaryColor,
                width: AppDimensions.space(1.2))
            : Icon(
                iconData,
                color: Theme.of(context).primaryColor,
              ),
        SizedBox(width: 4),
        Text(label!.tr,
            style: cairoRegular.copyWith(
                fontSize: AppDimensions.font(7),
                color: Theme.of(context).primaryColor)),
      ],
    );
  }
}
