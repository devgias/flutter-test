import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';

enum _SnackbarType {
  success(color: AppColors.success200, icon: Icons.check_circle_rounded),
  error(color: AppColors.danger200, icon: Icons.error_rounded),
  ;

  const _SnackbarType({required this.color, required this.icon});

  final Color color;
  final IconData icon;
}

class CustomSnackbar {
  final BuildContext context;
  CustomSnackbar.of(this.context);

  void showSuccess(String message) =>
      _show(snackbarType: _SnackbarType.success, message: message);
  void showError(String message) =>
      _show(snackbarType: _SnackbarType.error, message: message);

  void _show({
    required _SnackbarType snackbarType,
    required String message,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          content: NeumorphicContainer(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(snackbarType.icon, color: snackbarType.color),
                const Gap(12),
                Flexible(
                  child: Text(
                    message,
                    style: AppTextStyle.s12w600
                        .copyWith(color: AppColors.neutral500),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
