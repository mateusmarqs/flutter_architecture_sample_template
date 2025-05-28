import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFF0297dd);
  static const secondary = Color(0xFF0d7ad0);
  static const black = Color.fromARGB(255, 17, 17, 17);
  static const white = Color(0xFFF8F8F8);
  static const grey300 = Color(0xFFD6D6D6);
  static const grey500 = Color(0xFF4D4D4D);
  static const grey700 = Color(0xFF2E2E2E);
  static const success = Color(0xFF38CA33);
  static const error = Color(0xFFC23627);
  static const backgroundDark = Color.fromARGB(255, 8, 25, 27);
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    surface: AppColors.white,
    onSurface: AppColors.black,
    error: AppColors.white,
    onError: Colors.red,
  );
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.black,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    surface: AppColors.black,
    onSurface: AppColors.white,
    error: AppColors.error,
    onError: AppColors.black,
  );
}