import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../services/others/form_validation.dart';

class CustomPasswordField extends StatelessWidget with FormValidationMixin {
  const CustomPasswordField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      required this.isObscure,
      required this.suffixIcon,
      required this.onChanged,
      required this.textInputAction,
      required this.press});
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isObscure;
  final IconData suffixIcon;
  final ValueChanged<String> onChanged;
  final TextInputAction textInputAction;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: validatePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: labelText,
        labelStyle: TextStyle(color: AppColor.subTitleColor),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.subTitleColor),
        prefixIcon: Icon(
          Icons.lock_outlined,
          color: AppColor.subTitleColor,
        ),
        suffixIcon: IconButton(
          onPressed: press,
          icon: Icon(
            suffixIcon,
            color: AppColor.subTitleColor,
          ),
        ),
      ),
    );
  }
}
