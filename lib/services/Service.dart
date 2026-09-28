
import 'package:dio/dio.dart';

import '../models/userDetailModel.dart';
import '../models/userModel.dart';

class UserService {
  UserService({Dio? dio})
      : _dio = dio ??
      Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {'Content-type': 'application/json'},
        ),
      );

  static const String _baseUrl = 'https://api.github.com';
  static const String _usersPath = '/users';

  final Dio _dio;

  Future<List<UserModel>> fetchUsers({
    int perPage = 20,
    int? since,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      _usersPath,
      queryParameters: {
        'per_page': perPage,
        if (since != null) 'since': since,
      },
    );

    return UserModel.fromJsonList(response.data ?? []);
  }

  Future<UserDetailModel> fetchUserDetail(String login) async {
    final response = await _dio.get<Map<String, dynamic>>('$_usersPath/$login');

    return UserDetailModel.fromJson(response.data ?? {});
  }
}