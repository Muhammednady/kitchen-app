import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      this.label = '',
      this.icon,
      this.onTap,
      this.trailingIcon,
      this.color = const Color(0xFF195D9B)});

  final String? icon;
  final Widget? trailingIcon;
  final String? label;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailingIcon,
      onTap: onTap,
      dense: true,
      title: Text(label!,
          style: cairoMedium.copyWith(
              fontSize: AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL))),
      leading: Image.asset(
        icon!,
        width: AppDimensions.space(1.5),
        color: color,
      ),
    );
  }
}
