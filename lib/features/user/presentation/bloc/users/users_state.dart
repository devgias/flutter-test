part of 'users_bloc.dart';

@freezed
sealed class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.loaded(List<UserEntity> users) = _Loaded;
  const factory UsersState.error(Failure failure) = _Error;
}
