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
      insetPadding: const EdgeInsets.all(10),
      content: SizedBox(
        height: mHeight * .4,
        width: mWidth,
        child: child,
      ),
    );
  }
}
