import 'package:flutter/material.dart';

class TextStyleDefination {
  static TextStyle heading(
          {double fontSize = 21, FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
  static TextStyle body(
          {double fontSize = 14.5, FontWeight fontWeight = FontWeight.w400}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
}
