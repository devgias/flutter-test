import 'package:flutter_test_quiz/features/user/user.dart';

/// The GitHub public API is read-only for other accounts, so users that are
/// edited or added in the app are kept here for the current session.
abstract class UserLocalDatasources {
  List<UserDetailDataModel> getAddedUsers();

  /// Returns the locally saved version of [login], if any.
  UserDetailDataModel? getUser(String login);

  UserDetailDataModel saveUser(UserDetailDataModel user);

  bool isLoginTaken(String login);
}
