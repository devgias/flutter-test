import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/userDetailModel.dart';
import '../../../repositories/userRepository.dart';

part 'userDetailEvent.dart';
part 'userDetailState.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const UserDetailState()) {
    on<UserDetailRequested>(_onUserDetailRequested, transformer: droppable());
  }

  final UserRepository _userRepository;

  Future<void> _onUserDetailRequested(
      UserDetailRequested event,
      Emitter<UserDetailState> emit,
      ) async {
    emit(state.copyWith(status: UserDetailStatus.loading));

    try {
      final detail = await _userRepository.getUserDetail(event.login);
      emit(state.copyWith(status: UserDetailStatus.success, detail: detail));
    } on UserRepositoryException catch (error) {
      emit(
        state.copyWith(
          status: UserDetailStatus.failure,
          errorMessage: error.message,
        ),
      );
    }
  }
}