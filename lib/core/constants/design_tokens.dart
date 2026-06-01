// lib/core/constants/app_constants.dart
import 'package:flutter/material.dart';
import '../themes/app_fonts.dart';

/// App-wide constants for design consistency
class AppConstants {
  AppConstants._(); // Private constructor to prevent instantiation

  // Sensor & Tracking Constants
  static const double sensorMovementThreshold = 0.8;
  static const double interruptionThreshold = 2.5;
  static const int oneDayInMinutes = 1440;
  static const int sleepSessionCacheDurationMinutes = 60;

  // Sleep Score Thresholds
  static const int excellentSleepScore = 90;
  static const int goodSleepScore = 70;
  static const int fairSleepScore = 50;

  // Sleep Stage Ratios
  static const double deepSleepRatio = 0.20; // 20%
  static const double remSleepRatio = 0.20; // 20%
  static const double lightSleepRatio = 0.60; // 60%

  // Default User Goals
  static const int defaultSleepGoalHours = 8;
  static const int defaultNapDurationMinutes = 30;

  // API Configuration
  static const Duration apiTimeout = Duration(seconds: 30);
  static const int apiRetryCount = 3;
  static const Duration apiRetryDelay = Duration(seconds: 2);

  // Database Configuration
  static const String isarDbName = 'somniai';
  static const int dbSchemaVersion = 1;

  // Notification Configuration
  static const int sleepReminderHour = 22;
  static const int sleepReminderMinute = 30;
  static const int wakeupReminderHour = 7;
  static const int wakeupReminderMinute = 0;

  // UI Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 400);
  static const Duration animationSlow = Duration(milliseconds: 600);
  static const Duration animationSlower = Duration(milliseconds: 800);

  // Spacing System (Follows Material Design 3)
  static const double spacing0 = 0;
  static const double spacing2 = 2;
  static const double spacing4 = 4;
  static const double spacing8 = 8;
  static const double spacing10 = 10;
  static const double spacing12 = 12;
  static const double spacing16 = 16;
  static const double spacing20 = 20;
  static const double spacing24 = 24;
  static const double spacing28 = 28;
  static const double spacing32 = 32;
  static const double spacing36 = 36;
  static const double spacing40 = 40;
}

/// Border Radius Constants
class AppBorderRadius {
  AppBorderRadius._();

  static const double extraSmall = 4;
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double extraLarge = 20;
  static const double card = 24; // For main content cards
  static const double circular = 999; // For circular buttons

  // Common border radius values
  static final BorderRadius extraSmallRadius =
      BorderRadius.circular(extraSmall);
  static final BorderRadius smallRadius = BorderRadius.circular(small);
  static final BorderRadius mediumRadius = BorderRadius.circular(medium);
  static final BorderRadius largeRadius = BorderRadius.circular(large);
  static final BorderRadius extraLargeRadius =
      BorderRadius.circular(extraLarge);
  static final BorderRadius cardRadius = BorderRadius.circular(card);
  static final BorderRadius circularRadius = BorderRadius.circular(circular);
}

/// Typography Scale
class AppTypography {
  AppTypography._();

  // Display styles - Large, prominent text
  static const double displayLargeSize = 57;
  static const double displayMediumSize = 45;
  static const double displaySmallSize = 36;

  // Headline styles
  static const double headlineLargeSize = 32;
  static const double headlineMediumSize = 28;
  static const double headlineSmallSize = 24;

  // Title styles
  static const double titleLargeSize = 22;
  static const double titleMediumSize = 18;
  static const double titleSmallSize = 14;

  // Body styles
  static const double bodyLargeSize = 16;
  static const double bodyMediumSize = 14;
  static const double bodySmallSize = 12;

  // Label styles
  static const double labelLargeSize = 14;
  static const double labelMediumSize = 12;
  static const double labelSmallSize = 11;
}

/// Icon Size Constants
class AppIconSize {
  AppIconSize._();

  static const double extraSmall = 16;
  static const double small = 20;
  static const double medium = 24;
  static const double large = 32;
  static const double extraLarge = 48;
}

/// Elevation/Shadow Constants
class AppElevation {
  AppElevation._();

  static const double none = 0;
  static const double small = 1;
  static const double medium = 4;
  static const double large = 8;
  static const double extraLarge = 12;
}

/// Default Padding/Margin Classes
class AppPadding {
  AppPadding._();

  // Horizontal padding
  static const EdgeInsets horizontalSmall =
      EdgeInsets.symmetric(horizontal: AppConstants.spacing8);
  static const EdgeInsets horizontalMedium =
      EdgeInsets.symmetric(horizontal: AppConstants.spacing16);
  static const EdgeInsets horizontalLarge =
      EdgeInsets.symmetric(horizontal: AppConstants.spacing24);

  // Vertical padding
  static const EdgeInsets verticalSmall =
      EdgeInsets.symmetric(vertical: AppConstants.spacing8);
  static const EdgeInsets verticalMedium =
      EdgeInsets.symmetric(vertical: AppConstants.spacing12);
  static const EdgeInsets verticalLarge =
      EdgeInsets.symmetric(vertical: AppConstants.spacing16);

  // All padding
  static const EdgeInsets allSmall = EdgeInsets.all(AppConstants.spacing8);
  static const EdgeInsets allMedium = EdgeInsets.all(AppConstants.spacing16);
  static const EdgeInsets allLarge = EdgeInsets.all(AppConstants.spacing24);

  // Common combinations
  static const EdgeInsets screenPadding =
      EdgeInsets.symmetric(horizontal: AppConstants.spacing20);
  static const EdgeInsets cardPadding = EdgeInsets.all(AppConstants.spacing16);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
      horizontal: AppConstants.spacing24, vertical: AppConstants.spacing12);
}

/// Constraints for responsive design
class AppConstraints {
  AppConstraints._();

  static const double maxContentWidth = 600;
  static const double maxContentWidthTablet = 900;
  static const double minTouchTargetSize = 48; // Material spec minimum
}

/// Typography Style Utilities - Easy access to pre-configured text styles
class TextStyles {
  TextStyles._();

  // Display Styles
  static TextStyle displayLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.displayLarge(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle displayMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.displayMedium(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle displaySmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.displaySmall(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  // Headline Styles
  static TextStyle headlineLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.headlineLarge(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle headlineMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.headlineMedium(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle headlineSmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.headlineSmall(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  // Title Styles
  static TextStyle titleLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.titleLarge(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle titleMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.titleMedium(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle titleSmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.titleSmall(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  // Body Styles
  static TextStyle bodyLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.bodyLarge(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle bodyMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.bodyMedium(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle bodySmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.bodySmall(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  // Label Styles
  static TextStyle labelLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.labelLarge(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle labelMedium({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.labelMedium(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle labelSmall({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.labelSmall(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  // Special Styles
  static TextStyle caption({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.caption(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle overline({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.overline(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );

  // Alternative Fonts
  static TextStyle figtreeLarge({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      AppFonts.figtreeLarge(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      );
  static TextStyle figtreeMedium({Color? color}) =>
      AppFonts.figtreeMedium(color: color);
  static TextStyle plexSans({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      AppFonts.plexSans(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
}
