// lib/core/theme/app_theme.dart

import 'package:contacts/core/theme/app_breakpoints.dart';
import 'package:contacts/core/theme/app_spacings.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const _brand = Color(0xFF2e3c48);

  static ThemeData _withCommonAppBarTheme(ThemeData baseTheme) {
    final scheme = baseTheme.colorScheme;
    return baseTheme.copyWith(
      appBarTheme: baseTheme.appBarTheme.copyWith(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
      ),
    );
  }

  static final light = _withCommonAppBarTheme(
    ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
      brightness: Brightness.light,

      // Brand colors
      primary: _brand,
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 115, 128, 138),
      onSecondary: Colors.white,
      tertiary: Color.fromARGB(255, 147, 162, 176),
      onTertiary: Colors.white,

      // Base surfaces
      surface: Color(0xFFF4F5F7),
      onSurface: Color(0xFF131820),
      surfaceBright: Color(0xFFFFFFFF),
      surfaceDim: Color(0xFFE3E5E8),

      // Surface containers (for elevations)
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF8F9FA),
      surfaceContainer: Color(0xFFE4E6EA), // Was E8EAED
      surfaceContainerHigh: Color(0xFFD3D8DE), // Was DCE0E5
      surfaceContainerHighest: Color(0xFFC6CDD5), // Was D0D6DD
      // Etc.
      error: Color(0xFFB3261E),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFF9DEDC),
      onErrorContainer: Color(0xFF410E0B),
      inverseSurface: Color(0xFF1E242C),
      onInverseSurface: Color(0xFFE8ECF2),
      inversePrimary: Color(0xFFB8CBDC),
      surfaceTint: _brand,
      outline: Color(0xFF6B7A89),
      outlineVariant: Color(0xFFCBD2DA),
    ),
      extensions: const [AppSpacings.mobile],
    ),
  );

  static final dark = _withCommonAppBarTheme(
    ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _brand,
        brightness: Brightness.dark,
      ),
      extensions: const [AppSpacings.mobile],
      useMaterial3: true,
    ),
  );

  /// Get responsive spacing that automatically updates when window resizes
  static AppSpacings spacingOf(BuildContext context) {
    return AppBreakpoints.isWide(context)
        ? AppSpacings.desktop
        : AppSpacings.mobile;
  }
}

/// Extension method for convenient access
extension AppThemeExtension on BuildContext {
  AppSpacings get spacing => AppTheme.spacingOf(this);
}
