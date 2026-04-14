// lib/core/theme/app_spacings.dart

import 'package:flutter/material.dart';

@immutable
class AppSpacings extends ThemeExtension<AppSpacings> {
  const AppSpacings({
    required this.screenPaddingH,
    required this.screenPaddingV,
    required this.maxScreenWidth,
    required this.listItemGap,
    required this.cardPadding,
    required this.sectionSpacing,
    required this.small,
    required this.medium,
    required this.large,
    required this.xLarge,
  });

  final double screenPaddingH;
  final double screenPaddingV;
  final double maxScreenWidth;
  final double listItemGap;
  final double cardPadding;
  final double sectionSpacing;

  // Additional spacing values
  final double small;
  final double medium;
  final double large;
  final double xLarge;

  // Mobile spacing configuration (< 700px)
  static const mobile = AppSpacings(
    screenPaddingH: 16,
    screenPaddingV: 12,
    maxScreenWidth: 600,
    listItemGap: 8,
    cardPadding: 16,
    sectionSpacing: 24,
    small: 8,
    medium: 16,
    large: 24,
    xLarge: 32,
  );

  // Desktop spacing configuration (>= 700px)
  static const desktop = AppSpacings(
    screenPaddingH: 24,
    screenPaddingV: 16,
    maxScreenWidth: 600,
    listItemGap: 12,
    cardPadding: 24,
    sectionSpacing: 32,
    small: 12,
    medium: 20,
    large: 32,
    xLarge: 40,
  );

  @override
  AppSpacings copyWith({
    double? screenPaddingH,
    double? screenPaddingV,
    double? maxScreenWidth,
    double? listItemGap,
    double? cardPadding,
    double? sectionSpacing,
    double? small,
    double? medium,
    double? large,
    double? xLarge,
  }) {
    return AppSpacings(
      screenPaddingH: screenPaddingH ?? this.screenPaddingH,
      screenPaddingV: screenPaddingV ?? this.screenPaddingV,
      maxScreenWidth: maxScreenWidth ?? this.maxScreenWidth,
      listItemGap: listItemGap ?? this.listItemGap,
      cardPadding: cardPadding ?? this.cardPadding,
      sectionSpacing: sectionSpacing ?? this.sectionSpacing,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      xLarge: xLarge ?? this.xLarge,
    );
  }

  @override
  AppSpacings lerp(ThemeExtension<AppSpacings>? other, double t) {
    if (other is! AppSpacings) return this;
    return AppSpacings(
      screenPaddingH:
          screenPaddingH + (other.screenPaddingH - screenPaddingH) * t,
      screenPaddingV:
          screenPaddingV + (other.screenPaddingV - screenPaddingV) * t,
      maxScreenWidth:
          maxScreenWidth + (other.maxScreenWidth - maxScreenWidth) * t,
      listItemGap: listItemGap + (other.listItemGap - listItemGap) * t,
      cardPadding: cardPadding + (other.cardPadding - cardPadding) * t,
      sectionSpacing:
          sectionSpacing + (other.sectionSpacing - sectionSpacing) * t,
      small: small + (other.small - small) * t,
      medium: medium + (other.medium - medium) * t,
      large: large + (other.large - large) * t,
      xLarge: xLarge + (other.xLarge - xLarge) * t,
    );
  }
}
