import 'package:auto_size_text/auto_size_text.dart';
import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/utill/color_resources.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/strings.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTasksCard extends StatelessWidget {
  const CustomTasksCard(
      {super.key,
      this.title,
      this.startDate,
      this.onTap,
      this.description,
      this.image,
      this.onTapComments,
      this.views});

  final String? title;
  final String? startDate;
  final String? description;
  final Widget? image;
  final Widget? views;
  final Function()? onTap;
  final Function()? onTapComments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8, horizontal: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          borderRadius: BorderRadius.circular(8),
          shadowColor: Theme.of(context).primaryColor,
          elevation: 2,
          child: Column(
            crossAxisAlignment:
                CacheHelper.getData(key: AppConstants.languageCode) == "en"
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            children: [
              AutoSizeText(title!,
                  style: cairoBold.copyWith(
                      fontSize: AppDimensions.font(
                    Dimensions.FONT_SIZE_EXTRA_SMALL,
                  ))),
              Text(description!,
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                  style: cairoRegular.copyWith(
                      color: ColorResources.COLOR_HINT,
                      fontSize: AppDimensions.font(
                        6,
                      ))),
              image!,
              5.sBH,
              views!,
              5.sBH,
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    border: Border.all(
                        color: ColorResources.CARD_SHADOW_COLOR
                            .withOpacity(0.19))),
                width: double.infinity,
                child: GestureDetector(
                  onTap: onTapComments,
                  child: Row(
                    mainAxisAlignment:
                        CacheHelper.getData(key: AppConstants.languageCode) ==
                                "en"
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.mode_comment_outlined,
                          color: ColorResources.DISABLE_COLOR),
                      Text(Strings.comment.tr)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
