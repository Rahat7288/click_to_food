import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:click_to_food/core/constants/text/text_style.dart';
import 'package:click_to_food/services/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../../core/reusable_widgets/buttons/primary_button.dart';
import '../../../../core/reusable_widgets/buttons/round_button.dart';
import '../../../../core/reusable_widgets/input_fields/custom_text_field.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    final emailController = TextEditingController();
    final loginForm = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Utils.hideKeyboard();
      },
      child: Scaffold(
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
        body: Form(
          key: loginForm,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: sHeight * .2,
                    width: sWidth * .5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Svg('assets/images/login.svg'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Log in with email',
                    style: TStyle.title(
                      color: AppColor.titleTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Let’s log in into your Click To Food account',
                    style: TStyle.subTitle2(color: AppColor.subTitleColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    labelText: 'Enter your email',
                    hintText: 'example@mail.com',
                    onChanged: (String value) {},
                    preIcon: 'assets/icons/mail-01.svg',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  primaryButton(
                    press: () {
                      if (loginForm.currentState!.validate()) {}
                    },
                    buttonName: 'Continue',
                    width: sWidth,
                    backgroundColor: AppColor.primaryButtonColor,
                    foregroundColor: AppColor.buttonTextColor,
                    prefixIcon: 'assets/icons/mail-01.svg',
                    postFixIcon: 'assets/icons/mail-01.svg',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          textAlign: TextAlign.center,
                          'Log in with phone number',
                          style: TStyle.subTitle(
                            color: AppColor.subTitleColor,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Sign in with',
                      style: TStyle.termsButton(
                        color: AppColor.titleTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundButton(
                            press: () {},
                            icon: 'assets/icons/google.svg',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          roundButton(
                            press: () {},
                            icon: 'assets/icons/apple.svg',
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
