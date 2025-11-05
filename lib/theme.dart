import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF6B6B); // coral red buttons
  static const Color background = Colors.white;
  static const Color card = Color(0xFFE0E0E0); // light gray placeholders
  static const Color circle = Color(0xFFBDE4FF); // baby blue circles
  static const Color textDark = Color(0xFF1F2937);
}

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.primary,
      secondary: AppColors.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.card,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: const Size(double.infinity, 52),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
