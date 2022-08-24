import 'dart:convert';

import 'package:testi/repository/user_repository.dart';

import '../model/user.dart';
import '../api/api.dart';
import '../model/user_edit.dart';

class UserViewModel {
  UserRepository _userRepository = UserRepository();

  Future<List<User>> getUserList() async {
    dynamic response = await _userRepository.fetchUserList();
    // print((response as List).map((json) => User.fromJson(json)).toList());
    
    return (response as List).map((json) => User.fromJson(json)).toList();
  }

  // Future<List<EditUser>> getEditUserList(String login) async {
  //   dynamic response = await _userService.getEditUsers(login);
  //   return jsonDecode(response);
  // }
}