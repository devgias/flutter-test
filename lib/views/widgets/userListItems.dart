import 'package:flutter/material.dart';

import '../../models/userModel.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({super.key, required this.user, this.onTap});

  final UserModel user;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl)),
      title: Text(user.login),
      subtitle: Text(user.htmlUrl),
      trailing: Text(user.type),
    );
  }
}