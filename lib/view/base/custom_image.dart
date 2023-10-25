import 'package:cached_network_image/cached_network_image.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholder;
  final bool? border;

  const CustomImage(
      {super.key,
      this.image,
      this.height,
      this.border = false,
      this.width,
      this.fit = BoxFit.cover,
      this.placeholder = Images.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: border!
              ? const BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT),
                  topRight: Radius.circular(Dimensions.RADIUS_SIZE_DEFAULT),
                )
              : null),
      child: CachedNetworkImage(
        imageUrl: image!,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => ClipRRect(
          clipBehavior: Clip.antiAlias,
          child: Image.asset(Images.placeholder,
              height: height, width: width, fit: fit),
        ),
        errorWidget: (context, url, error) => ClipRRect(
            clipBehavior: Clip.antiAlias,
            child: Image.asset(placeholder!,
                height: height, width: width, fit: fit)),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
