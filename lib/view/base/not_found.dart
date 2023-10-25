import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: TweenAnimationBuilder(
          curve: Curves.bounceOut,
          duration: const Duration(seconds: 2),
          tween: Tween<double>(begin: 12.0, end: 30.0),
          builder: (BuildContext context, double? value, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Images.empty, width: 150),
                const SizedBox(height: 10),
                Text(label!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.FONT_SIZE_DEFAULT)),
              ],
            );
          },
        ),

    );
  }
}
