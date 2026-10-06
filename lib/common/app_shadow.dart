import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';

/// Neumorphic shadow pairs: a light source on the top-left and a dark
/// shadow on the bottom-right.
class AppShadow {
  const AppShadow._();

  static List<BoxShadow> raised({double depth = 6}) => [
        BoxShadow(
          color: AppColors.shadowDark.withValues(alpha: 0.6),
          offset: Offset(depth, depth),
          blurRadius: depth * 2.5,
        ),
        BoxShadow(
          color: AppColors.shadowLight.withValues(alpha: 0.9),
          offset: Offset(-depth, -depth),
          blurRadius: depth * 2.5,
        ),
      ];

  static final defaultShadow = raised();
  static final smallShadow = raised(depth: 3);
}
