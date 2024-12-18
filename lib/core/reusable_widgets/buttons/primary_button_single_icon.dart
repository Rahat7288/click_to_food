import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:click_to_food/core/constants/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

Widget primaryButtonSingleIcon(
        {required Function() press,
        required String buttonName,
        String? postFixIcon,
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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                buttonName,
                style: TStyle.subTitle2(
                  color: AppColor.buttonTextColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: Image(
                image: Svg(postFixIcon ?? '', color: AppColor.backGroundColor),
              ),
            ),
          ],
        ),
      ),
    );
