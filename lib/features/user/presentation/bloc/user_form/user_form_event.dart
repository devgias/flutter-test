part of 'user_form_bloc.dart';

@freezed
sealed class UserFormEvent with _$UserFormEvent {
  const factory UserFormEvent.addUser(UserFormEntity form) = _AddUser;
  const factory UserFormEvent.updateUser({
    required UserDetailEntity user,
    required UserFormEntity form,
  }) = _UpdateUser;
}
