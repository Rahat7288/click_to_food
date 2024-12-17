import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository_imple/auth_repository_impl.dart';
import 'check_user_state.dart';

class CheckUserStateCubit extends Cubit<CheckUserState> {
  CheckUserStateCubit() : super(CheckUserState());

  final _checkUserRepoImpl = AuthRepositoryImpl();

  void checkUserExists(
      {context, required String email, required String password}) {
    final Map<String, dynamic> payload = {
      "email": email,
      "password": password,
    };
    const header = {
      "Content-Type": "application/json",
    };

    _checkUserRepoImpl
        .checkUserExists(context: context, payload: payload, header: header)
        .then((value) {
      if (kDebugMode) {
        print("user exists value $value");
      }
      emit(state.copyWith(userStatus: value));
    }).onError((error, something) {
      throw "Something went wrong: $error";
    });
  }
}
