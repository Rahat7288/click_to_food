import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository_imple/auth_repository_impl.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final _authRepoImple = AuthRepositoryImpl();
}
