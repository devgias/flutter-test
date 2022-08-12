import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giastest/models/user_model.dart';
import 'package:giastest/style/app_style.dart';

class UserCardTile extends StatelessWidget {
  final UserModel? user;
  const UserCardTile({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: ListTile(
          onTap: () => Get.toNamed('/user/edit?login=${user?.login}'),
          title: Text(
            "User : ${user?.login ?? '-'}",
            style: AppStyle.titleStyle,
          ),
          subtitle: Text("Type : ${user?.userType ?? '-'}"),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user?.avatar ?? '-'),
          ),
          trailing: const Icon(Icons.mode_edit_outline_rounded),
        ),
      );
}
