import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_themes/app_colors.dart';
import '../../../../core/constants/text/text_style.dart';
import '../../../../core/reusable_widgets/buttons/primary_button_single_icon.dart';
import '../../../../core/reusable_widgets/input_fields/custom_text_field.dart';
import '../../../otp_management/presentation/cubits/send_otp_cubit/send_otp_cubit.dart';
import '../../../otp_management/presentation/cubits/send_otp_cubit/send_otp_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  final _formController = GlobalKey<FormState>();
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
      body: BlocBuilder<SendOTPCubit, SendOTPState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: _formController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: sHeight * .15,
                      width: sWidth * .4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/forgot pass.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInDown(
                      duration: Duration(milliseconds: 700),
                      child: Text(
                        'Forget password?',
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
                        "Don't worry, we'll help you reset it in no time. Provide your email or phone to get an OTP code.",
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
                      height: 20,
                    ),
                    primaryButtonSingleIcon(
                        width: sWidth,
                        backgroundColor: AppColor.primaryButtonColor,
                        press: () {
                          if (_formController.currentState!.validate()) {
                            context.read<SendOTPCubit>().sendOTP(
                                context: context,
                                userEmail: _emailController.text);
                          }
                        },
                        buttonName: 'Send OTP',
                        postFixIcon: 'assets/icons/mail-01.svg'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
