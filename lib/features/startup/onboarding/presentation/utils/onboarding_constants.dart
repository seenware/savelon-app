// lib/features/startup/onboarding/presentation/utils/onboarding_constants.dart

import 'package:flutter/material.dart';

class CarouselsData {
  static const List<List<ScreenData>> carousels = [_carousel];
}

const _carousel = [
  ScreenData(
    iconData: Icons.question_mark_rounded,
    themeSeedColor: Colors.red,
  ),
  ScreenData(
    iconData: Icons.warning_rounded,
    themeSeedColor: Colors.red,
  ),
  ScreenData(
    iconData: Icons.folder_special_rounded,
    themeSeedColor: Colors.green,
  ),
  ScreenData(
    iconData: Icons.lock_rounded,
    themeSeedColor: Colors.green,
  ),
];

class ScreenData {
  final IconData iconData;
  final Color themeSeedColor;

  const ScreenData({
    required this.iconData,
    required this.themeSeedColor,
  });
}
