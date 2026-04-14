// lib/features/startup/onboarding/presentation/widgets/progress_dots.dart

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProgressDots extends StatelessWidget {
  final PageController controller;
  final int count;

  const ProgressDots({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        spacing: 12,
        activeDotColor: Theme.of(context).colorScheme.primary,
        dotColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        type: WormType.thin,
      ),
    );
  }
}
