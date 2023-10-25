import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/utill/color_resources.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChange});

  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      onChanged: onChange,
      //     (String query) {
      //   // searchProvider.searchLanguage(query, context);
      // },
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: Dimensions.FONT_SIZE_LARGE),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(style: BorderStyle.none, width: 0),
        ),
        isDense: true,
        hintText: AppConstants.findLanguage.tr,
        fillColor: Theme.of(context).cardColor,
        hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: ColorResources.COLOR_HINT),
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.PADDING_SIZE_LARGE,
              right: Dimensions.PADDING_SIZE_SMALL),
          child: Image.asset(Images.arabic,
              width: 15,
              height: 15,
              color: Theme.of(context).textTheme.bodyLarge?.color),
        ),
      ),
    );
  }
}
