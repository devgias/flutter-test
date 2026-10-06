import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: NeumorphicContainer(
        shape: BoxShape.circle,
        padding: EdgeInsets.all(20),
        child: SizedBox.square(
          dimension: 28,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: AppColors.primary400,
          ),
        ),
      ),
    );
  }
}
