import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giastest/controllers/user/user_form_controller.dart';
import 'package:giastest/style/app_style.dart';
import 'package:giastest/widgets/user/user_form.dart';

class UserFormEditView extends GetView<UserFormController> {
  const UserFormEditView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getDetailUser(url: Get.parameters['url'] ?? '');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User Edit',
          style: AppStyle.titleStyle,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: controller.obx(
          (state) => const UserForm(isAdd: false),
          onError: (error) => Center(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/error.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      error.toString(),
                      style: AppStyle.titleStyle,
                    ),
                    InkWell(
                      onTap: () => controller.getDetailUser(
                          url: Get.parameters['url'] ?? ''),
                      child: Text(
                        ' Retry',
                        style: AppStyle.titleStyle
                            .copyWith(color: Colors.blue[400]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
