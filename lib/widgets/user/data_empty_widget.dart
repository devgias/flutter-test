import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:giastest/controllers/user/user_controller.dart';
import 'package:giastest/style/app_style.dart';

class EmptyWidget extends GetView<UserController> {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/empty.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No users found',
                  style: AppStyle.titleStyle,
                ),
                InkWell(
                  onTap: () => controller.getUsers(),
                  child: Text(
                    ' Retry',
                    style:
                        AppStyle.titleStyle.copyWith(color: Colors.blue[400]),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
