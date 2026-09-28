import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_gias/repositories/userRepository.dart';
import 'package:flutter_test_gias/services/Service.dart';
import 'package:flutter_test_gias/views/pages/userListPage.dart';
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => UserRepository(userService: UserService()),
      child: MaterialApp(
        title: 'GitHub Users',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
        home: const UserListPage(),
      ),
    );
  }
}