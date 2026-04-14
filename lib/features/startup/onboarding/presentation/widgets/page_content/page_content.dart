// lib/features/startup/onboarding/presentation/widgets/page_content/page_content.dart

import 'package:contacts/features/startup/onboarding/presentation/utils/onboarding_constants.dart';
import 'package:contacts/features/startup/onboarding/presentation/widgets/page_content/onboarding_headline.dart';
import 'package:contacts/features/startup/onboarding/presentation/widgets/page_content/onboarding_icon.dart';
import 'package:contacts/features/startup/onboarding/presentation/widgets/page_content/onboarding_subline.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  final int pageIndex;
  final ScreenData screenData;
  final VoidCallback? onIconTap;

  const PageContent({
    super.key,
    required this.pageIndex,
    required this.screenData,
    this.onIconTap,
  });

  (String, String) _copy(AppLocalizations l10n) {
    return switch (pageIndex) {
      0 => (l10n.onboardingHeadline1, l10n.onboardingSubline1),
      1 => (l10n.onboardingHeadline2, l10n.onboardingSubline2),
      2 => (l10n.onboardingHeadline3, l10n.onboardingSubline3),
      3 => (l10n.onboardingHeadline4, l10n.onboardingSubline4),
      _ => ('', ''),
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final (headline, subline) = _copy(l10n);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OnboardingIcon(
          iconData: screenData.iconData,
          iconColor: Theme.of(context).colorScheme.primary,
          onTap: onIconTap,
        ),
        const SizedBox(height: 48),
        OnboardingHeadline(headline: headline),
        const SizedBox(height: 16),
        OnboardingSubline(subline: subline),
      ],
    );
  }
}
