import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:click_to_food/core/constants/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

Widget primaryButton(
        {required Function() press,
        required String buttonName,
        String? prefixIcon,
        postFixIcon,
        Color? backgroundColor,
        foregroundColor,
        double? radius,
        height,
        width}) =>
    SizedBox(
      height: height ?? 50,
      width: width ?? 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
          ),
        ),
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Image(
                image: Svg(prefixIcon ?? '', color: AppColor.backGroundColor),
              ),
            ),
            Text(
              buttonName,
              style: TStyle.buttonText(
                color: AppColor.buttonTextColor,
              ),
            ),
            SizedBox(
              height: 24,
              width: 24,
              child: Image(
                image: Svg(postFixIcon ?? '', color: AppColor.backGroundColor),
              ),
            ),
          ],
        ),
      ),
    );
