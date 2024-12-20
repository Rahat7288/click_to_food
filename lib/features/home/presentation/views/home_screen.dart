import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:click_to_food/core/constants/text/text_style.dart';
import 'package:click_to_food/core/reusable_widgets/drawer/app_drawer.dart';
import 'package:flutter/material.dart';

import '../../../../core/reusable_widgets/buttons/round_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: appDrawer(context: context),
      ),
      appBar: AppBar(
        backgroundColor: AppColor.primaryButtonColor,
        leadingWidth: 200,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your location",
                style: TStyle.subTitle2(color: AppColor.subTitleColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColor.backGroundColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Bashundhara R/A",
                    style: TStyle.subTitle2(color: AppColor.backGroundColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          roundButton(
            press: () {},
            icon: 'assets/icons/bell-bing.svg',
          ),
          const SizedBox(
            width: 10,
          ),
          roundButton(
              press: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: 'assets/icons/menu.svg'),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
