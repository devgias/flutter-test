import 'package:dartz/dartz.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddUserUseCase extends UseCase<UserDetailEntity, UserFormEntity>
    with UserFormValidator {
  final UserRepositories _repositories;

  AddUserUseCase(this._repositories);

  @override
  Future<Either<Failure, UserDetailEntity>> call(UserFormEntity params) =>
      normalize(params).fold(
        (failure) async => left(failure),
        _repositories.addUser,
      );
}
