import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/styles.dart';

class RichTextWidget extends StatelessWidget {
  final double fontSize;
  const RichTextWidget({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Sips',
            style: getSemiBoldStyle(
              fontSize: fontSize,
              color: ColorsManager.blackColor,
            ),
          ),
          TextSpan(
            text: ' Cafe',
            style: getBoldStyle(
              fontSize: fontSize,
              color: ColorsManager.greenColor,
            ),
          ),
        ],
      ),
    );
  }
}
