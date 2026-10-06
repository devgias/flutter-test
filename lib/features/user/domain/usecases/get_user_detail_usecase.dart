import 'package:dartz/dartz.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserDetailUseCase extends UseCase<UserDetailEntity, String> {
  final UserRepositories _repositories;

  const GetUserDetailUseCase(this._repositories);

  /// [login] is the GitHub username, e.g. `mojombo`.
  @override
  Future<Either<Failure, UserDetailEntity>> call(String login) =>
      _repositories.getUserDetail(login.trim());
}
