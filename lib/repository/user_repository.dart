import 'dart:convert';

import 'package:testi/api/api.dart';

import '../model/user.dart';

class UserRepository {
  final UserService _userService = UserService();

  Future<dynamic> fetchUserList() async {
    dynamic response = await _userService.getUsers();
    return jsonDecode(response);
  }

  Future<dynamic> fetchEditUserList(String login) async {
    dynamic response = await _userService.getEditUsers(login);
    
    // print(jsonDecode(response));
    return jsonDecode(response);
  }
}