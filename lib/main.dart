import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:giastest/bindings/bindings.dart';
import 'package:giastest/views/user/user_add_view.dart';
import 'package:giastest/views/user/user_edit_view.dart';
import 'package:giastest/views/user/users_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/users',
      getPages: [
        GetPage(
            name: '/users',
            page: () => const UsersView(),
            binding: UsersBinding()),
        GetPage(
            name: '/user/edit',
            page: () => const UserFormEditView(),
            binding: UserFormBinding()),
        GetPage(
            name: '/user/add',
            page: () => const UserFormAddView(),
            binding: UserFormBinding()),
      ],
    );
  }
}
