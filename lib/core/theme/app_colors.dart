import 'package:flutter/material.dart';

/// Palet warna utama aplikasi SIMRS AI Mobile (Patient).
/// Dominan biru untuk kesan medis, bersih, dan terpercaya.
class AppColors {
  AppColors._();

  // Primary blue palette
  static const Color primary = Color(0xFF1565C0); // Blue 800
  static const Color primaryDark = Color(0xFF0D47A1); // Blue 900
  static const Color primaryLight = Color(0xFF42A5F5); // Blue 400
  static const Color primarySoft = Color(0xFFE3F2FD); // Blue 50

  // Secondary / accent
  static const Color accent = Color(0xFF00ACC1); // Cyan 600
  static const Color accentSoft = Color(0xFFE0F7FA);

  // Status colors
  static const Color success = Color(0xFF2E7D32);
  static const Color successSoft = Color(0xFFE8F5E9);
  static const Color warning = Color(0xFFF9A825);
  static const Color warningSoft = Color(0xFFFFF8E1);
  static const Color danger = Color(0xFFD32F2F);
  static const Color dangerSoft = Color(0xFFFFEBEE);
  static const Color info = Color(0xFF0288D1);
  static const Color infoSoft = Color(0xFFE1F5FE);

  // Neutrals
  static const Color background = Color(0xFFF5F8FC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF0F3F8);
  static const Color border = Color(0xFFE0E6ED);

  static const Color textPrimary = Color(0xFF1A2233);
  static const Color textSecondary = Color(0xFF5A6472);
  static const Color textHint = Color(0xFF9AA5B1);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryDark, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
