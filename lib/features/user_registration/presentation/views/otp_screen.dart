import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/app_themes/app_colors.dart';
import '../../../../core/constants/text/text_style.dart';
import '../../../../core/reusable_widgets/buttons/primary_button_single_icon.dart';
import '../cubits/send_otp_cubit/send_otp_cubit.dart';
import '../cubits/send_otp_cubit/send_otp_state.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // late final SmsRetriever smsRetriever;
  final TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  // late final GlobalKey<FormState> formKey;
  final _formKey = GlobalKey<FormState>();
  // Function to mask the email
  String maskedEmail(String email) {
    final emailParts = email.split('@'); // Split email into name and domain
    String name = emailParts[0];
    String domain = emailParts[1];

    // Show first 3 letters of name and mask the rest
    String visiblePart = name.substring(0, 3);
    String hiddenPart = '*' * (name.length - 7);

    return '$visiblePart$hiddenPart@$domain';
  }

  final defaultPinTheme = PinTheme(
    width: 80,
    height: 64,
    textStyle: GoogleFonts.poppins(
      fontSize: 20,
      color: const Color.fromRGBO(70, 69, 66, 1),
    ),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(232, 235, 241, 0.37),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColor.borderColor,
          width: 2,
          style: BorderStyle.solid,
        )),
  );

  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 146, 160, 1),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  ////countdown state ============

  int _remainingTime = 120; // 2 minutes countdown in seconds
  Timer? _timer;
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        setState(() {
          _isButtonVisible = true; // Show the button after 2 minutes
        });
        _timer?.cancel(); // Stop the timer
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
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
      body: BlocBuilder<SendOTPCubit, SendOTPState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: sHeight * .2,
                      width: sWidth * .5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Svg('assets/images/otp.svg'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInDown(
                      duration: Duration(milliseconds: 700),
                      child: Text(
                        'OTP Verification',
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
                        "We've sent an OTP to your email: ${maskedEmail(widget.email)}",
                        style: TStyle.subTitle2(color: AppColor.termsTextColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInDown(
                      duration: Duration(milliseconds: 700),
                      child: Text(
                        'Please enter the code below:',
                        style: TStyle.subTitle(
                          color: AppColor.subTitleColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Pinput(
                      length: 6,
                      controller: pinController,
                      focusNode: focusNode,
                      defaultPinTheme: defaultPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 6),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColor.borderColor,
                            width: 2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.05999999865889549),
                              offset: Offset(0, 3),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                      // onClipboardFound: (value) {
                      //   debugPrint('onClipboardFound: $value');
                      //   controller.setText(value);
                      // },
                      showCursor: true,
                      cursor: cursor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Don't receive the otp?",
                          style:
                              TStyle.subTitle2(color: AppColor.titleTextColor),
                        ),
                        TextButton(
                            onPressed: () {
                              context.read<SendOTPCubit>().sendOTP(
                                  context: context, userEmail: widget.email);
                            },
                            child: Text(
                              "Resend OTP",
                              style: TStyle.subTitle2(
                                  color: _isButtonVisible
                                      ? AppColor.primaryButtonColor
                                      : AppColor.subTitleColor),
                            )),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              _formatTime(_remainingTime),
                              style: TStyle.subTitle2(
                                  color: AppColor.subTitleColor),
                            ),
                          ),
                        )
                      ],
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Text("OTP Check ${pinController.text}"),
                    const SizedBox(
                      height: 180,
                    ),
                    primaryButtonSingleIcon(
                        width: sWidth,
                        backgroundColor: pinController.text.isEmpty
                            ? AppColor.secondaryButtonColor
                            : AppColor.primaryButtonColor,
                        press: pinController.text.isNotEmpty
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  final otp = pinController.text;
                                  context.read<SendOTPCubit>().verifyOTP(
                                      userEmail: widget.email, otp: otp);
                                }
                              }
                            : () {},
                        buttonName: 'Submit',
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

  // Helper method to format seconds into minutes:seconds
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }
}
