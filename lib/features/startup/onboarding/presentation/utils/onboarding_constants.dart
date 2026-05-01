// lib/features/startup/onboarding/presentation/utils/onboarding_constants.dart

import 'package:flutter/material.dart';

/// GitHub URL for open-source screen (inline link and settings).
const String kOnboardingGithubUrl = 'https://github.com/seenware/savelon-app';

const List<OnboardingStepData> kOnboardingSteps = [
  OnboardingStepData(
    imageAsset: 'assets/onboarding/open-source.png',
    title: 'Open source',
    descriptionSimple: null,
  ),
  OnboardingStepData(
    imageAsset: 'assets/onboarding/private.png',
    title: 'Private',
    descriptionSimple: 'Even we cannot see your contacts',
  ),
  OnboardingStepData(
    imageAsset: 'assets/onboarding/other-apps.png',
    title: 'Other apps cannot look inside',
    descriptionSimple: null,
  ),
  OnboardingStepData(
    imageAsset: 'assets/onboarding/offline.png',
    title: 'Offline',
    descriptionSimple:
        'Keeps you away from the cloud, data brokers, and surveillance systems',
  ),
];

@immutable
class OnboardingStepData {
  const OnboardingStepData({
    required this.imageAsset,
    required this.title,
    this.descriptionSimple,
  });

  final String imageAsset;
  final String title;
  /// When null, build custom description (e.g. open-source with GitHub link).
  final String? descriptionSimple;
}
