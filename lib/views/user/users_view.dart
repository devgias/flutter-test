import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giastest/controllers/user/user_controller.dart';
import 'package:giastest/style/app_style.dart';
import 'package:giastest/widgets/user/data_empty_widget.dart';
import 'package:giastest/widgets/user/user_card_tile.dart';
import 'package:giastest/widgets/users_loading.dart';

class UsersView extends GetView<UserController> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Users',
            style: AppStyle.titleStyle,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Get.toNamed('/user/add'),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.getUsers(),
          child: controller.obx(
              (users) => ListView.builder(
                    itemCount: users?.length ?? 0,
                    itemBuilder: (context, index) =>
                        UserCardTile(user: users?[index]),
                  ),
              onEmpty: const EmptyWidget(),
              onError: (error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              overflow: TextOverflow.ellipsis,
                            ),
                            InkWell(
                              onTap: () => controller.getUsers(),
                              child: Text(
                                ' Retry',
                                style: AppStyle.titleStyle
                                    .copyWith(color: Colors.blue[400]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              onLoading: const ListLoading()),
        ),
      );
}
