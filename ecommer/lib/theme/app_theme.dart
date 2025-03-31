import 'package:flutter/material.dart';

class AppTheme {
  // Main colors
  static const primaryColor = Color(0xFF2C3E50);
  static const accentColor = Color(0xFF3498DB);
  static const backgroundColor = Color(0xFFF5F6FA);

  // Text colors
  static const titleColor = Color(0xFF2C3E50);
  static const bodyTextColor = Color(0xFF7F8C8D);

  // Card colors
  static const cardColor = Colors.white;
  static const cardShadowColor = Color(0x1A000000);

  static ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
