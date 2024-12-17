import 'package:equatable/equatable.dart';

import '../../../data/models/check_user_exist_model.dart';

class CheckUserState extends Equatable {
  final CheckUserExistModel? userStatus;

  const CheckUserState({this.userStatus});

  @override
  List<Object?> get props => [userStatus];

  CheckUserState copyWith({
    CheckUserExistModel? userStatus,
  }) {
    return CheckUserState(
      userStatus: userStatus ?? this.userStatus,
    );
  }
}
