import 'dart:convert';

import 'package:testi/model/user_edit.dart';

import '../model/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  dynamic getUsers() async {
    final url = Uri.parse('https://api.github.com/users?per_page=20');

    final result = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      }
    );
    // print("works service");
    return result.body;
  }

  dynamic getEditUsers(String login) async {
    final url = Uri.parse('https://api.github.com/users/$login');

    final result = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      }
    );

    return result.body;
  }
}

