import 'package:flutter/material.dart';
typedef Validator = String? Function(String?);
class CustomWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController text;
  final Validator? validator;
  CustomWidget({super.key, required this.text, this.validator, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      controller: text,
      validator: validator,
    );
  }
}
