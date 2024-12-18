import 'package:equatable/equatable.dart';

import '../../../data/models/send_otp_model.dart';

class SendOTPState extends Equatable {
  final SendOtpModel? sendOtpModel;

  const SendOTPState({this.sendOtpModel});

  @override
  List<Object?> get props => [sendOtpModel];

  SendOTPState copyWith({
    SendOtpModel? sendOtpModel,
  }) {
    return SendOTPState(
      sendOtpModel: sendOtpModel ?? this.sendOtpModel,
    );
  }
}
