import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giastest/controllers/user/user_form_controller.dart';
import 'package:giastest/style/app_style.dart';
import 'package:giastest/widgets/text_field_input.dart';

class UserForm extends GetView<UserFormController> {
  final bool isAdd;
  const UserForm({Key? key, this.isAdd = true}) : super(key: key);

  @override
  Widget build(BuildContext context) => Form(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldInput(
                controller: controller.nameController,
                hintText: 'Name',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              TextFieldInput(
                controller: controller.emailController,
                hintText: 'Email',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              TextFieldInput(
                controller: controller.companyController,
                hintText: 'Company',
                keyboardType: TextInputType.text,
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => controller.showFormDataSubmit(),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blue,
                  ),
                  child: Text(isAdd ? 'Submit' : 'Edit',
                      style: AppStyle.subTitleStyle.copyWith(
                          color: Colors.white, fontSize: 16, letterSpacing: 1)),
                ),
              ),
              Obx(() => controller.show.value
                  ? Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.red,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Name : ${controller.nameController.text.trim()}',
                            style: AppStyle.subTitleStyle.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Email : ${controller.emailController.text.trim()}',
                            style: AppStyle.subTitleStyle.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Company : ${controller.companyController.text.trim()}',
                            style: AppStyle.subTitleStyle.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox())
            ],
          ),
        ),
      );
}
