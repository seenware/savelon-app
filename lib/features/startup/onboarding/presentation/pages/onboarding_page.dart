// lib/features/startup/onboarding/presentation/pages/onboarding_page.dart

import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/layout/widgets/primary_button.dart';
import 'package:contacts/core/purchases/purchases_service.dart';
import 'package:contacts/features/startup/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/features/startup/onboarding/presentation/widgets/activate_demo_dialog.dart';
import 'package:contacts/features/startup/onboarding/presentation/widgets/page_content/page_content.dart';
import 'package:contacts/features/startup/onboarding/presentation/widgets/progress_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  final VoidCallback onCompleteCallback;

  const OnboardingPage({super.key, required this.onCompleteCallback});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  int _iconTapCount = 0;

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.watch(onboardingProvider.notifier);

    final lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: onboardingState.currentScreenData.themeSeedColor,
      ),
      useMaterial3: true,
    );

    final darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: onboardingState.currentScreenData.themeSeedColor,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );

    final brightness = MediaQuery.platformBrightnessOf(context);
    final customTheme = brightness == Brightness.dark ? darkTheme : lightTheme;
    final hasInjectedDemoCode = PurchasesService.accessCodes.isNotEmpty;

    Future<void> handleIconTap() async {
      if (!hasInjectedDemoCode) return;
      _iconTapCount++;
      if (_iconTapCount < 5) return;
      _iconTapCount = 0;

      final accessUntil = await ActivateDemoDialog.show(context);
      if (!context.mounted || accessUntil == null) return;

      final local = accessUntil.toLocal();
      final localizations = MaterialLocalizations.of(context);
      final dateText = localizations.formatFullDate(local);
      final timeText = localizations.formatTimeOfDay(
        TimeOfDay.fromDateTime(local),
        alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.l10n.demoAccessGranted('$dateText $timeText'),
          ),
        ),
      );
    }

    return Theme(
      data: customTheme,
      child: AppScaffold(
        resizeToAvoidBottomInset: false,
        limitWidth: true,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: onboardingNotifier.pageController,
                itemCount: onboardingState.currentCarousel.length,
                onPageChanged: (index) {
                  onboardingNotifier.onPageChanged(index);
                },
                itemBuilder: (context, index) {
                  final carusel = onboardingState.currentCarousel;
                  final screenData = carusel[index];
                  return PageContent(
                    pageIndex: index,
                    screenData: screenData,
                    onIconTap: handleIconTap,
                  );
                },
              ),
            ),
            ProgressDots(
              controller: onboardingNotifier.pageController,
              count: onboardingState.currentCarousel.length,
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: onboardingState.isLastCarousel &&
                      onboardingState.isLastCarouselScreen
                  ? context.l10n.onboardingGetStarted
                  : context.l10n.onboardingNext,
              icon: Icons.arrow_forward,
              enableHapticFeedback: true,
              onPressed: () {
                onboardingNotifier.nextPage(widget.onCompleteCallback);
              },
            ),
          ],
        ),
      ),
    );
  }
}
