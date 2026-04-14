// lib/core/layout/widgets/app_icon.dart

import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double size;

  const AppIcon({super.key, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Theme.of(context).brightness == Brightness.light
          ? 'assets/logo/logo_on_light.png'
          : 'assets/logo/logo_on_dark.png',
      width: size,
      height: size,
    );
  }
}
