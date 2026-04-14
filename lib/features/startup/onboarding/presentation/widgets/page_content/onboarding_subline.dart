// lib/features/startup/onboarding/presentation/widgets/page_content/onboarding_subline.dart

import 'package:flutter/material.dart';

class OnboardingSubline extends StatelessWidget {
  final String subline;
  static const double fontSize = 16.0;
  static const double height = 1.5;

  const OnboardingSubline({super.key, required this.subline});

  @override
  Widget build(BuildContext context) {
    return Text(
      subline,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        height: height,
      ),
      textAlign: TextAlign.center,
    );
  }
}
