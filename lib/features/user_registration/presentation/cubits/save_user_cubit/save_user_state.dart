import 'package:equatable/equatable.dart';

class SaveUserState extends Equatable {
  final bool? succeeded;
  const SaveUserState({this.succeeded});
  @override
  List<Object?> get props => [succeeded];

  SaveUserState copyWith({
    bool? succeeded,
  }) {
    return SaveUserState(
      succeeded: succeeded ?? this.succeeded,
    );
  }
}
