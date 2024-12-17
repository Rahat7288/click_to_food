import 'package:animate_do/animate_do.dart';
import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:click_to_food/core/constants/text/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/reusable_widgets/buttons/primary_button.dart';
import '../../../../core/reusable_widgets/buttons/secondary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: sHeight,
        width: sWidth,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
              height: sHeight,
              width: sWidth,
              color: AppColor.backGroundColor,
            ),
            Positioned(
              child: Container(
                width: sWidth,
                height: sHeight * .45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login_banner.png"),
                  ),
                ),
              ),
            ),
            Positioned(
              top: sHeight * .33,
              right: 0,
              left: 0,
              child: FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: SizedBox(
                  height: 30,
                  child: Image(
                    image: AssetImage('assets/images/Welcome back 👋.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: sHeight * .45,
              left: 0,
              right: 0,
              child: FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  'Choose your log in method',
                  style: TStyle.subTitle(color: AppColor.subTitleColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: sHeight * .5,
              left: 0,
              right: 0,
              child: FadeInUp(
                duration: Duration(milliseconds: 1100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: primaryButton(
                    press: () {},
                    buttonName: 'Continue with Email',
                    width: sWidth * .6,
                    backgroundColor: AppColor.primaryButtonColor,
                    foregroundColor: AppColor.buttonTextColor,
                    prefixIcon: 'assets/icons/mail-01.svg',
                    postFixIcon: 'assets/icons/mail-01.svg',
                  ),
                ),
              ),
            ),
            Positioned(
              top: sHeight * .58,
              left: 0,
              right: 0,
              child: FadeInUp(
                duration: Duration(milliseconds: 1150),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child:
                            Divider(thickness: 2, color: AppColor.borderColor),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'or',
                        style:
                            TStyle.contentText(color: AppColor.subTitleColor),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child:
                            Divider(thickness: 2, color: AppColor.borderColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //google sign in button============
            Positioned(
              top: sHeight * .63,
              child: FadeInUp(
                duration: Duration(milliseconds: 1200),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: secondaryButton(
                    press: () {},
                    buttonName: 'Continue with Google',
                    width: sWidth * .92,
                    backgroundColor: AppColor.backGroundColor,
                    foregroundColor: AppColor.buttonTextColor,
                    prefixIcon: 'assets/icons/google.svg',
                    // postFixIcon: 'assets/icons/google.svg',
                  ),
                ),
              ),
            ),
            //apple login============
            Positioned(
              top: sHeight * .72,
              child: FadeInUp(
                duration: Duration(milliseconds: 1250),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: secondaryButton(
                    press: () {},
                    buttonName: 'Continue with Apple',
                    width: sWidth * .92,
                    backgroundColor: AppColor.backGroundColor,
                    foregroundColor: AppColor.buttonTextColor,
                    prefixIcon: 'assets/icons/apple.svg',
                    // postFixIcon: 'assets/icons/google.svg',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
