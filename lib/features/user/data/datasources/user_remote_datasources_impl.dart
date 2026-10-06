import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRemoteDatasources)
class UserRemoteDatasourcesImpl implements UserRemoteDatasources {
  @override
  Future<List<UserDataModel>> getUsers({required int perPage}) async {
    final query = {'per_page': perPage};

    final response =
        await AppDio.instance.get<List>('/users', queryParameters: query);

    final result = [...?response.data]
        .map((json) => UserDataModel.fromJson(json as Map<String, dynamic>))
        .toList();

    return result;
  }

  @override
  Future<UserDetailDataModel> getUserDetail(String login) async {
    final response =
        await AppDio.instance.get<Map<String, dynamic>>('/users/$login');

    final result = UserDetailDataModel.fromJson(response.data ?? {});

    return result;
  }
}
