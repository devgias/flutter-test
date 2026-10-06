import 'package:flutter_test_quiz/features/user/user.dart';

abstract class UserRemoteDatasources {
  Future<List<UserDataModel>> getUsers({required int perPage});

  Future<UserDetailDataModel> getUserDetail(String login);
}
