import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PressableIconButton extends StatelessWidget {
  final Widget child;
  final double width;
  final VoidCallback? onTap;
  final Color? color;
  PressableIconButton(
      {Key? key, this.color, this.onTap, required this.child, this.width = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
