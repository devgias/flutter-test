import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_gias/models/userModel.dart';

import '../helpers/testData.dart';

void main() {
  group('UserModel', () {
    group('fromJson', () {
      test('maps every JSON key to the correct property', () {
        final user = UserModel.fromJson(buildUserJson());

        expect(user.login, 'mojombo');
        expect(user.id, 1);
        expect(user.nodeId, 'MDQ6VXNlcjE=');
        expect(user.avatarUrl, 'https://avatars.githubusercontent.com/u/1?v=4');
        expect(user.htmlUrl, 'https://github.com/mojombo');
        expect(user.type, 'User');
        expect(user.userViewType, 'public');
        expect(user.siteAdmin, isFalse);
      });

      test('falls back to default values when keys are missing or null', () {
        final user = UserModel.fromJson({'login': null});

        expect(user.login, '');
        expect(user.id, 0);
        expect(user.avatarUrl, '');
        expect(user.siteAdmin, isFalse);
      });
    });

    group('fromJsonList', () {
      test('converts a JSON list into a list of UserModel', () {
        final users = UserModel.fromJsonList([
          buildUserJson(id: 1, login: 'mojombo'),
          buildUserJson(id: 2, login: 'defunkt'),
        ]);

        expect(users, hasLength(2));
        expect(users.first.login, 'mojombo');
        expect(users.last.id, 2);
      });

      test('returns an empty list when the JSON list is empty', () {
        expect(UserModel.fromJsonList([]), isEmpty);
      });
    });

    group('toJson', () {
      test('produces the same JSON that was parsed', () {
        final json = buildUserJson();

        expect(UserModel.fromJson(json).toJson(), json);
      });
    });

    group('equality', () {
      test('two users with the same data are equal', () {
        expect(buildUser(), equals(buildUser()));
      });

      test('two users with different ids are not equal', () {
        expect(buildUser(id: 1), isNot(equals(buildUser(id: 2))));
      });
    });
  });
}