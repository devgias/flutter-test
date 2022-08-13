part of 'widgets.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final TextInputType keyboardType;
  const TextFieldInput({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          focusedBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          enabledBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          contentPadding: const EdgeInsets.all(8),
        ),
      );
}
