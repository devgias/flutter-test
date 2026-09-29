import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user_detail_model.dart';
import '../../data/repositories/user_detail_repository.dart';

part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  final UserDetailRepository repository;

  UserDetailCubit(this.repository) : super(const UserDetailInitial());

  Future<void> fetchUserDetail(String username) async {
    emit(const UserDetailLoading());

    final result = await repository.fetchUserDetail(username);

    result.fold(
      (failure) => emit(UserDetailError(failure.message)),
      (user) => emit(UserDetailLoaded(user)),
    );
  }
}
