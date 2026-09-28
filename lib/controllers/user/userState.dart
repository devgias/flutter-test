part of 'userBloc.dart';

enum UserStatus { initial, loading, success, failure }

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.initial,
    this.users = const [],
    this.hasReachedMax = false,
    this.errorMessage,
  });

  final UserStatus status;
  final List<UserModel> users;
  final bool hasReachedMax;
  final String? errorMessage;

  UserState copyWith({
    UserStatus? status,
    List<UserModel>? users,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, users, hasReachedMax, errorMessage];
}