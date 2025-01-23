import 'package:flutter/material.dart';
import 'package:sips_cafe/src/core/config/fonts.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    color: color,
  );
}


TextStyle getRegularStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, Fonts.fontFamily, FontWeights.regular, color);
}


TextStyle getLightStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, Fonts.fontFamily, FontWeights.light, color);
}

TextStyle getSemiBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, Fonts.fontFamily, FontWeights.semiBold, color);
}

TextStyle getBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, Fonts.fontFamily, FontWeights.bold, color);
}



TextStyle getMediumStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, Fonts.fontFamily, FontWeights.medium, color);
}
