import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/styles.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  const CustomButtonWidget({super.key, required this.onPressed, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: getSemiBoldStyle(
          fontSize: fontSize,
          color: ColorsManager.greenColor,
        ),
      ),
    );
  }
}
