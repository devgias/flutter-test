import 'package:dartz/dartz.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:injectable/injectable.dart';

class UpdateUserParams {
  final UserDetailEntity user;
  final UserFormEntity form;

  const UpdateUserParams({required this.user, required this.form});
}

@lazySingleton
class UpdateUserUseCase extends UseCase<UserDetailEntity, UpdateUserParams>
    with UserFormValidator {
  final UserRepositories _repositories;

  UpdateUserUseCase(this._repositories);

  @override
  Future<Either<Failure, UserDetailEntity>> call(UpdateUserParams params) =>
      normalize(params.form).fold(
        (failure) async => left(failure),
        (form) => _repositories.updateUser(user: params.user, form: form),
      );
}
