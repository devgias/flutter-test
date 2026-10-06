import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';
part 'user_detail_bloc.freezed.dart';

@injectable
class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetUserDetailUseCase _getUserDetailUseCase;

  UserDetailBloc(this._getUserDetailUseCase)
      : super(const UserDetailState.initial()) {
    on<_GetUserDetail>(_onGetUserDetail, transformer: restartable());
  }

  Future<void> _onGetUserDetail(
    _GetUserDetail event,
    Emitter<UserDetailState> emit,
  ) async {
    emit(const UserDetailState.loading());

    final result = await _getUserDetailUseCase(event.login);

    result.fold(
      (l) => emit(UserDetailState.error(l)),
      (r) => emit(UserDetailState.loaded(r)),
    );
  }
}
