import 'package:dartz/dartz.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';

abstract class UserRepositories {
  Future<Either<Failure, List<UserEntity>>> getUsers({required int perPage});

  Future<Either<Failure, UserDetailEntity>> getUserDetail(String login);

  Future<Either<Failure, UserDetailEntity>> updateUser({
    required UserDetailEntity user,
    required UserFormEntity form,
  });

  Future<Either<Failure, UserDetailEntity>> addUser(UserFormEntity form);
}
