import 'package:equatable/equatable.dart';

class ForgetPasswordState extends Equatable {
  final bool? passwordUpdate;
  const ForgetPasswordState({this.passwordUpdate});
  @override
  List<Object?> get props => [passwordUpdate];

  ForgetPasswordState copyWith({
    bool? passwordUpdate,
  }) {
    return ForgetPasswordState(
      passwordUpdate: passwordUpdate ?? this.passwordUpdate,
    );
  }
}
