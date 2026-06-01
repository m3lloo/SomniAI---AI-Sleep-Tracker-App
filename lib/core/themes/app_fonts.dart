// lib/core/themes/app_fonts.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Central font management for the application
/// Provides consistent typography across all UI elements
class AppFonts {
  AppFonts._(); // Private constructor

  // Primary Font Family Names
  static const String primaryFamily = 'Outfit';
  static const String displayFamily = 'Outfit';
  static const String bodyFamily = 'Outfit';

  /// Display Text Styles - Used for large, prominent headings
  static TextStyle displayLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 57,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color,
        letterSpacing: letterSpacing ?? -0.5,
        height: height ?? 1.2,
      );

  static TextStyle displayMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 45,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color,
        letterSpacing: letterSpacing ?? 0,
        height: height ?? 1.2,
      );

  static TextStyle displaySmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 36,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing ?? 0,
        height: height ?? 1.3,
      );

  /// Headline Styles - Used for section headers
  static TextStyle headlineLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 32,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing ?? 0,
        height: height ?? 1.3,
      );

  static TextStyle headlineMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 28,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing ?? 0,
        height: height ?? 1.3,
      );

  static TextStyle headlineSmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 24,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing ?? 0,
        height: height ?? 1.4,
      );

  /// Title Styles - Used for smaller section titles
  static TextStyle titleLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 22,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing ?? 0.15,
        height: height ?? 1.4,
      );

  static TextStyle titleMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing ?? 0.15,
        height: height ?? 1.4,
      );

  static TextStyle titleSmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing ?? 0.1,
        height: height ?? 1.4,
      );

  /// Body Text Styles - Used for regular content text
  static TextStyle bodyLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing ?? 0.5,
        height: height ?? 1.5,
      );

  static TextStyle bodyMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing ?? 0.25,
        height: height ?? 1.5,
      );

  static TextStyle bodySmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 12,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing ?? 0.4,
        height: height ?? 1.5,
      );

  /// Label Styles - Used for labels, badges, chips
  static TextStyle labelLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing ?? 0.1,
        height: height ?? 1.4,
      );

  static TextStyle labelMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 12,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing ?? 0.5,
        height: height ?? 1.4,
      );

  static TextStyle labelSmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 11,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing ?? 0.5,
        height: height ?? 1.4,
      );

  /// Special Styles - For specific UI elements
  static TextStyle caption({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 12,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing ?? 0.3,
        height: height ?? 1.4,
      );

  static TextStyle overline({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.outfit(
        fontSize: 11,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing ?? 1.5,
        height: height ?? 1.4,
      );

  /// Alternative font option - Figtree for variety
  static TextStyle figtreeLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.figtree(
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing ?? 0,
        height: height ?? 1.4,
      );

  static TextStyle figtreeMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.figtree(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing ?? 0.15,
        height: height ?? 1.4,
      );

  /// Alternative font option - IBM Plex Sans for technical content
  static TextStyle plexSans({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize = 14,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.ibmPlexSans(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing ?? 0.3,
        height: height ?? 1.5,
      );
}
