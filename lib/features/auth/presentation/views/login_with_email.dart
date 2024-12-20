import 'package:animate_do/animate_do.dart';
import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:click_to_food/core/constants/text/text_style.dart';
import 'package:click_to_food/features/auth/presentation/views/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../../core/reusable_widgets/buttons/primary_button.dart';
import '../../../../core/reusable_widgets/buttons/round_button.dart';
import '../../../../core/reusable_widgets/input_fields/custom_text_field.dart';
import '../../../../services/utils/utils.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final _emailController = TextEditingController();
  final _loginForm = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;

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
          key: _loginForm,
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
                  FadeInDown(
                    duration: Duration(milliseconds: 700),
                    child: Text(
                      'Log in with email',
                      style: TStyle.title(
                        color: AppColor.titleTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInDown(
                    duration: Duration(milliseconds: 800),
                    child: Text(
                      'Let’s log in into your Click To Food account',
                      style: TStyle.subTitle2(color: AppColor.subTitleColor),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: CustomTextField(
                      controller: _emailController,
                      type: TextInputType.text,
                      labelText: 'Enter your email',
                      hintText: 'example@mail.com',
                      onChanged: (String value) {},
                      preIcon: Icons.email_outlined,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1100),
                    child: primaryButton(
                      press: () {
                        if (_loginForm.currentState!.validate()) {
                          final email = _emailController.text;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PasswordScreen(
                                    email: email,
                                  )));
                        }
                      },
                      buttonName: 'Continue',
                      width: sWidth,
                      backgroundColor: AppColor.primaryButtonColor,
                      foregroundColor: AppColor.buttonTextColor,
                      prefixIcon: 'assets/icons/mail-01.svg',
                      postFixIcon: 'assets/icons/mail-01.svg',
                    ),
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
