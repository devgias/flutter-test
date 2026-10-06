import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;
  final VoidCallback? onTap;

  const UserCard({super.key, required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: NeumorphicContainer(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CustomImageNetwork.avatar(user.avatarUrl, name: user.login),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.login,
                    style: AppTextStyle.s16w700,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _UserBadge(label: user.type),
                      if (user.isLocal)
                        const _UserBadge(
                          label: 'Local',
                          color: AppColors.success200,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(),
            const NeumorphicContainer(
              shape: BoxShape.circle,
              depth: 3,
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.edit_rounded,
                size: 16,
                color: AppColors.primary400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _UserBadge({required this.label, this.color = AppColors.primary400});

  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer.pressed(
      borderRadius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Text(label, style: AppTextStyle.s10w600.copyWith(color: color)),
    );
  }
}
