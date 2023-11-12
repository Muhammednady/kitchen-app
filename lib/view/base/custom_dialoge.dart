import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/base/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(
    BuildContext context, {
    Function()? onTap,
    String? label,
    String? leadingButtonLabel,
    String? actionButtonText,
    Widget? body,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                width: 300,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(height: 20),
                  body ??
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Icon(Icons.contact_support, size: 50),
                      ),
                  Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                    child: Text(label ?? '',
                        style: cairoBold, textAlign: TextAlign.center),
                  ),
                  const Divider(height: 0, color: Colors.grey),
                  Row(children: [
                    Expanded(
                        child: InkWell(
                      onTap: onTap,
                      child: Container(
                        padding:
                            const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10))),
                        child: Text(leadingButtonLabel ?? AppConstants.yes.tr,
                            style: cairoBold.copyWith(
                                color: Theme.of(context).primaryColor)),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding:
                            const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10))),
                        child: Text(actionButtonText ?? AppConstants.no.tr,
                            style: cairoBold.copyWith(color: Colors.white)),
                      ),
                    )),
                  ]),
                ]),
              ));
        });
  }

  static void showPhotoDialog({
    required BuildContext context,
    required String imgSrc,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                width: 300,
                child: CustomImage(
                  image: imgSrc,
                  height: 300,
                  width: 300,
                ),
              ));
        });
  }

  static void showAnimatedDialog(BuildContext context, Widget dialog,
      {bool isFlip = false, bool dismissible = true}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: dismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, animation1, animation2) => dialog,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, a1, a2, widget) {
        if (isFlip) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: a1,
                    curve: const Interval(0.5, 1.0, curve: Curves.elasticOut))),
            child: widget,
          );
        } else {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: widget,
            ),
          );
        }
      },
    );
  }

  static void displayUpdateAlert(
    BuildContext context,
    Widget child, {
    Function()? onConfirm,
    bool? loading,
  }) async {
    final alert = Alert(
      context: context,
      content: child,
      type: AlertType.none,
      style: AlertStyle(
        // animationDuration: const Duration(milliseconds: 900),
        animationType: AnimationType.grow,

        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        descStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        isCloseButton: false,
      ),
      buttons: [
        DialogButton(
          onPressed: onConfirm,
          color: Theme.of(context).primaryColor,
          child: loading == true
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).cardColor),
                )
              : Text(
                  "Confirmation".tr,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red,
          child: Text(
            "cancel".tr,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
    await alert.show();
  }
}
