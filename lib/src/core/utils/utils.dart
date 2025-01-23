import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/core/config/values.dart';


class Utils {
  Size getScreenSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  showSnackBar(
      {required BuildContext context,
        required String content,
        required Color color,
      required double fontSize}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          margin: const EdgeInsets.all(10),
          content: Center(child: Text(content,style: getSemiBoldStyle(fontSize: fontSize, color: ColorsManager.whiteColor),)),
        ),
      );
  }
}
