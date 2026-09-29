import 'package:flutter/material.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/text_style_constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.initialValue,
    this.hintText,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyleConstants.geistSemiBold.copyWith(
            color: ColorConstants.blueGrey600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          validator: validator,
          keyboardType: keyboardType,
          style: TextStyleConstants.geistRegular.copyWith(
            color: ColorConstants.githubDark,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 16,
            ),
            prefixIcon: const SizedBox(width: 16),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 16, minHeight: 0),
            suffixIcon: const SizedBox(width: 16),
            suffixIconConstraints:
                const BoxConstraints(minWidth: 16, minHeight: 0),
            errorStyle: TextStyleConstants.geistRegular.copyWith(
              color: ColorConstants.errorRed,
              fontSize: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorConstants.grey300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorConstants.grey300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorConstants.githubDark),
            ),
          ),
        ),
      ],
    );
  }
}
