import 'package:flutter/material.dart';
import 'package:flutter_firebase_study_app/configs/themes/ui_params.dart';
import 'package:get/get.dart';

class ContentArea extends StatelessWidget {
  final Widget child;
  final bool addPadding;
  const ContentArea({Key? key, required this.child, required this.addPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height * 0.68,
        padding: addPadding
            ? EdgeInsets.only(
                left: mobileScreenpadding,
                right: mobileScreenpadding,
                top: mobileScreenpadding,
              )
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: customScafoldColor(),
        ),
        child: child,
      ),
    );
  }
}
