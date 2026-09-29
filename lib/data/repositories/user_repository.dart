import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/user_model.dart';

typedef Result<T> = Future<Either<Failure, T>>;

class UserRepository {
  final UserRemoteDataSource _dataSource;

  UserRepository(this._dataSource);

  Result<List<UserModel>> fetchUsers() async {
    try {
      final users = await _dataSource.fetchUsers();

      return Right(users);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}