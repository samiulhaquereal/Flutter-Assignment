import 'package:flutter/material.dart';

Color parseColor(String colorCode) {
  if (colorCode.startsWith('#')) {
    colorCode = colorCode.substring(1);
  }
  colorCode = 'FF' + colorCode;

  int colorValue = int.parse(colorCode, radix: 16);

  return Color(colorValue);
}