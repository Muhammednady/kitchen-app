import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/view/base/responsive_widget.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(String message, BuildContext context,
    {bool isError = true}) {
  final width = MediaQuery.of(context).size.width;
  Responsive.isDesktop(context)
      ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          margin: Responsive.isDesktop(context)
              ? EdgeInsets.only(
                  right: width * 0.75,
                  bottom: Dimensions.PADDING_SIZE_LARGE,
                  left: Dimensions.PADDING_SIZE_EXTRA_SMALL)
              : const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.down,
          duration: Duration(
              milliseconds: Responsive.isDesktop(context) ? 1000 : 600),
          backgroundColor: isError ? Colors.red : Colors.green))
      : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isError ? Colors.red : Colors.green,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          content: Text(message),
          duration: const Duration(seconds: 2),
        ));
}
