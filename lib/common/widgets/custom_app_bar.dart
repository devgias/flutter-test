import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';

/// Flat app bar on the neumorphic background with a raised back button.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final List<Widget> actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = true,
    this.actions = const [],
  });

  @override
  Size get preferredSize => const Size.fromHeight(88);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        child: Row(
          children: [
            if (showBackButton) ...[
              const CustomButton.back(),
              const Gap(16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.s22w700
                        .copyWith(color: AppColors.neutral500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: AppTextStyle.s12w400
                          .copyWith(color: AppColors.neutral400),
                    ),
                ],
              ),
            ),
            ...actions,
          ],
        ),
      ),
    );
  }
}
