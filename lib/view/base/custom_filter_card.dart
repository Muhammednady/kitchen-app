import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';

class CustomFilterCard extends StatelessWidget {
  const CustomFilterCard({super.key, this.label, this.onTap});

  final String? label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_FIFTY)),
        color: Theme.of(context).cardColor,
        elevation: 1,
        child: SizedBox(
          width: AppDimensions.space(5),
          child: Text(label!,
              textAlign: TextAlign.center,
              style: cairoRegular.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize:
                      AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL))),
        ),
      ),
    );
  }
}
