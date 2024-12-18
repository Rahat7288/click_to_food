import 'package:flutter/material.dart';

import '../../../../core/constants/app_themes/app_colors.dart';

class PasswordUpgradeScreen extends StatefulWidget {
  const PasswordUpgradeScreen({super.key});

  @override
  State<PasswordUpgradeScreen> createState() => _PasswordUpgradeScreenState();
}

class _PasswordUpgradeScreenState extends State<PasswordUpgradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
    );
  }
}
