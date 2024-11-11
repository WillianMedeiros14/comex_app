import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  useMaterial3: true,
  primaryColor: const Color(0xFF021326),
  scaffoldBackgroundColor: const Color(0xFFF9F9F9),
  fontFamily: 'Inter',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.bold, fontSize: 32),
    displayMedium: TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 28),
    bodyLarge: TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.normal, fontSize: 16),
    bodyMedium: TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 14),
    bodySmall: TextStyle(
        fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 12),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color(0xFF021326),
      backgroundColor: const Color(0xFFD39F56),
      textStyle: const TextStyle(
          fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 16),
      minimumSize: const Size(double.infinity, 50),
    ),
  ),
);
