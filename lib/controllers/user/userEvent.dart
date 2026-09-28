part of 'userBloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

final class UserFetched extends UserEvent {
  const UserFetched();
}