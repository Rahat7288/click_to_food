import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_themes/app_colors.dart';

const _textFont = GoogleFonts.urbanist;

_textReturnElement({
  Color? color,
  double? fontSize,
  double? lineHeight,
  FontWeight? fontWeight,
}) {
  return _textFont(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: lineHeight,
  );
}

class TStyle {
  //title text style==========
  ///reusable text style class
  ///can pass Color property or default color will added from themeData
  static TextStyle title({
    Color? color,
    bool whiteText = false,
  }) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.titleTextColor : Colors.black),
      fontSize: 36,
      fontWeight: FontWeight.w700,
    );
  }

  //subTitle text style==========

  static TextStyle subTitle({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.subTitleColor : Colors.grey),
      fontSize: 22,
      fontWeight: FontWeight.w700,
    );
  }

  //content text style==========

  static TextStyle contentText({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.subTitleColor : Colors.black12),
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
  }

  //button text style==========

  static TextStyle buttonText({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.buttonTextColor : Colors.black),
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }
}
