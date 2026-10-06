import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';

enum _NeumorphicStyle { raised, pressed }

/// Base surface of the soft UI design.
///
/// - [NeumorphicContainer] extrudes the surface out of the background.
/// - [NeumorphicContainer.pressed] sinks the surface into the background,
///   used for inputs and the pressed state of buttons.
class NeumorphicContainer extends StatelessWidget {
  final _NeumorphicStyle _style;

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double depth;
  final BoxShape shape;
  final Color color;
  final double? width;
  final double? height;

  const NeumorphicContainer({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.borderRadius = 20,
    this.depth = 6,
    this.shape = BoxShape.rectangle,
    this.color = AppColors.background,
    this.width,
    this.height,
  }) : _style = _NeumorphicStyle.raised;

  const NeumorphicContainer.pressed({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.borderRadius = 20,
    this.depth = 6,
    this.shape = BoxShape.rectangle,
    this.color = AppColors.background,
    this.width,
    this.height,
  }) : _style = _NeumorphicStyle.pressed;

  static const _animationDuration = Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    final radius =
        shape == BoxShape.circle ? null : BorderRadius.circular(borderRadius);

    final decoration = switch (_style) {
      _NeumorphicStyle.raised => BoxDecoration(
          color: color,
          shape: shape,
          borderRadius: radius,
          boxShadow: AppShadow.raised(depth: depth),
        ),
      _NeumorphicStyle.pressed => BoxDecoration(
          shape: shape,
          borderRadius: radius,
          border: Border.all(color: AppColors.shadowLight.withValues(alpha: 0.6)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.lerp(color, AppColors.shadowDark, 0.35)!,
              color,
              Color.lerp(color, AppColors.shadowLight, 0.6)!,
            ],
            stops: const [0, 0.35, 1],
          ),
        ),
    };

    return AnimatedContainer(
      duration: _animationDuration,
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: decoration,
      child: child,
    );
  }
}
