import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_gias/controllers/user/userDetail/userDetailBloc.dart';
import 'package:flutter_test_gias/repositories/userRepository.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/testData.dart';
class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository userRepository;

  final userDetail = buildUserDetail();
  const notFoundError = UserRepositoryException('Data user tidak ditemukan.');

  setUp(() {
    userRepository = MockUserRepository();
  });

  UserDetailBloc buildBloc() => UserDetailBloc(userRepository: userRepository);

  group('UserDetailBloc', () {
    test('initial state is an empty UserDetailState', () {
      expect(buildBloc().state, const UserDetailState());
    });

    blocTest<UserDetailBloc, UserDetailState>(
      'emits [loading, success] with the detail when the request succeeds',
      setUp: () {
        when(() => userRepository.getUserDetail('mojombo'))
            .thenAnswer((_) async => userDetail);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const UserDetailRequested('mojombo')),
      expect: () => [
        const UserDetailState(status: UserDetailStatus.loading),
        UserDetailState(status: UserDetailStatus.success, detail: userDetail),
      ],
      verify: (_) {
        verify(() => userRepository.getUserDetail('mojombo')).called(1);
      },
    );

    blocTest<UserDetailBloc, UserDetailState>(
      'emits [loading, failure] with the error message when the request fails',
      setUp: () {
        when(() => userRepository.getUserDetail('unknown'))
            .thenThrow(notFoundError);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const UserDetailRequested('unknown')),
      expect: () => [
        const UserDetailState(status: UserDetailStatus.loading),
        UserDetailState(
          status: UserDetailStatus.failure,
          errorMessage: notFoundError.message,
        ),
      ],
    );

    blocTest<UserDetailBloc, UserDetailState>(
      'clears the error message and succeeds when retrying after a failure',
      setUp: () {
        when(() => userRepository.getUserDetail('mojombo'))
            .thenAnswer((_) async => userDetail);
      },
      build: buildBloc,
      seed: () => UserDetailState(
        status: UserDetailStatus.failure,
        errorMessage: notFoundError.message,
      ),
      act: (bloc) => bloc.add(const UserDetailRequested('mojombo')),
      expect: () => [
        const UserDetailState(status: UserDetailStatus.loading),
        UserDetailState(status: UserDetailStatus.success, detail: userDetail),
      ],
    );
  });
}