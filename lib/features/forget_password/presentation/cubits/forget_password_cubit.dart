import 'package:click_to_food/services/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/cubits/check_user_cubit/check_user_cubit.dart';
import '../../../otp_management/presentation/cubits/send_otp_cubit/send_otp_cubit.dart';
import '../../data/repository_impl/forget_pass_repo_impl.dart';
import 'forget_password_state.dart';

class ForgetPasswrodCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswrodCubit() : super(ForgetPasswordState());

  final _forgetPasswordRepoImple = ForgetPassRepoImpl();
  final _checkUser = CheckUserStateCubit();
  final _sendOtp = SendOTPCubit();

  void updatePassword(
      {required String email, required String password, context}) {
    const header = {
      "Content-Type": "application/json",
    };
    final Map<String, dynamic> payload = {
      "email": email,
      "password": password,
    };

    _forgetPasswordRepoImple
        .forgetPassword(context: context, payload: payload, header: header)
        .then((value) {
      emit(state.copyWith(passwordUpdate: true));
    }).onError((error, stackTrace) {
      throw "Unable to update the password ${error.toString()}";
    });
  }

  void sendOTP({required String email, context}) {
    _checkUser.checkUserExists(email: email, password: 'password');
    _checkUser.userValid
        ? _sendOtp.sendOTP(context: context, userEmail: email)
        : Utils.toastMessage("Password update failed");
  }
}
