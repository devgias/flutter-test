import 'package:flutter/material.dart';
import 'package:gias_flutter_test/core/constants/route_path_constants.dart';
import 'package:gias_flutter_test/presentation/views/add_user_screen.dart';
import 'package:gias_flutter_test/presentation/views/edit_user_page.dart';
import 'package:gias_flutter_test/presentation/views/user_list_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePathConstants.userList:
        return MaterialPageRoute(builder: (_) => const UserListScreen());
      case RoutePathConstants.addUser:
        return MaterialPageRoute(builder: (_) => const AddUserScreen());
      case RoutePathConstants.editUser:
        final username = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => EditUserPage(username: username));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}