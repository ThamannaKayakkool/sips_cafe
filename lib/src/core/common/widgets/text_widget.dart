import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/styles.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  const TextWidget({super.key, required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
      title,
        style: getSemiBoldStyle(
          fontSize: fontSize,
          color: ColorsManager.blackColor,
        ),
      ),
    );
  }
}
