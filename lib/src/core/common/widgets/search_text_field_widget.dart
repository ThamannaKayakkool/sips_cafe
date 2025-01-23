import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/config/colors.dart';
import 'package:sips_cafe/src/core/config/styles.dart';
import 'package:sips_cafe/src/core/config/values.dart';
import 'package:sips_cafe/src/core/utils/utils.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final double width;
  final double height;
  final double hintFontSize;
  final double textFontSize;
  const SearchTextFieldWidget({super.key, required this.width, required this.height, required this.hintFontSize, required this.textFontSize,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(context);
    return SizedBox(
      width:  width,
      height: height,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: screenSize.height * 0.02,
        cursorColor: ColorsManager.greenColor,
        style: TextStyle(
            color: ColorsManager.blackColor, fontWeight: FontWeight.w500,fontSize: textFontSize),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: screenSize.height * 0.01,
              left: screenSize.width * 0.01),
          hintText: "Search Menu",
          hintStyle: getMediumStyle(
              color: ColorsManager.blackColor.withOpacity(0.3),
              fontSize: hintFontSize),
          prefixIcon: Icon(Icons.search,color: ColorsManager.greenColor,),
          filled: true,
          fillColor: ColorsManager.whiteColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.greenColor),
              borderRadius: BorderRadius.circular(AppSize.s4)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.greenColor),
              borderRadius: BorderRadius.circular(AppSize.s4)),
        ),
      ),
    );
  }
}
