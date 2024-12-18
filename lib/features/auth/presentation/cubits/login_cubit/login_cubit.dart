import 'package:click_to_food/services/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/views/home_screen.dart';
import '../../../data/repository_imple/auth_repository_impl.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final _authRepoImple = AuthRepositoryImpl();

  void login({context, email, password}) {
    const header = {
      "Content-Type": "application/json",
    };
    final Map<String, dynamic> payload = {
      "userName": email,
      "password": password,
    };
    _authRepoImple
        .userLogin(context: context, header: header, payload: payload)
        .then((value) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      emit(state.copyWith(loginModel: value));
    }).onError((error, stackTrace) {
      Utils.toastMessage("Invalid Credentials");
    });
  }
}
