import 'package:click_to_food/core/resources/app_urls.dart';
import 'package:flutter/foundation.dart';

import '../../../../services/data/network_services/network_api_service.dart';
import '../../domain/repository/otp_repository.dart';
import '../models/send_otp_model.dart';

class OTPRepositoryImpl implements OTPRepository {
  final _networkService = HttpService();
  @override
  Future<SendOtpModel> sendOTP({context, payload, header}) async {
    try {
      final response = await _networkService.post(AppUrls.sendOTPEmail,
          body: payload, headers: header, context: context);
      if (kDebugMode) {
        print("send OTP response $response");
      }
      return SendOtpModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> verifyOTP({context, payload, header}) async {
    try {
      final response = await _networkService.post(AppUrls.checkOTPFromEmail,
          body: payload, headers: header, context: context);
      if (kDebugMode) {
        print("OTP verification response $response");
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
