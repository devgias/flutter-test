import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserLocalDatasources)
class UserLocalDatasourcesImpl implements UserLocalDatasources {
  final _users = <String, UserDetailDataModel>{};

  @override
  List<UserDetailDataModel> getAddedUsers() =>
      _users.values.where((user) => user.isLocal).toList().reversed.toList();

  @override
  UserDetailDataModel? getUser(String login) => _users[login];

  @override
  UserDetailDataModel saveUser(UserDetailDataModel user) {
    _users[user.login!] = user;

    return user;
  }

  @override
  bool isLoginTaken(String login) => _users.containsKey(login);
}
