import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Function() onTap;
  final String Function(String?)? validator;
  final Function() onChanged;
  final String hint;
  final TextStyle textStyle;
  final bool enable;

  const CustomTextFormField({
    super.key,
    required this.onTap,
    this.validator,
    required this.onChanged,
    required this.hint,
    required this.textStyle,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
