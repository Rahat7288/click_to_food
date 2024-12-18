import 'package:click_to_food/core/resources/app_urls.dart';
import 'package:click_to_food/services/data/network_services/network_api_service.dart';
import 'package:flutter/foundation.dart';

import '../../domain/repository/user_register_repository.dart';

class UserRegisterRepositoryImpl implements UserRegisterRepository {
  final _networkService = HttpService();
  @override
  Future<dynamic> saveUser({context, payload, header}) async {
    try {
      final response = await _networkService.post(
          AppUrls.regiserAfterOtpVerification,
          context: context,
          body: payload,
          headers: header);
      if (kDebugMode) {
        print("suve user response $response");
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
