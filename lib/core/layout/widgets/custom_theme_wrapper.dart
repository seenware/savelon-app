// lib/core/layout/widgets/custom_theme_wrapper.dart

import 'package:flutter/material.dart';

class CustomThemeWrapper extends StatelessWidget {
  final Color seedColor;
  final Widget child;

  const CustomThemeWrapper({
    super.key,
    required this.seedColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      useMaterial3: true,
    );

    final darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );

    final brightness = MediaQuery.platformBrightnessOf(context);
    final customTheme = brightness == Brightness.dark ? darkTheme : lightTheme;

    return Theme(data: customTheme, child: child);
  }
}
