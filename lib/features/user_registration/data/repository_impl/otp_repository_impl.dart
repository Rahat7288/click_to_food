import '../../../../services/data/network_services/network_api_service.dart';
import '../../domain/repository/otp_repository.dart';

class OTPRepositoryImpl implements OTPRepository {
  final _networkService = HttpService();
  @override
  Future<dynamic> sendOTP({context, payload, header}) async {
    // TODO: implement sendOTP
    throw UnimplementedError();
  }

  @override
  Future<dynamic> verifyOTP({context, payload, header}) async {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }
}
