import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/color_resources.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Color? fillColor;
  final int? maxLines;
  final bool? isPassword;
  final bool? isCountryPicker;
  final bool? isShowBorder;
  final bool? isIcon;
  final bool? isShowSuffixIcon;
  final bool? isShowPrefixIcon;
  final Function()? onTap;
  final Function()? prefixIconTap;
  final Function(String)? onChanged;
  final Function()? onSuffixTap;
  final String? suffixIconUrl;
  final String? prefixIconUrl;
  final bool? isSearch;
  final Function(String)? onSubmit;
  final bool? isEnabled;
  final TextCapitalization? capitalization;
  final String? errorLabel;
  final Widget? widget;
  final Widget? widgetPrefix;
  final bool? isValidator;
  final String validatorMessage;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.label,
    this.errorLabel,
    this.focusNode,
    this.nextFocus,
    this.widget,
    this.prefixIconTap,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSuffixTap,
    this.fillColor,
    this.onSubmit,
    this.onChanged,
    this.widgetPrefix,
    this.capitalization = TextCapitalization.none,
    this.isCountryPicker = false,
    this.isShowBorder = false,
    this.isShowSuffixIcon = false,
    this.isShowPrefixIcon = false,
    this.onTap,
    this.isValidator = false,
    this.validatorMessage='',
    this.isIcon = false,
    this.isPassword = false,
    this.suffixIconUrl,
    this.prefixIconUrl,
    this.isSearch = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label == null
            ? const SizedBox()
            : Text(widget.label ?? "",
                style: cairoRegular.copyWith(
                  fontSize: AppDimensions.font(
                    Dimensions.FONT_SIZE_EXTRA_SMALL,
                  ),
                )),
        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: cairoBold.copyWith(
            fontSize: Dimensions.FONT_SIZE_LARGE,
          ),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization!,
          enabled: widget.isEnabled,
          autofocus: false,

          //onChanged: widget.isSearch ? widget.languageProvider.searchLanguage : null,
          obscureText: widget.isPassword! ? _obscureText : false,
          // inputFormatters: widget.inputType == TextInputType.phone
          //     ? <TextInputFormatter>[
          //         FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
          //       ]
          //     : null,
          inputFormatters: [
            widget.inputType == TextInputType.phone
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter
          ],

          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            focusedBorder: widget.isShowBorder!
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide.none,
                  ),
            enabledBorder: widget.isShowBorder!
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide.none,
                  ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: widget.fillColor ?? Theme.of(context).cardColor,
            hintStyle: cairoMedium.copyWith(
              color: ColorResources.COLOR_GRAY,
              fontSize: Dimensions.FONT_SIZE_LARGE,
            ),
            filled: true,
            prefixIcon: widget.isShowPrefixIcon!
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: Dimensions.PADDING_SIZE_LARGE,
                        right: Dimensions.PADDING_SIZE_SMALL),
                    child: GestureDetector(
                        onTap: widget.prefixIconTap,
                        child: Image.asset(widget.prefixIconUrl!,
                            color: Theme.of(context).primaryColor)),
                  )
                : widget.widgetPrefix,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 25, maxHeight: 25),
            suffixIcon: widget.isShowSuffixIcon!
                ? widget.isPassword!
                    ? IconButton(
                        icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).primaryColor),
                        onPressed: _toggle)
                    : widget.isIcon!
                        ? IconButton(
                            onPressed: widget.onSuffixTap,
                            icon: Image.asset(
                              widget.suffixIconUrl!,
                              width: 25,
                              height: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : widget.widget
                : null,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return widget.validatorMessage;
            }
            return null;
          },
          onTap: widget.onTap,
          // onSubmitted: (text) => widget.nextFocus != null
          //     ? FocusScope.of(context).requestFocus(widget.nextFocus)
          //     : widget.onSubmit != null
          //         ? widget.onSubmit!(text)
          //         : null,
          onChanged: widget.onChanged,
        ),
        if (widget.errorLabel != null && widget.errorLabel!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: ShowUpAnimation(
              child: Text(
                '${widget.errorLabel}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.redAccent[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          )
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
