import 'package:flutter/material.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/text_style_constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.githubDark,
          foregroundColor: ColorConstants.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyleConstants.geistSemiBold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
