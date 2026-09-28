part of 'userDetailBloc.dart';

sealed class UserDetailEvent extends Equatable {
  const UserDetailEvent();

  @override
  List<Object?> get props => [];
}

final class UserDetailRequested extends UserDetailEvent {
  const UserDetailRequested(this.login);

  final String login;

  @override
  List<Object?> get props => [login];
}