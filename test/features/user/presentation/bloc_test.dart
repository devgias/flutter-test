import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';

class _MockGetUsersUseCase extends Mock implements GetUsersUseCase {}

class _MockGetUserDetailUseCase extends Mock implements GetUserDetailUseCase {}

class _MockAddUserUseCase extends Mock implements AddUserUseCase {}

class _MockUpdateUserUseCase extends Mock implements UpdateUserUseCase {}

void main() {
  final failure = ServerFailure('[403] API rate limit exceeded');

  setUpAll(() {
    registerFallbackValue(const GetUsersParams());
    registerFallbackValue(tForm);
    registerFallbackValue(
      const UpdateUserParams(user: tUserDetail, form: tForm),
    );
  });

  group('UsersBloc', () {
    late _MockGetUsersUseCase getUsersUseCase;

    setUp(() => getUsersUseCase = _MockGetUsersUseCase());

    blocTest<UsersBloc, UsersState>(
      'emits [loading, loaded] when users are fetched',
      setUp: () => when(() => getUsersUseCase(any()))
          .thenAnswer((_) async => right([tUser])),
      build: () => UsersBloc(getUsersUseCase),
      act: (bloc) => bloc.add(const UsersEvent.getUsers()),
      expect: () => [
        const UsersState.loading(),
        const UsersState.loaded([tUser]),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'skips loading on silent refresh and emits error on failure',
      setUp: () => when(() => getUsersUseCase(any()))
          .thenAnswer((_) async => left(failure)),
      build: () => UsersBloc(getUsersUseCase),
      act: (bloc) =>
          bloc.add(const UsersEvent.getUsers(shouldLoading: false)),
      expect: () => [UsersState.error(failure)],
    );
  });

  group('UserDetailBloc', () {
    late _MockGetUserDetailUseCase getUserDetailUseCase;

    setUp(() => getUserDetailUseCase = _MockGetUserDetailUseCase());

    blocTest<UserDetailBloc, UserDetailState>(
      'emits [loading, loaded] with the user detail',
      setUp: () => when(() => getUserDetailUseCase('mojombo'))
          .thenAnswer((_) async => right(tUserDetail)),
      build: () => UserDetailBloc(getUserDetailUseCase),
      act: (bloc) => bloc.add(const UserDetailEvent.getUserDetail('mojombo')),
      expect: () => [
        const UserDetailState.loading(),
        const UserDetailState.loaded(tUserDetail),
      ],
    );
  });

  group('UserFormBloc', () {
    late _MockAddUserUseCase addUserUseCase;
    late _MockUpdateUserUseCase updateUserUseCase;

    setUp(() {
      addUserUseCase = _MockAddUserUseCase();
      updateUserUseCase = _MockUpdateUserUseCase();
    });

    blocTest<UserFormBloc, UserFormState>(
      'emits [submitting, success] when a user is added',
      setUp: () => when(() => addUserUseCase(any()))
          .thenAnswer((_) async => right(tUserDetail)),
      build: () => UserFormBloc(addUserUseCase, updateUserUseCase),
      act: (bloc) => bloc.add(const UserFormEvent.addUser(tForm)),
      expect: () => [
        const UserFormState.submitting(),
        const UserFormState.success(tUserDetail),
      ],
    );

    blocTest<UserFormBloc, UserFormState>(
      'emits [submitting, error] when the update fails',
      setUp: () => when(() => updateUserUseCase(any()))
          .thenAnswer((_) async => left(failure)),
      build: () => UserFormBloc(addUserUseCase, updateUserUseCase),
      act: (bloc) => bloc.add(
        const UserFormEvent.updateUser(user: tUserDetail, form: tForm),
      ),
      expect: () => [
        const UserFormState.submitting(),
        UserFormState.error(failure),
      ],
    );
  });
}
