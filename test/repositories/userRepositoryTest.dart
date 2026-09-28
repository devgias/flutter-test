import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_gias/repositories/userRepository.dart';
import 'package:flutter_test_gias/services/Service.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/testData.dart';

class MockUserService extends Mock implements UserService {}

DioException buildDioException(DioExceptionType type, {int? statusCode}) {
  final requestOptions = RequestOptions(path: '/users');
  return DioException(
    requestOptions: requestOptions,
    type: type,
    response: statusCode == null
        ? null
        : Response<dynamic>(
      requestOptions: requestOptions,
      statusCode: statusCode,
    ),
  );
}

void main() {
  late MockUserService userService;
  late UserRepository userRepository;

  setUp(() {
    userService = MockUserService();
    userRepository = UserRepository(userService: userService);
  });

  group('UserRepository', () {
    group('getUsers', () {
      test('returns users from the service using the given parameters',
              () async {
            final users = buildUsers(3);
            when(() => userService.fetchUsers(perPage: 20, since: 46))
                .thenAnswer((_) async => users);

            final result = await userRepository.getUsers(perPage: 20, since: 46);

            expect(result, users);
            verify(() => userService.fetchUsers(perPage: 20, since: 46)).called(1);
          });
    });

    group('getUserDetail', () {
      test('returns the user detail from the service', () async {
        final detail = buildUserDetail();
        when(() => userService.fetchUserDetail('mojombo'))
            .thenAnswer((_) async => detail);

        final result = await userRepository.getUserDetail('mojombo');

        expect(result, detail);
      });

      test('throws UserRepositoryException when the user is not found',
              () async {
            when(() => userService.fetchUserDetail('unknown')).thenAnswer(
                  (_) async => throw buildDioException(
                DioExceptionType.badResponse,
                statusCode: 404,
              ),
            );

            expect(
                  () => userRepository.getUserDetail('unknown'),
              throwsA(
                isA<UserRepositoryException>().having(
                      (error) => error.message,
                  'message',
                  'Data user tidak ditemukan.',
                ),
              ),
            );
          });
    });

    group('error mapping', () {
      final cases = <(String, DioException, String)>[
        (
        'connection timeout',
        buildDioException(DioExceptionType.connectionTimeout),
        'Koneksi timeout, silakan coba lagi.',
        ),
        (
        'receive timeout',
        buildDioException(DioExceptionType.receiveTimeout),
        'Koneksi timeout, silakan coba lagi.',
        ),
        (
        'connection error',
        buildDioException(DioExceptionType.connectionError),
        'Tidak ada koneksi internet.',
        ),
        (
        'rate limit (403)',
        buildDioException(DioExceptionType.badResponse, statusCode: 403),
        'Batas request GitHub API tercapai, coba lagi nanti.',
        ),
        (
        'server error (500)',
        buildDioException(DioExceptionType.badResponse, statusCode: 500),
        'Server bermasalah (500).',
        ),
        (
        'unknown error',
        buildDioException(DioExceptionType.unknown),
        'Terjadi kesalahan, silakan coba lagi.',
        ),
      ];

      for (final (description, exception, expectedMessage) in cases) {
        test('maps $description to a user-friendly message', () {
          when(() => userService.fetchUsers(perPage: 20, since: null))
              .thenAnswer((_) async => throw exception);

          expect(
                () => userRepository.getUsers(perPage: 20),
            throwsA(
              isA<UserRepositoryException>().having(
                    (error) => error.message,
                'message',
                expectedMessage,
              ),
            ),
          );
        });
      }
    });
  });
}