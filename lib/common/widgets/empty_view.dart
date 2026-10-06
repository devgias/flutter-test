import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';

class EmptyView extends StatelessWidget {
  final String message;

  const EmptyView({super.key, this.message = 'No data yet'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const NeumorphicContainer.pressed(
            shape: BoxShape.circle,
            padding: EdgeInsets.all(24),
            child: Icon(
              Icons.inbox_rounded,
              size: 40,
              color: AppColors.neutral400,
            ),
          ),
          const Gap(16),
          Text(
            message,
            style: AppTextStyle.s14w600.copyWith(color: AppColors.neutral400),
          ),
        ],
      ),
    );
  }
}
