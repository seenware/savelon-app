// lib/features/startup/onboarding/presentation/widgets/page_content/onboarding_headline.dart

import 'package:flutter/material.dart';

class OnboardingHeadline extends StatelessWidget {
  final String headline;
  static const double fontSize = 32.0;
  static const double height = 1.2;

  const OnboardingHeadline({super.key, required this.headline});

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
        color: Theme.of(context).colorScheme.onSurface,
        height: height,
      ),
      textAlign: TextAlign.center,
    );
  }
}
