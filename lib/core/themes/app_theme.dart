// lib/core/themes/app_theme.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_fonts.dart';

class AppColors {
  static bool isDark = true;

  static Color get background =>
      isDark ? const Color(0xFF0D0D1A) : const Color(0xFFF4F6FB);
  static Color get surfaceDark =>
      isDark ? const Color(0xFF1A1A2E) : const Color(0xFFFFFFFF);
  static Color get surfaceMid =>
      isDark ? const Color(0xFF23233B) : const Color(0xFFF0F2F8);
  static Color get surfaceLight =>
      isDark ? const Color(0xFF2B2B47) : const Color(0xFFE6EAF3);
  static Color get cardBg => surfaceDark;

  static Color get primary => const Color(0xFF7F77DD);
  static Color get primaryLight => const Color(0xFF9A94E8);
  static Color get primaryDark => const Color(0xFF675FD0);

  static Color get secondary => const Color(0xFFEF9F27);
  static Color get secondaryLight => const Color(0xFFF3B35B);
  static Color get secondaryDark => const Color(0xFFD48611);

  static Color get tertiary => const Color(0xFF1D9E75);
  static Color get tertiaryLight => const Color(0xFF4FC39D);
  static Color get tertiaryDark => const Color(0xFF178363);

  static Color get success => const Color(0xFF1D9E75);
  static Color get warning => const Color(0xFFEF9F27);
  static Color get error => const Color(0xFFE35D5D);
  static Color get info => const Color(0xFF7F77DD);

  static Color get textPrimary =>
      isDark ? Colors.white : const Color(0xFF0F172A);
  static Color get textSecondary =>
      isDark ? Colors.white.withOpacity(0.6) : const Color(0xFF475569);
  static Color get textMuted =>
      isDark ? Colors.white.withOpacity(0.6) : const Color(0xFF64748B);

  static LinearGradient get primaryGradient => LinearGradient(
        colors: [primary, primary],
      );
  static LinearGradient get sleepGradient => LinearGradient(
        colors: [background, background],
      );
  static LinearGradient get cyanGradient => LinearGradient(
        colors: [primary, primary],
      );
  static LinearGradient get scoreExcellent => LinearGradient(
        colors: [tertiary, tertiary],
      );
  static LinearGradient get scoreGood => LinearGradient(
        colors: [tertiary, tertiary],
      );
  static LinearGradient get scoreFair => LinearGradient(
        colors: [warning, warning],
      );
  static LinearGradient get scorePoor => LinearGradient(
        colors: [error, error],
      );

  // Keep legacy names for backward compatibility
  static Color get indigo => primary;
  static Color get indigoLight => primaryLight;
  static Color get cyan => secondary;
  static Color get cyanDim => secondaryDark;
  static Color get purple => tertiary;
  static Color get purpleLight => tertiaryLight;
  static Color get mint => success;
  static Color get amber => warning;
  static Color get rose => error;
}

class AppTheme {
  static ThemeData get light {
    AppColors.isDark = false;
    return _build(Brightness.light);
  }

  static ThemeData get dark {
    AppColors.isDark = true;
    return _build(Brightness.dark);
  }

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: AppColors.background,
      splashFactory: InkRipple.splashFactory,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: brightness,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.textPrimary,
        error: AppColors.error,
        onError: Colors.white,
      ).copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiary,
        onSecondary: Colors.white,
      ),
      textTheme: TextTheme(
        displayLarge: AppFonts.displayLarge(color: AppColors.textPrimary),
        displayMedium: AppFonts.displayMedium(color: AppColors.textPrimary),
        displaySmall: AppFonts.displaySmall(color: AppColors.textPrimary),
        headlineLarge: AppFonts.headlineLarge(color: AppColors.textPrimary),
        headlineMedium: AppFonts.headlineMedium(color: AppColors.textPrimary),
        headlineSmall: AppFonts.headlineSmall(color: AppColors.textPrimary),
        titleLarge: AppFonts.titleLarge(color: AppColors.textPrimary),
        titleMedium: AppFonts.titleMedium(color: AppColors.textPrimary),
        titleSmall: AppFonts.titleSmall(color: AppColors.textPrimary),
        bodyLarge: AppFonts.bodyLarge(color: AppColors.textPrimary),
        bodyMedium: AppFonts.bodyMedium(color: AppColors.textPrimary),
        bodySmall: AppFonts.bodySmall(color: AppColors.textPrimary),
        labelLarge: AppFonts.labelLarge(color: AppColors.textPrimary),
        labelMedium: AppFonts.labelMedium(color: AppColors.textMuted),
        labelSmall: AppFonts.labelSmall(color: AppColors.textMuted),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        systemOverlayStyle:
            isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        titleTextStyle: AppFonts.headlineSmall(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBg,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.surfaceLight,
        thickness: 1,
        space: 0,
      ),
      iconTheme: IconThemeData(color: AppColors.textSecondary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.surfaceLight,
          disabledForegroundColor: AppColors.textMuted,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: AppFonts.labelLarge(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surfaceDark,
        indicatorColor: AppColors.primary.withOpacity(0.14),
        elevation: 0,
        labelTextStyle: WidgetStatePropertyAll(
          AppFonts.labelSmall(color: AppColors.textMuted),
        ),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? AppColors.primary : AppColors.textMuted,
            size: 24,
          );
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.surfaceLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        hintStyle: AppFonts.bodyMedium(color: AppColors.textMuted),
        labelStyle: AppFonts.bodyMedium(color: AppColors.textSecondary),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceLight,
        selectedColor: AppColors.primary,
        labelStyle: AppFonts.labelMedium(color: AppColors.textPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceDark,
        contentTextStyle: AppFonts.bodyMedium(color: AppColors.textPrimary),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
