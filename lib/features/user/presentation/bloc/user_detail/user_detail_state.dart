part of 'user_detail_bloc.dart';

@freezed
sealed class UserDetailState with _$UserDetailState {
  const factory UserDetailState.initial() = _Initial;
  const factory UserDetailState.loading() = _Loading;
  const factory UserDetailState.loaded(UserDetailEntity user) = _Loaded;
  const factory UserDetailState.error(Failure failure) = _Error;
}
