import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:click_to_food/core/constants/text/text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: AppColor.backGroundColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: AppColor.backGroundColor,
              )),
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
