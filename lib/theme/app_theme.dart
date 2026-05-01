import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark theme colors
  static const darkBg = Color(0xFF0A0A0F);
  static const darkSurface = Color(0xFF111118);
  static const darkSurface2 = Color(0xFF18181F);
  static const darkBorder = Color(0x12FFFFFF);
  static const darkBorder2 = Color(0x22FFFFFF);
  static const darkText = Color(0xFFF0F0F8);
  static const darkMuted = Color(0xFF888899);
  static const darkAccent = Color(0xFF00FF88);
  static const darkAccentDim = Color(0x2200FF88);

  // Light theme colors
  static const lightBg = Color(0xFFF8F9FC);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightSurface2 = Color(0xFFF0F2F7);
  static const lightBorder = Color(0x10000000);
  static const lightBorder2 = Color(0x18000000);
  static const lightText = Color(0xFF0A0A1A);
  static const lightMuted = Color(0xFF5A6480);
  static const lightAccent = Color(0xFF1A56E8);
  static const lightAccentDim = Color(0x121A56E8);

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: darkBg,
        colorScheme: const ColorScheme.dark(
          primary: darkAccent,
          surface: darkSurface,
        ),
        textTheme: GoogleFonts.syneTextTheme(
          ThemeData.dark().textTheme,
        ).apply(bodyColor: darkText, displayColor: darkText),
        fontFamily: GoogleFonts.syne().fontFamily,
      );

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: lightBg,
        colorScheme: const ColorScheme.light(
          primary: lightAccent,
          surface: lightSurface,
        ),
        textTheme: GoogleFonts.syneTextTheme(
          ThemeData.light().textTheme,
        ).apply(bodyColor: lightText, displayColor: lightText),
        fontFamily: GoogleFonts.syne().fontFamily,
      );
}

class AppColors {
  final Color bg;
  final Color surface;
  final Color surface2;
  final Color border;
  final Color border2;
  final Color text;
  final Color muted;
  final Color accent;
  final Color accentDim;

  const AppColors({
    required this.bg,
    required this.surface,
    required this.surface2,
    required this.border,
    required this.border2,
    required this.text,
    required this.muted,
    required this.accent,
    required this.accentDim,
  });

  static const dark = AppColors(
    bg: AppTheme.darkBg,
    surface: AppTheme.darkSurface,
    surface2: AppTheme.darkSurface2,
    border: AppTheme.darkBorder,
    border2: AppTheme.darkBorder2,
    text: AppTheme.darkText,
    muted: AppTheme.darkMuted,
    accent: AppTheme.darkAccent,
    accentDim: AppTheme.darkAccentDim,
  );

  static const light = AppColors(
    bg: AppTheme.lightBg,
    surface: AppTheme.lightSurface,
    surface2: AppTheme.lightSurface2,
    border: AppTheme.lightBorder,
    border2: AppTheme.lightBorder2,
    text: AppTheme.lightText,
    muted: AppTheme.lightMuted,
    accent: AppTheme.lightAccent,
    accentDim: AppTheme.lightAccentDim,
  );
}
