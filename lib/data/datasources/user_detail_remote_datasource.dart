import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
import '../../core/error/exception.dart';
import '../models/user_detail_model.dart';

class UserDetailRemoteDataSource {
  final Dio _dio;

  UserDetailRemoteDataSource(this._dio);

  Future<UserDetailModel> fetchUserDetail(String username) async {
    try {
      final response = await _dio.get('${ApiConstants.users}/$username');

      return UserDetailModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException('Unable to connect to the server.');
      }
      if (e.response?.statusCode == 403) {
        throw const ServerException(
          'API rate limit exceeded. Please try again later.',
        );
      }
      throw const ServerException('Something went wrong on the server.');
    }
  }
}
