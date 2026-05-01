import 'package:contacts/features/startup/onboarding/presentation/pages/onboarding_intro_page.dart';
import 'package:go_router/go_router.dart';

GoRoute onboardingRoute(String path) => GoRoute(
      path: path,
      pageBuilder: (context, state) {
        final extra = state.extra;
        final initialIndex = switch (extra) {
          int value => value,
          Map<String, dynamic> map => (map['initialIndex'] as int?) ?? 0,
          _ => 0,
        };
        final noTransition = switch (extra) {
          Map<String, dynamic> map => (map['noTransition'] as bool?) ?? false,
          _ => false,
        };
        final child = OnboardingIntroPage(initialIndex: initialIndex);
        if (noTransition) {
          return NoTransitionPage(child: child);
        }
        return NoTransitionPage(child: child);
      },
    );
