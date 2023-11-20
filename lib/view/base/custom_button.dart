import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final bool? transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final String? icon;
final Color? bgColor;
final bool hasColor;
  const CustomButton(
      {super.key,
      this.onPressed,
      this.buttonText,
      this.transparent = false,
      this.margin,
      this.width,
      this.height,
      this.fontSize,
      this.radius = 5,
      this.icon,
      this.bgColor,
      this.hasColor = true,});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: hasColor? onPressed == null
          ? Theme.of(context).disabledColor
          : transparent!
              ? Colors.transparent
              : Theme.of(context).primaryColor:bgColor,
      minimumSize: Size(width != null ? width! : Dimensions.WEB_SCREEN_WIDTH,
          height != null ? height! : 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ),
    );

    return SizedBox(
        width: width ?? Dimensions.WEB_SCREEN_WIDTH,
        child: Padding(
          padding: margin == null ? const EdgeInsets.all(0) : margin!,
          child: TextButton(
            onPressed: onPressed,
            style: flatButtonStyle,
            child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(buttonText ?? '',
                  textAlign: TextAlign.center,
                  style: cairoBold.copyWith(
                    color:hasColor? transparent!
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).cardColor:Colors.black,
                    fontSize: fontSize ?? Dimensions.FONT_SIZE_LARGE,
                  )),
              icon != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                          right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: Image.asset(icon!,
                          height: 20,
                          color: transparent!
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).cardColor),
                    )
                  : const SizedBox(),
            ]),
          ),
        ));
  }
}
