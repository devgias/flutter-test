import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_gias/controllers/user/userBloc.dart';
import 'package:flutter_test_gias/repositories/userRepository.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/testData.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository userRepository;

  final firstPage = buildUsers(20);
  final lastPage = buildUsers(5, startId: 21);
  const connectionError = UserRepositoryException('Tidak ada koneksi internet.');

  setUp(() {
    userRepository = MockUserRepository();
  });

  UserBloc buildBloc() => UserBloc(userRepository: userRepository);

  group('UserBloc', () {
    test('initial state is an empty UserState', () {
      expect(buildBloc().state, const UserState());
    });

    blocTest<UserBloc, UserState>(
      'emits [loading, success] and keeps hasReachedMax false '
          'when a full page is returned',
      setUp: () {
        when(() => userRepository.getUsers(perPage: 20, since: null))
            .thenAnswer((_) async => firstPage);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const UserFetched()),
      expect: () => [
        const UserState(status: UserStatus.loading),
        UserState(status: UserStatus.success, users: firstPage),
      ],
    );

    blocTest<UserBloc, UserState>(
      'sets hasReachedMax to true when fewer users than per_page are returned',
      setUp: () {
        when(() => userRepository.getUsers(perPage: 20, since: null))
            .thenAnswer((_) async => lastPage);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const UserFetched()),
      expect: () => [
        const UserState(status: UserStatus.loading),
        UserState(
          status: UserStatus.success,
          users: lastPage,
          hasReachedMax: true,
        ),
      ],
    );

    blocTest<UserBloc, UserState>(
      'appends the next page using the last user id as the since parameter',
      setUp: () {
        when(() => userRepository.getUsers(perPage: 20, since: 20))
            .thenAnswer((_) async => lastPage);
      },
      build: buildBloc,
      seed: () => UserState(status: UserStatus.success, users: firstPage),
      act: (bloc) => bloc.add(const UserFetched()),
      expect: () => [
        UserState(status: UserStatus.loading, users: firstPage),
        UserState(
          status: UserStatus.success,
          users: [...firstPage, ...lastPage],
          hasReachedMax: true,
        ),
      ],
      verify: (_) {
        verify(() => userRepository.getUsers(perPage: 20, since: 20)).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'does nothing when all data has already been loaded',
      build: buildBloc,
      seed: () => UserState(
        status: UserStatus.success,
        users: lastPage,
        hasReachedMax: true,
      ),
      act: (bloc) => bloc.add(const UserFetched()),
      expect: () => <UserState>[],
      verify: (_) {
        verifyNever(
              () => userRepository.getUsers(
            perPage: any(named: 'perPage'),
            since: any(named: 'since'),
          ),
        );
      },
    );

    blocTest<UserBloc, UserState>(
      'emits [loading, failure] with the error message when the first fetch fails',
      setUp: () {
        when(() => userRepository.getUsers(perPage: 20, since: null))
            .thenThrow(connectionError);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const UserFetched()),
      expect: () => [
        const UserState(status: UserStatus.loading),
        UserState(
          status: UserStatus.failure,
          errorMessage: connectionError.message,
        ),
      ],
    );

    blocTest<UserBloc, UserState>(
      'keeps the loaded users when loading the next page fails',
      setUp: () {
        when(() => userRepository.getUsers(perPage: 20, since: 20))
            .thenThrow(connectionError);
      },
      build: buildBloc,
      seed: () => UserState(status: UserStatus.success, users: firstPage),
      act: (bloc) => bloc.add(const UserFetched()),
      expect: () => [
        UserState(status: UserStatus.loading, users: firstPage),
        UserState(
          status: UserStatus.failure,
          users: firstPage,
          errorMessage: connectionError.message,
        ),
      ],
    );

    blocTest<UserBloc, UserState>(
      'clears the previous error message when retrying',
      setUp: () {
        when(() => userRepository.getUsers(perPage: 20, since: 20))
            .thenAnswer((_) async => lastPage);
      },
      build: buildBloc,
      seed: () => UserState(
        status: UserStatus.failure,
        users: firstPage,
        errorMessage: connectionError.message,
      ),
      act: (bloc) => bloc.add(const UserFetched()),
      expect: () => [
        UserState(status: UserStatus.loading, users: firstPage),
        UserState(
          status: UserStatus.success,
          users: [...firstPage, ...lastPage],
          hasReachedMax: true,
        ),
      ],
    );
  });
}