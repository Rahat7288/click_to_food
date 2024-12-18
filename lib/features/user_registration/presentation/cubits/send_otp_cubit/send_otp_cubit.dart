import 'package:click_to_food/services/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository_impl/otp_repository_impl.dart';
import '../../views/otp_screen.dart';
import 'send_otp_state.dart';

class SendOTPCubit extends Cubit<SendOTPState> {
  SendOTPCubit() : super(SendOTPState());

  final _otpRepositoryImpl = OTPRepositoryImpl();

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
}
