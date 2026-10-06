part of 'user_detail_bloc.dart';

@freezed
sealed class UserDetailEvent with _$UserDetailEvent {
  const factory UserDetailEvent.getUserDetail(String login) = _GetUserDetail;
}
