import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:flutter/material.dart';

///reusable alertDialog
///required parameter is child widget (alertDialog body)

class AlertDialogs extends StatelessWidget {
  const AlertDialogs({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double mHeight = MediaQuery.of(context).size.height;
    final double mWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: AppColor.backGroundColor,
      insetPadding: const EdgeInsets.all(5),
      content: SizedBox(
        height: mHeight * .3,
        width: mWidth,
        child: child,
      ),
    );
  }
}
