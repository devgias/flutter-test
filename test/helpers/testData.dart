import 'package:flutter_test_gias/models/userDetailModel.dart';
import 'package:flutter_test_gias/models/userModel.dart';

Map<String, dynamic> buildUserJson({int id = 1, String login = 'mojombo'}) {
  return {
    'login': login,
    'id': id,
    'node_id': 'MDQ6VXNlcjE=',
    'avatar_url': 'https://avatars.githubusercontent.com/u/$id?v=4',
    'gravatar_id': '',
    'url': 'https://api.github.com/users/$login',
    'html_url': 'https://github.com/$login',
    'followers_url': 'https://api.github.com/users/$login/followers',
    'following_url': 'https://api.github.com/users/$login/following{/other_user}',
    'gists_url': 'https://api.github.com/users/$login/gists{/gist_id}',
    'starred_url': 'https://api.github.com/users/$login/starred{/owner}{/repo}',
    'subscriptions_url': 'https://api.github.com/users/$login/subscriptions',
    'organizations_url': 'https://api.github.com/users/$login/orgs',
    'repos_url': 'https://api.github.com/users/$login/repos',
    'events_url': 'https://api.github.com/users/$login/events{/privacy}',
    'received_events_url': 'https://api.github.com/users/$login/received_events',
    'type': 'User',
    'user_view_type': 'public',
    'site_admin': false,
  };
}

UserModel buildUser({int id = 1, String login = 'mojombo'}) {
  return UserModel.fromJson(buildUserJson(id: id, login: login));
}

List<UserModel> buildUsers(int count, {int startId = 1}) {
  return List.generate(
    count,
        (index) => buildUser(id: startId + index, login: 'user${startId + index}'),
  );
}

UserDetailModel buildUserDetail({
  String? name = 'Tom Preston-Werner',
  String? email = 'tom@example.com',
  String? company = '@chatterbugapp',
}) {
  return UserDetailModel(
    id: 1,
    login: 'mojombo',
    avatarUrl: 'https://avatars.githubusercontent.com/u/1?v=4',
    name: name,
    email: email,
    company: company,
  );
}