import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giastest/models/user_model.dart';
import 'package:giastest/services/user_service.dart';

class UserFormController extends GetxController with StateMixin<UserModel> {
  UserModel? _user;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  RxBool show = RxBool(false);

  getDetailUser({required String url}) async {
    final response = await UserService.getUser(url: url);
    if (response.value == null) {
      change(null, status: RxStatus.error(response.message));
      return;
    }
    _user = response.value;
    nameController.text = _user?.login ?? '';
    emailController.text = _user?.email ?? '';
    companyController.text = _user?.company ?? '';
    change(_user, status: RxStatus.success());
  }

  addMode() => change(null, status: RxStatus.success());

  showFormDataSubmit() {
    show.value = !show.value;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    companyController.dispose();
    show.value = false;
    super.dispose();
  }
}
