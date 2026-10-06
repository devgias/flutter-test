import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';

class _MockUserRepositories extends Mock implements UserRepositories {}

void main() {
  late _MockUserRepositories repositories;

  setUpAll(() {
    registerFallbackValue(tNormalizedForm);
    registerFallbackValue(tUserDetail);
  });

  setUp(() => repositories = _MockUserRepositories());

  group('GetUsersUseCase', () {
    test('requests 20 users by default', () async {
      when(() => repositories.getUsers(perPage: any(named: 'perPage')))
          .thenAnswer((_) async => right([tUser]));

      final result = await GetUsersUseCase(repositories)(const GetUsersParams());

      expect(result.getOrElse(() => []), [tUser]);
      verify(() => repositories.getUsers(perPage: 20)).called(1);
    });
  });

  group('GetUserDetailUseCase', () {
    test('trims the login before requesting', () async {
      when(() => repositories.getUserDetail(any()))
          .thenAnswer((_) async => right(tUserDetail));

      await GetUserDetailUseCase(repositories)('  mojombo ');

      verify(() => repositories.getUserDetail('mojombo')).called(1);
    });
  });

  group('AddUserUseCase', () {
    test('normalizes the form before saving', () async {
      when(() => repositories.addUser(any()))
          .thenAnswer((_) async => right(tUserDetail));

      await AddUserUseCase(repositories)(tForm);

      verify(() => repositories.addUser(tNormalizedForm)).called(1);
    });

    test('rejects an invalid email without calling the repository', () async {
      final result = await AddUserUseCase(repositories)(
        const UserFormEntity(name: 'John', email: 'not-an-email'),
      );

      expect(result.isLeft(), isTrue);
      result.leftMap((failure) => expect(failure, isA<ValidationFailure>()));
      verifyNever(() => repositories.addUser(any()));
    });
  });

  group('UpdateUserUseCase', () {
    test('rejects an empty name', () async {
      final result = await UpdateUserUseCase(repositories)(
        const UpdateUserParams(
          user: tUserDetail,
          form: UserFormEntity(name: '   ', email: 'tom@mail.com'),
        ),
      );

      expect(result.isLeft(), isTrue);
      verifyNever(
        () => repositories.updateUser(
          user: any(named: 'user'),
          form: any(named: 'form'),
        ),
      );
    });

    test('passes the normalized form to the repository', () async {
      when(
        () => repositories.updateUser(
          user: any(named: 'user'),
          form: any(named: 'form'),
        ),
      ).thenAnswer((_) async => right(tUserDetail));

      await UpdateUserUseCase(repositories)(
        const UpdateUserParams(user: tUserDetail, form: tForm),
      );

      verify(
        () => repositories.updateUser(user: tUserDetail, form: tNormalizedForm),
      ).called(1);
    });
  });
}
