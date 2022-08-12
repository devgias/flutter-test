import 'package:get/get.dart';
import 'package:giastest/models/user_model.dart';
import 'package:giastest/services/user_service.dart';

class UserController extends GetxController with StateMixin<List<UserModel>> {
  getUsers() async {
    change(null, status: RxStatus.loading());
    final response = await UserService.getUsers();
    if (response.value == null) {
      change(null, status: RxStatus.error(response.message));
      return;
    }
    if (response.value?.isEmpty ?? true) {
      change(null, status: RxStatus.empty());
      return;
    }
    change(response.value!, status: RxStatus.success());
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
