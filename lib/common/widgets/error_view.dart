import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';

class ErrorView extends StatelessWidget {
  final Failure? failure;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    required this.failure,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const NeumorphicContainer(
              shape: BoxShape.circle,
              padding: EdgeInsets.all(24),
              child: Icon(
                Icons.cloud_off_rounded,
                size: 40,
                color: AppColors.danger200,
              ),
            ),
            const Gap(24),
            Text(
              'Oops, something went wrong',
              textAlign: TextAlign.center,
              style: AppTextStyle.s16w700,
            ),
            const Gap(),
            Text(
              failure?.toUserMessage() ?? 'Please try again.',
              textAlign: TextAlign.center,
              style: AppTextStyle.s12w400.copyWith(color: AppColors.neutral400),
            ),
            const Gap(24),
            CustomButton.elevated(
              label: 'Try Again',
              icon: const Icon(Icons.refresh_rounded),
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
