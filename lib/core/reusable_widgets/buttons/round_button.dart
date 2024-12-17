import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../constants/app_themes/app_colors.dart';

Widget roundButton({required Function() press, required String icon}) =>
    GestureDetector(
      onTap: press,
      child: Container(
        height: 32,
        width: 32,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColor.roundButton,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Image(image: Svg(icon)),
        ),
      ),
    );
