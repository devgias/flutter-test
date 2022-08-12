import 'package:get/get.dart';
import 'package:giastest/controllers/user/user_controller.dart';
import 'package:giastest/controllers/user/user_form_controller.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}

class UserFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserFormController());
  }
}
