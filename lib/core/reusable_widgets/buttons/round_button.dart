import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../constants/app_themes/app_colors.dart';

Widget roundButton({
  required Function() press,
  required String icon,
  Color? backgroundColor,
}) =>
    GestureDetector(
      onTap: press,
      child: Container(
        height: 32,
        width: 32,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.roundButton,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Image(image: Svg(icon)),
        ),
      ),
    );
