import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit(this.repository) : super(const UserInitial());

  Future<void> fetchUsers() async {
    emit(const UserLoading());

    final result = await repository.fetchUsers();

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (users) => emit(UserLoaded(users)),
    );
  }
}