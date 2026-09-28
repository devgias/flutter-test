import 'package:dio/dio.dart';

import '../models/userDetailModel.dart';
import '../models/userModel.dart';
import '../services/Service.dart';

class UserRepositoryException implements Exception {
  const UserRepositoryException(this.message);

  final String message;

  @override
  String toString() => message;
}
class UserRepository {
  UserRepository({required UserService userService})
      : _userService = userService;

  final UserService _userService;

  Future<List<UserModel>> getUsers({
    required int perPage,
    int? since,
  }) {
    return _guard(
          () => _userService.fetchUsers(perPage: perPage, since: since),
    );
  }

  Future<UserDetailModel> getUserDetail(String login) {
    return _guard(() => _userService.fetchUserDetail(login));
  }

  Future<T> _guard<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (error) {
      throw UserRepositoryException(_mapErrorMessage(error));
    }
  }

  String _mapErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Koneksi timeout, silakan coba lagi.';
      case DioExceptionType.connectionError:
        return 'Tidak ada koneksi internet.';
      case DioExceptionType.badResponse:
        return _mapStatusCodeMessage(error.response?.statusCode);
      default:
        return 'Terjadi kesalahan, silakan coba lagi.';
    }
  }

  String _mapStatusCodeMessage(int? statusCode) {
    switch (statusCode) {
      case 403:
        return 'Batas request GitHub API tercapai, coba lagi nanti.';
      case 404:
        return 'Data user tidak ditemukan.';
      default:
        return 'Server bermasalah ($statusCode).';
    }
  }
}