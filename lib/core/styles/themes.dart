import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.primaryColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none

      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none

      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none
      ),
    ),
  );
}
