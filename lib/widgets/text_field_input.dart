import 'package:flutter/material.dart';
import 'package:giastest/style/app_style.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  const TextFieldInput({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.maxLines = 1,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          focusedBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          enabledBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          hintText: hintText,
          labelStyle: AppStyle.subTitleStyle,
          labelText: hintText,
          border: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          contentPadding: const EdgeInsets.all(8),
        ),
      );
}
