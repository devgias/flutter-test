import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giastest/controllers/user/user_form_controller.dart';
import 'package:giastest/style/app_style.dart';
import 'package:giastest/widgets/user/user_form.dart';

class UserFormAddView extends GetView<UserFormController> {
  const UserFormAddView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.addMode();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User Add',
          style: AppStyle.titleStyle,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: controller.obx(
          (state) => const UserForm(),
        ),
      )),
    );
  }
}
