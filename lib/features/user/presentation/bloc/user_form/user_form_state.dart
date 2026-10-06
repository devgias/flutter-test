part of 'user_form_bloc.dart';

@freezed
sealed class UserFormState with _$UserFormState {
  const factory UserFormState.initial() = _Initial;
  const factory UserFormState.submitting() = _Submitting;
  const factory UserFormState.success(UserDetailEntity user) = _Success;
  const factory UserFormState.error(Failure failure) = _Error;
}
