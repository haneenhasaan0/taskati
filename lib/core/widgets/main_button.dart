import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function()? onPressed;
  final Color bgColor;
  final Text text;
  final TextStyle textStyle;

  const MainButton({
    super.key,
    this.onPressed,
    required this.bgColor,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
