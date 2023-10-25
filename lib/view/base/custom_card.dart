import 'package:auto_size_text/auto_size_text.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.name,
      this.code,
      this.location,
      this.isActive,
      this.editFunction,
      this.onTap,
      this.isShown,
      this.activeFunction});

  final String? name;
  final String? code;
  final String? location;
  final bool? isActive;
  final bool? isShown;
  final Function(bool)? activeFunction;
  final Function()? onTap;
  final Function()? editFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 2,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius:
                BorderRadius.circular(Dimensions.RADIUS_SIZE_DEFAULT)),
        child: Column(
          crossAxisAlignment: Get.locale!.countryCode == "en"
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT),
                      topLeft: Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT)),
                  child: Image.asset(
                    Images.company,
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: AutoSizeText(
                name ?? ".....",
                maxLines: 1,
                style: cairoMedium.copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontSize:
                        AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 2),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Image.asset(Images.location,
            //           color: Theme.of(context).primaryColor,
            //           width: AppDimensions.space(1)),
            //       const SizedBox(
            //         width: 5,
            //       ),
            //       Flexible(
            //         child: AutoSizeText(
            //           location ?? "....",
            //           textAlign:
            //               CacheHelper.getData(key: AppConstants.languageCode) ==
            //                       "en"
            //                   ? TextAlign.start
            //                   : TextAlign.end,
            //           overflow: TextOverflow.ellipsis,
            //           style: cairoMedium.copyWith(
            //               fontSize: AppDimensions.font(
            //                   Dimensions.FONT_SIZE_EXTRA_SMALL)),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Image.asset(Images.code,
                              color: Theme.of(context).primaryColor,
                              width: AppDimensions.space(2)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: AutoSizeText(
                            code ?? ".....",
                            maxLines: 1,
                            style: cairoMedium.copyWith(
                                overflow: TextOverflow.ellipsis,
                                fontSize: AppDimensions.font(
                                    Dimensions.FONT_SIZE_EXTRA_SMALL)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isShown!
                      ? Flexible(
                          child: Switch(
                              value: isActive ?? false,
                              onChanged: activeFunction),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
