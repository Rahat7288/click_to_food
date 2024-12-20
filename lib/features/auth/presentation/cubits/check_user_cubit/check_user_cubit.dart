import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/reusable_widgets/alert_dialogs/alert_dialogs.dart';
import '../../../../../services/data/local_services/local_service.dart';
import '../../../data/repository_imple/auth_repository_impl.dart';
import '../../widgets/create_accout_dialog.dart';
import '../login_cubit/login_cubit.dart';
import 'check_user_state.dart';

class CheckUserStateCubit extends Cubit<CheckUserState> {
  CheckUserStateCubit() : super(CheckUserState());

  final _checkUserRepoImpl = AuthRepositoryImpl();
  final localService = StorageService();

  final loginCubit = LoginCubit();

  bool userValid = false;

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

      if (value.message == 'User Not Found' && value.success == false) {
        localService.setExistence(isUser: false);
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialogs(
                  child: createAccountDialog(context: context, email: email),
                ));
      } else {
        loginCubit.login(context: context, email: email, password: password);
      }
      emit(state.copyWith(userStatus: value));
    }).onError((error, stackTrace) {
      throw "Something went wrong: $error";
    });
  }

  void checkUser({required String userEmail, context}) {
    final Map<String, dynamic> payload = {
      "email": userEmail,
    };
    const header = {
      "Content-Type": "application/json",
    };
    _checkUserRepoImpl
        .checkUserExists(context: context, payload: payload, header: header)
        .then((value) {
      if (value.message == "User Already Exists") {
        userValid = true;
      }
    }).onError((error, stackTrack) {
      throw "something went wrong";
    });
  }
}
