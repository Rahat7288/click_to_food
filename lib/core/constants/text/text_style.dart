import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_themes/app_colors.dart';

const _textFont = GoogleFonts.urbanist;

_textReturnElement({
  Color? color,
  double? fontSize,
  double? lineHeight,
  FontWeight? fontWeight,
  TextDecoration? decoration,
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
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
  }

  //subTitle text style==========

  static TextStyle subTitle({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.subTitleColor : Colors.grey),
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle subTitle2({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.subTitleColor : Colors.grey),
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  //content text style==========

  static TextStyle contentText({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.subTitleColor : Colors.black12),
      fontSize: 12,
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

  //terms and conditions text style==========

  static TextStyle terms({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.termsTextColor : Colors.grey),
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle termsButton({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.termsButtonColor : Colors.grey),
      fontSize: 12,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle forgetPassButton({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.termsButtonColor : Colors.grey),
      fontSize: 14,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
  }
}
