import 'package:animate_do/animate_do.dart';
import 'package:click_to_food/services/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../../core/constants/app_themes/app_colors.dart';
import '../../../../core/constants/text/text_style.dart';
import '../../../../core/reusable_widgets/buttons/primary_button.dart';
import '../../../../core/reusable_widgets/buttons/round_button.dart';
import '../../../../core/reusable_widgets/input_fields/custom_password_field.dart';
import '../../../forget_password/presentation/views/forget_password_screen.dart';
import '../cubits/check_user_cubit/check_user_cubit.dart';
import '../cubits/check_user_cubit/check_user_state.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key, required this.email});
  final String email;
  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _passwordController = TextEditingController();
  final _formController = GlobalKey<FormState>();
  bool isObscure = true;
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Utils.hideKeyboard();
        },
        child: BlocBuilder<CheckUserStateCubit, CheckUserState>(
          builder: (context, state) {
            return Form(
              key: _formController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: sHeight * .15,
                        width: sWidth * .4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Svg('assets/images/enter_password.svg'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInDown(
                        duration: Duration(milliseconds: 700),
                        child: Text(
                          'Enter your Password',
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
                          'Please enter your password to continue',
                          style:
                              TStyle.subTitle2(color: AppColor.subTitleColor),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1000),
                        child: CustomPasswordField(
                          controller: _passwordController,
                          labelText: 'Type your password',
                          hintText: 'password',
                          onChanged: (String value) {},
                          isObscure: isObscure,
                          suffixIcon: isObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          textInputAction: TextInputAction.done,
                          press: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FadeInLeft(
                          duration: Duration(milliseconds: 1100),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ForgetPasswordScreen()));
                              },
                              child: Text(
                                textAlign: TextAlign.center,
                                'forget password?',
                                style: TStyle.forgetPassButton(
                                  color: AppColor.subTitleColor,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1100),
                        child: primaryButton(
                          press: () {
                            if (_formController.currentState!.validate()) {
                              final userEmail = widget.email;
                              final userPassword = _passwordController.text;
                              context
                                  .read<CheckUserStateCubit>()
                                  .checkUserExists(
                                      email: userEmail,
                                      password: userPassword,
                                      context: context);
                            }
                          },
                          buttonName: 'Log in',
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
            );
          },
        ),
      ),
    );
  }
}
