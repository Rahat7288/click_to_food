import 'package:click_to_food/core/constants/app_themes/app_colors.dart';
import 'package:click_to_food/core/constants/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../../core/reusable_widgets/buttons/primary_button_single_icon.dart';
import '../../../../core/reusable_widgets/buttons/secondary_button_without_icon.dart';
import '../../../user_registration/presentation/cubits/send_otp_cubit/send_otp_cubit.dart';
import '../../../user_registration/presentation/cubits/send_otp_cubit/send_otp_state.dart';

Widget createAccountDialog(
        {required BuildContext context, required String email}) =>
    BlocBuilder<SendOTPCubit, SendOTPState>(
      builder: (context, state) {
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Svg('assets/images/alert.svg')),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Account not found!',
                style: TStyle.subTitle(color: AppColor.titleTextColor),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'It looks like there’s no account associated with this phone number. Click continue to open a new account.',
                  style: TStyle.contentText(color: AppColor.subTitleColor),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                      child: secondaryButtonWithoutIcon(
                    press: () {
                      Navigator.of(context).pop();
                    },
                    buttonName: 'Back',
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: primaryButtonSingleIcon(
                        backgroundColor: AppColor.primaryButtonColor,
                        press: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => OtpScreen(
                          //           email: email,
                          //         )));

                          context
                              .read<SendOTPCubit>()
                              .sendOTP(context: context, userEmail: email);
                        },
                        buttonName: 'Create Account',
                        postFixIcon: 'assets/icons/mail-01.svg'),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
