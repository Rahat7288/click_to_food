import 'package:click_to_food/core/resources/app_urls.dart';
import 'package:click_to_food/services/data/network_services/network_api_service.dart';

import '../../domain/repository/forget_password_repository.dart';

class ForgetPassRepoImpl implements ForgetPasswordRepository {
  final _networkService = HttpService();
  @override
  Future<dynamic> forgetPassword({context, payload, header}) async {
    try {
      final response = await _networkService.post(AppUrls.forgetPassword,
          body: payload, headers: header, context: context);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
