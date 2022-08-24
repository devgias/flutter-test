import 'dart:convert';

import 'package:testi/repository/user_repository.dart';

import '../model/user.dart';
import '../api/api.dart';
import '../model/user_edit.dart';

class EditUserViewModel {
  UserRepository _userRepository = UserRepository();

  Future<EditUser> getEditUserList(String login) async {
    dynamic response = await _userRepository.fetchEditUserList(login);
    // print((response as List).map((json) => EditUser.fromJson(json)).toList());
    
    return EditUser.fromJson(response);
  }

  // Future<List<EditUser>> getEditUserList(String login) async {
  //   dynamic response = await _userService.getEditUsers(login);
  //   return jsonDecode(response);
  // }
}