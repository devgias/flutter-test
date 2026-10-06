import 'package:dartz/dartz.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepositories)
class UserRepositoriesImpl implements UserRepositories {
  final UserRemoteDatasources _remoteDatasources;
  final UserLocalDatasources _localDatasources;

  UserRepositoriesImpl(this._remoteDatasources, this._localDatasources);

  static const _localUserType = 'User';

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers({
    required int perPage,
  }) async {
    try {
      final remoteUsers = await _remoteDatasources.getUsers(perPage: perPage);
      final addedUsers = _localDatasources.getAddedUsers();

      final result = [
        ...addedUsers.map((user) => user.toUserEntity()),
        ...remoteUsers.map((user) => user.toEntity()),
      ];

      return right(result);
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, UserDetailEntity>> getUserDetail(String login) async {
    try {
      final localUser = _localDatasources.getUser(login);
      if (localUser != null) return right(localUser.toEntity());

      final result = await _remoteDatasources.getUserDetail(login);

      return right(result.toEntity());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, UserDetailEntity>> updateUser({
    required UserDetailEntity user,
    required UserFormEntity form,
  }) async {
    try {
      final updatedUser = UserDetailDataModel.fromEntity(user).applyForm(form);

      final result = _localDatasources.saveUser(updatedUser);

      return right(result.toEntity());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, UserDetailEntity>> addUser(
    UserFormEntity form,
  ) async {
    try {
      final newUser = UserDetailDataModel(
        id: -DateTime.now().millisecondsSinceEpoch,
        login: _generateLogin(form.email),
        avatarUrl: '',
        type: _localUserType,
        isLocal: true,
      ).applyForm(form);

      final result = _localDatasources.saveUser(newUser);

      return right(result.toEntity());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  /// Builds a unique login from the email, e.g. `john@mail.com` -> `john`,
  /// then `john-1`, `john-2`, ... when it is already used.
  String _generateLogin(String email) {
    final base = email.split('@').first;

    var login = base;
    var suffix = 1;
    while (_localDatasources.isLoginTaken(login)) {
      login = '$base-${suffix++}';
    }

    return login;
  }
}
