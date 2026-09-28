part of 'userDetailBloc.dart';

enum UserDetailStatus { initial, loading, success, failure }

class UserDetailState extends Equatable {
  const UserDetailState({
    this.status = UserDetailStatus.initial,
    this.detail,
    this.errorMessage,
  });

  final UserDetailStatus status;
  final UserDetailModel? detail;
  final String? errorMessage;

  UserDetailState copyWith({
    UserDetailStatus? status,
    UserDetailModel? detail,
    String? errorMessage,
  }) {
    return UserDetailState(
      status: status ?? this.status,
      detail: detail ?? this.detail,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, detail, errorMessage];
}