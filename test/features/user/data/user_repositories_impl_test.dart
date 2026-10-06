import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';

class _MockUserRemoteDatasources extends Mock
    implements UserRemoteDatasources {}

void main() {
  late _MockUserRemoteDatasources remoteDatasources;
  late UserLocalDatasources localDatasources;
  late UserRepositoriesImpl repositories;

  setUp(() {
    remoteDatasources = _MockUserRemoteDatasources();
    localDatasources = UserLocalDatasourcesImpl();
    repositories = UserRepositoriesImpl(remoteDatasources, localDatasources);
  });

  test('getUsers maps the remote list and puts added users first', () async {
    when(() => remoteDatasources.getUsers(perPage: 20)).thenAnswer(
      (_) async => [
        UserDataModel.fromJson({
          'id': 1,
          'login': 'mojombo',
          'avatar_url': 'https://avatars.githubusercontent.com/u/1?v=4',
          'type': 'User',
        }),
      ],
    );
    await repositories.addUser(tNormalizedForm);

    final result = await repositories.getUsers(perPage: 20);
    final users = result.getOrElse(() => []);

    expect(users.map((user) => user.login), ['john', 'mojombo']);
    expect(users.first.isLocal, isTrue);
    expect(users.last, tUser);
  });

  test('getUsers converts a Dio timeout into a NetworkFailure', () async {
    when(() => remoteDatasources.getUsers(perPage: 20)).thenThrow(
      DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      ),
    );

    final result = await repositories.getUsers(perPage: 20);

    result.fold(
      (failure) => expect(failure, isA<NetworkFailure>()),
      (_) => fail('Expected a failure'),
    );
  });

  test('addUser generates a unique login from the email', () async {
    await repositories.addUser(tNormalizedForm);
    final result = await repositories.addUser(tNormalizedForm);

    expect(result.map((user) => user.login).getOrElse(() => ''), 'john-1');
  });

  test('getUserDetail returns the local edit instead of the API', () async {
    const form = UserFormEntity(name: 'Tom', email: 'tom@mail.com');
    await repositories.updateUser(user: tUserDetail, form: form);

    final result = await repositories.getUserDetail('mojombo');

    expect(
      result.getOrElse(() => throw StateError('no user')),
      tUserDetail.copyWith(name: 'Tom', email: 'tom@mail.com', company: null),
    );
    verifyNever(() => remoteDatasources.getUserDetail(any()));
  });
}
