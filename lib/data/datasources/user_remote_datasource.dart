import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
import '../../core/error/exception.dart';
import '../models/user_model.dart';

class UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSource(this._dio);

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dio.get(
        ApiConstants.users,
        queryParameters: {
          'per_page': 20,
        },
      );

      final data = response.data as List<dynamic>;

      return data
          .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException(
          'Unable to connect to the server.',
        );
      }
      if (e.response?.statusCode == 403) {
        throw const ServerException(
          'API rate limit exceeded. Please try again later.',
        );
      }
      throw const ServerException(
        'Something went wrong on the server.',
      );
    }
  }
}
