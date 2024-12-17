import 'package:click_to_food/core/resources/app_urls.dart';
import 'package:flutter/foundation.dart';

import '../../../../services/data/network_services/network_api_service.dart';
import '../../domain/repository/auth_repository.dart';
import '../models/check_user_exist_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _networkService = HttpService();
  @override
  Future<CheckUserExistModel> checkUserExists(
      {context, payload, header}) async {
    if (kDebugMode) {
      print('check user payload ${payload.toString()}');
    }
    try {
      final response = await _networkService.post(AppUrls.checkUserExists,
          body: payload, context: context, headers: header);
      if (kDebugMode) {
        print("check user response $response");
      }
      return CheckUserExistModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> userLogin({context, payload, header}) async {
    // TODO: implement userLogin
    throw UnimplementedError();
  }

  @override
  Future<dynamic> userLogout({context, payload, header}) async {
    // TODO: implement userLogout
    throw UnimplementedError();
  }
}
