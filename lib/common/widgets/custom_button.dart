import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';

enum _CustomButton { elevated, icon, back }

class CustomButton extends StatefulWidget {
  final _CustomButton _customButton;

  final bool isLoading;
  final String label;
  final void Function()? onPressed;
  final Widget? icon;
  final Color? color;
  final String? tooltip;

  const CustomButton.elevated({
    super.key,
    this.isLoading = false,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
  })  : _customButton = _CustomButton.elevated,
        tooltip = null;

  const CustomButton.icon({
    super.key,
    required Widget this.icon,
    required this.onPressed,
    this.color,
    this.tooltip,
  })  : _customButton = _CustomButton.icon,
        isLoading = false,
        label = '';

  const CustomButton.back({
    super.key,
    this.onPressed,
    this.color,
  })  : _customButton = _CustomButton.back,
        icon = const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
        isLoading = false,
        label = '',
        tooltip = 'Back';

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final _pressedNotifier = ValueNotifier(false);

  bool get _isEnabled => widget.onPressed != null && !widget.isLoading;

  @override
  void dispose() {
    _pressedNotifier.dispose();
    super.dispose();
  }

  void _setPressed(bool value) {
    if (_isEnabled) _pressedNotifier.value = value;
  }

  void _onTap() {
    if (widget._customButton == _CustomButton.back &&
        widget.onPressed == null) {
      Navigator.maybePop(context);

      return;
    }

    if (_isEnabled) widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled =
        _isEnabled || widget._customButton == _CustomButton.back;
    final foregroundColor = isEnabled
        ? (widget.color ?? AppColors.primary400)
        : AppColors.neutral400;

    final content = switch (widget._customButton) {
      _CustomButton.elevated => _ElevatedContent(
          isLoading: widget.isLoading,
          label: widget.label,
          icon: widget.icon,
          color: foregroundColor,
        ),
      _CustomButton.icon || _CustomButton.back => IconTheme(
          data: IconThemeData(color: foregroundColor),
          child: widget.icon!,
        ),
    };

    final isCircle = widget._customButton != _CustomButton.elevated;

    final button = GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      onTap: _onTap,
      child: ValueListenableBuilder(
        valueListenable: _pressedNotifier,
        builder: (context, isPressed, child) {
          final padding = isCircle
              ? const EdgeInsets.all(14)
              : const EdgeInsets.symmetric(horizontal: 24, vertical: 18);
          final shape = isCircle ? BoxShape.circle : BoxShape.rectangle;

          return isPressed || !isEnabled
              ? NeumorphicContainer.pressed(
                  padding: padding,
                  shape: shape,
                  borderRadius: 16,
                  child: child,
                )
              : NeumorphicContainer(
                  padding: padding,
                  shape: shape,
                  borderRadius: 16,
                  child: child,
                );
        },
        child: content,
      ),
    );

    return Semantics(
      button: true,
      enabled: isEnabled,
      label: widget.tooltip ?? widget.label,
      child: widget.tooltip == null
          ? button
          : Tooltip(message: widget.tooltip, child: button),
    );
  }
}

class _ElevatedContent extends StatelessWidget {
  final bool isLoading;
  final String label;
  final Widget? icon;
  final Color color;

  const _ElevatedContent({
    required this.isLoading,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: SizedBox.square(
          dimension: 18,
          child: CircularProgressIndicator(strokeWidth: 2.5, color: color),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          IconTheme(data: IconThemeData(color: color, size: 20), child: icon!),
          const Gap(),
        ],
        Text(label, style: AppTextStyle.s14w700.copyWith(color: color)),
      ],
    );
  }
}
