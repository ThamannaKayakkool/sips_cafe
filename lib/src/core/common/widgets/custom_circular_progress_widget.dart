import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/config/colors.dart';

class CustomCircularProgressWidget extends StatelessWidget {
  const CustomCircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: ColorsManager.greenColor,
      ),
    );
  }
}