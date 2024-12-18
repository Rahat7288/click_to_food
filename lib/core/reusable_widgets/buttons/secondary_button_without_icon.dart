import 'package:flutter/material.dart';

import '../../constants/app_themes/app_colors.dart';
import '../../constants/text/text_style.dart';

Widget secondaryButtonWithoutIcon(
        {required Function() press,
        required String buttonName,
        Color? backgroundColor,
        foregroundColor,
        double? radius,
        height,
        width}) =>
    Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColor.borderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      width: width ?? 200,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.backGroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
          ),
        ),
        onPressed: press,
        child: Text(
          buttonName,
          style: TStyle.subTitle2(
            color: AppColor.subTitleColor,
          ),
        ),
      ),
    );
