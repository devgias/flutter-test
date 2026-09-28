import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/userRepository.dart';
import '../../models/userModel.dart';

part 'userEvent.dart';
part 'userState.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const UserState()) {
    on<UserFetched>(_onUserFetched, transformer: droppable());
  }

  static const int _pageSize = 20;

  final UserRepository _userRepository;

  Future<void> _onUserFetched(
      UserFetched event,
      Emitter<UserState> emit,
      ) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(status: UserStatus.loading));

    try {
      final lastUserId = state.users.isEmpty ? null : state.users.last.id;
      final newUsers = await _userRepository.getUsers(
        perPage: _pageSize,
        since: lastUserId,
      );

      emit(
        state.copyWith(
          status: UserStatus.success,
          users: [...state.users, ...newUsers],
          hasReachedMax: newUsers.length < _pageSize,
        ),
      );
    } on UserRepositoryException catch (error) {
      emit(
        state.copyWith(
          status: UserStatus.failure,
          errorMessage: error.message,
        ),
      );
    }
  }
}