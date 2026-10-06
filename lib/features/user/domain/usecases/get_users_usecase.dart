import 'package:dartz/dartz.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:injectable/injectable.dart';

class GetUsersParams {
  final int perPage;

  const GetUsersParams({this.perPage = 20});
}

@lazySingleton
class GetUsersUseCase extends UseCase<List<UserEntity>, GetUsersParams> {
  final UserRepositories _repositories;

  const GetUsersUseCase(this._repositories);

  @override
  Future<Either<Failure, List<UserEntity>>> call(GetUsersParams params) =>
      _repositories.getUsers(perPage: params.perPage);
}
