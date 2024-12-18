import 'package:click_to_food/services/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/cubits/check_user_cubit/check_user_cubit.dart';
import '../../../../forget_password/presentation/views/password_upgrade_screen.dart';
import '../../../../user_registration/presentation/views/signup_screen.dart';
import '../../../data/repository_impl/otp_repository_impl.dart';
import '../../views/otp_screen.dart';
import 'send_otp_state.dart';

class SendOTPCubit extends Cubit<SendOTPState> {
  SendOTPCubit() : super(SendOTPState());

  final _otpRepositoryImpl = OTPRepositoryImpl();
  final _checkUser = CheckUserStateCubit();

  ///send OTP to user email address=========
  void sendOTP({context, userEmail}) {
    final Map<String, dynamic> payload = {
      "email": userEmail,
    };

    const header = {
      "Content-Type": "application/json",
    };
    _otpRepositoryImpl
        .sendOTP(context: context, header: header, payload: payload)
        .then((value) {
      if (kDebugMode) {
        print("OTP Send Value $value}");
      }

      ///on  successful request user will navigate to OTP  screen============
      if (value.message == "OTP sent successfully.") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              email: userEmail,
            ),
          ),
        );
      } else {
        Utils.toastMessage("Otp send failed");
        Navigator.of(context).pop();
      }
    }).onError((error, stackTrace) {
      throw "Error sending OTP  ${error.toString()}";
    });
  }

  ///verify OTP from user email address=========
  void verifyOTP({context, required String userEmail, required String otp}) {
    final Map<String, dynamic> payload = {
      "email": userEmail,
      "otp": otp,
    };

    const header = {
      "Content-Type": "application/json",
    };

    _otpRepositoryImpl
        .verifyOTP(context: context, payload: payload, header: header)
        .then((value) {
      if (kDebugMode) {
        print("OTP verification response ${value.message}");
      }

      if (value.message == 'OTP has Matched.') {
        _checkUser.checkUser(userEmail: userEmail, context: context);
        _checkUser.userValid
            ? Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PasswordUpgradeScreen()))
            : Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignupScreen(
                    userEmail: userEmail,
                    userotp: otp,
                  ),
                ),
              );
      } else {
        Utils.toastMessage("Wrong OTP");
      }
    }).onError((error, stackTrace) {
      throw "OTP verification error ${error.toString()}";
    });
  }
}
