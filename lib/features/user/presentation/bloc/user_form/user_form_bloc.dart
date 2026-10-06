import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_form_event.dart';
part 'user_form_state.dart';
part 'user_form_bloc.freezed.dart';

/// Handles submission of both the add and the edit user form.
@injectable
class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  final AddUserUseCase _addUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;

  UserFormBloc(this._addUserUseCase, this._updateUserUseCase)
      : super(const UserFormState.initial()) {
    on<_AddUser>(_onAddUser, transformer: droppable());
    on<_UpdateUser>(_onUpdateUser, transformer: droppable());
  }

  Future<void> _onAddUser(
    _AddUser event,
    Emitter<UserFormState> emit,
  ) async {
    emit(const UserFormState.submitting());

    final result = await _addUserUseCase(event.form);

    result.fold(
      (l) => emit(UserFormState.error(l)),
      (r) => emit(UserFormState.success(r)),
    );
  }

  Future<void> _onUpdateUser(
    _UpdateUser event,
    Emitter<UserFormState> emit,
  ) async {
    emit(const UserFormState.submitting());

    final result = await _updateUserUseCase(
      UpdateUserParams(user: event.user, form: event.form),
    );

    result.fold(
      (l) => emit(UserFormState.error(l)),
      (r) => emit(UserFormState.success(r)),
    );
  }
}
