import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase _getUsersUseCase;

  UsersBloc(this._getUsersUseCase) : super(const UsersState.initial()) {
    on<_GetUsers>(_onGetUsers, transformer: droppable());
  }

  Future<void> _onGetUsers(
    _GetUsers event,
    Emitter<UsersState> emit,
  ) async {
    if (event.shouldLoading) emit(const UsersState.loading());

    final result = await _getUsersUseCase(const GetUsersParams());

    result.fold(
      (l) => emit(UsersState.error(l)),
      (r) => emit(UsersState.loaded(r)),
    );
  }
}
