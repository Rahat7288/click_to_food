import 'package:equatable/equatable.dart';

import '../../../data/models/login_model.dart';

class LoginState extends Equatable {
  final LoginModel? loginModel;

  const LoginState({this.loginModel});
  @override
  List<Object?> get props => [loginModel];

  LoginState copyWith({
    LoginModel? loginModel,
  }) {
    return LoginState(
      loginModel: loginModel ?? this.loginModel,
    );
  }
}
