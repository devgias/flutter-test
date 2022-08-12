import 'dart:async';
import 'package:giastest/api/api_service.dart';
import 'package:giastest/api/api_url.dart';
import 'package:giastest/models/api_return_value.dart';
import 'package:giastest/models/user_model.dart';

class UserService {
  static Future<ApiReturnValue<List<UserModel>>> getUsers(
      {int page = 20}) async {
    try {
      final json = await ApiService()
          .get("${ApiUrl.baseUrl}/users?per_page=$page", headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 10));
      if (json.value == null) {
        return ApiReturnValue<List<UserModel>>(
          value: null,
          message: json.message,
        );
      }
      final users =
          (json.value as List).map((e) => UserModel.fromJson(e)).toList();
      return ApiReturnValue(value: users);
    } catch (e) {
      return ApiReturnValue<List<UserModel>>(
        value: null,
        message: e.toString(),
      );
    }
  }

  static Future<ApiReturnValue<UserModel>> getUser(
      {required String userLogin}) async {
    try {
      final json = await ApiService()
          .get("${ApiUrl.baseUrl}/users/$userLogin", headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 10));
      if (json.value == null) {
        return ApiReturnValue<UserModel>(
          value: null,
          message: json.message,
        );
      }
      final user = UserModel.fromJson(json.value);
      return ApiReturnValue(value: user);
    } catch (e) {
      return ApiReturnValue(
        value: null,
        message: e.toString(),
      );
    }
  }
}
