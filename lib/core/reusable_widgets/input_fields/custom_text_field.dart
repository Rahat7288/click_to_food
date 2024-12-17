import 'package:flutter/material.dart';

import '../../../services/others/form_validation.dart';
import '../../constants/app_themes/app_colors.dart';

class CustomTextField extends StatelessWidget with FormValidationMixin {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.type,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.preIcon,
  });
  final TextEditingController controller;
  final TextInputType type;
  final String labelText;
  final String hintText;
  final ValueChanged<String> onChanged;
  final String preIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: AppColor.borderColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: AppColor.borderColor,
            ),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText,
          labelStyle: TextStyle(
            color: AppColor.subTitleColor,
          ),
          hintText: hintText,
          prefixIcon: Icon(
            Icons.mail_outline_rounded,
            color: AppColor.subTitleColor,
          )),
      onChanged: onChanged,
      keyboardType: type,
      validator: validateRequiredFiled,
    );
  }
}
