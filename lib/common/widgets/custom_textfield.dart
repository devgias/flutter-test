import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:reactive_forms/reactive_forms.dart';

final _defaultValidationMessages = <String, ValidationMessageFunction>{
  ValidationMessage.required: (_) => 'Required',
  ValidationMessage.email: (_) => 'Invalid email',
  ValidationMessage.maxLength: (error) =>
      'Max length is ${(error as Map)['requiredLength']}',
};

/// Text field sunk into the surface (neumorphic "pressed" style),
/// bound to a reactive form control.
class CustomTextField extends StatelessWidget {
  final String formControlName;
  final String? label;
  final String? hintText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Map<String, ValidationMessageFunction>? validationMessages;

  const CustomTextField.reactive({
    super.key,
    required this.formControlName,
    this.label,
    this.hintText,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.validationMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              label!,
              style:
                  AppTextStyle.s12w600.copyWith(color: AppColors.neutral400),
            ),
          ),
          const Gap(),
        ],
        NeumorphicContainer.pressed(
          borderRadius: 16,
          child: ReactiveTextField<String>(
            formControlName: formControlName,
            readOnly: readOnly,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            style: AppTextStyle.s14w600.copyWith(color: AppColors.neutral500),
            validationMessages: {
              ..._defaultValidationMessages,
              ...?validationMessages,
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  AppTextStyle.s14w400.copyWith(color: AppColors.neutral400),
              prefixIcon: prefixIcon,
              prefixIconColor: AppColors.neutral400,
              filled: false,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
