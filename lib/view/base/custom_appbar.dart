import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, this.label, this.onTap, this.showAction = false})
      : preferredSize = const Size.fromHeight(80),
        super(key: key);
  final String? label;
  final Function()? onTap;
  final bool? showAction;
  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back(result: true);
          },
          icon: const Icon(Icons.arrow_back_ios)),
      title: Image.asset(
        Images.arabic,
        width: AppDimensions.space(2),
      ),
      actions: [
        widget.showAction!
            ? CustomButton(
                buttonText: widget.label,
                width: AppDimensions.space(Dimensions.FONT_SIZE_EXTRA_SMALL),
                onPressed: widget.onTap,
                icon: Images.add,
              )
            : const SizedBox()
      ],
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Dimensions.FONT_SIZE_OVER_LARGE),
        ),
      ),
    );
  }
}
