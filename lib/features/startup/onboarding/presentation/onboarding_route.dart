// lib/features/startup/onboarding/presentation/onboarding_route.dart

import 'package:contacts/features/startup/onboarding/presentation/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';

GoRoute onboardingRoute(String path) => GoRoute(
  path: path,
  pageBuilder: (context, state) => NoTransitionPage(
    child: OnboardingPage(
      onCompleteCallback: () => context.go('/startup/setup'),
    ),
  ),
);
