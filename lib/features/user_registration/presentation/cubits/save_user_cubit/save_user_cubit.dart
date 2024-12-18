import 'package:click_to_food/features/user_registration/presentation/cubits/save_user_cubit/save_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/views/home_screen.dart';
import '../../../data/repository_imple/user_register_repo_impl.dart';

class SaveUserCubit extends Cubit<SaveUserState> {
  SaveUserCubit() : super(SaveUserState());

  final _registerUserRepoImpl = UserRegisterRepositoryImpl();

  void saveUser(
      {required String userEmail,
      required String otp,
      required String password,
      required String mobile,
      required String userName,
      context}) {
    const header = {
      "Content-Type": "application/json",
    };

    final Map<String, dynamic> payload = {
      "email": userEmail,
      "otp": otp,
      "password": password,
      "userFName": userName,
      "mobile": mobile,
    };

    _registerUserRepoImpl
        .saveUser(context: context, payload: payload, header: header)
        .then((value) {
      if (value["succeeded"] == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        emit(state.copyWith(succeeded: true));
      } else {
        emit(state.copyWith(succeeded: false));
      }
    }).onError((error, stackTrace) {
      throw "user save failed ${error.toString()}";
    });
  }
}
