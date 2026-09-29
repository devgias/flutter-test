import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../datasources/user_detail_remote_datasource.dart';
import '../models/user_detail_model.dart';

typedef Result<T> = Future<Either<Failure, T>>;

class UserDetailRepository {
  final UserDetailRemoteDataSource _dataSource;

  UserDetailRepository(this._dataSource);

  Result<UserDetailModel> fetchUserDetail(String username) async {
    try {
      final user = await _dataSource.fetchUserDetail(username);
      return Right(user);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
