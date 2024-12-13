import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color primaryColor =
      Color(0xff4CAF50); // Calming green for health
  static const Color darkBlue = Color(0xff1976D2); // Trustworthy medium blue
  static const Color darkerBlue =
      Color(0xff1565C0); // Slightly darker blue for contrast
  static const Color darkestBlue =
      Color(0xff0D47A1); // Deep blue for strong accents

  static const Color lightBackground = Color(0xffF5F8FA); // Light grayish-blue

  static const List<Color> defaultGradient = [
    darkBlue,
    darkerBlue,
    darkestBlue,
  ];
}
