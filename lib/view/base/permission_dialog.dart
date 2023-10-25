
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: SizedBox(
          width: 300,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.add_location_alt_rounded,
                color: Theme.of(context).primaryColor, size: 100),
            const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            Text(
              AppConstants.youDeniedLocationPermission.tr,
              textAlign: TextAlign.justify,
              style: cairoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
            ),
            const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            Row(children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            width: 2, color: Theme.of(context).primaryColor)),
                    minimumSize: const Size(1, 50),
                  ),
                  child: Text(AppConstants.no.tr),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Expanded(
                  child: CustomButton(
                      buttonText: AppConstants.yes.tr,
                      onPressed: () async {
                        await Geolocator.openAppSettings();

                        Get.back();
                      })),
            ]),
          ]),
        ),
      ),
    );
  }
}
