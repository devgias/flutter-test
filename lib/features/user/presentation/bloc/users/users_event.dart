part of 'users_bloc.dart';

@freezed
sealed class UsersEvent with _$UsersEvent {
  /// Set [shouldLoading] to `false` to keep the current list on screen,
  /// e.g. for pull-to-refresh.
  const factory UsersEvent.getUsers({
    @Default(true) bool shouldLoading,
  }) = _GetUsers;
}
