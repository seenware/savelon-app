// lib/features/startup/onboarding/presentation/pages/onboarding_intro_page.dart

import 'dart:math' as math;

import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/layout/widgets/primary_button.dart';
import 'package:contacts/core/purchases/purchases_service.dart';
import 'package:contacts/features/startup/onboarding/presentation/utils/onboarding_constants.dart';
import 'package:contacts/features/startup/onboarding/presentation/widgets/activate_demo_dialog.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:contacts/core/theme/app_breakpoints.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingIntroPage extends StatefulWidget {
  const OnboardingIntroPage({
    super.key,
    this.initialIndex = 0,
  });

  final int initialIndex;

  @override
  State<OnboardingIntroPage> createState() => _OnboardingIntroPageState();
}

class _OnboardingIntroPageState extends State<OnboardingIntroPage> {
  int _iconTapCount = 0;
  late final PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, kOnboardingSteps.length - 1);
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final showBack = _currentIndex > 0;
    final isLast = _currentIndex == kOnboardingSteps.length - 1;
    final base = Theme.of(context).brightness == Brightness.dark
        ? ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2AAB6B),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          )
        : ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2AAB6B),
            ),
            useMaterial3: true,
          );

    return Theme(
      data: base,
      child: AppScaffold(
        resizeToAvoidBottomInset: false,
        limitWidth: true,
        body: Column(
          children: [
            SizedBox(
              height: 44,
              child: Row(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (child, animation) {
                      final curved = CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutBack,
                        reverseCurve: Curves.easeInCubic,
                      );
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-0.3, 0),
                          end: Offset.zero,
                        ).animate(curved),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: showBack
                        ? IconButton(
                            key: const ValueKey('back'),
                            onPressed: _goPrevious,
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          )
                        : const SizedBox(key: ValueKey('noback'), width: 48),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemCount: kOnboardingSteps.length,
                itemBuilder: (context, index) {
                  final data = kOnboardingSteps[index];
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final media = MediaQuery.of(context);
                      final isLandscape = media.orientation == Orientation.landscape;
                      final isWide = AppBreakpoints.isWide(context);
                      final targetByHeight = isWide && isLandscape
                          ? (constraints.maxHeight * 0.42).clamp(170.0, 250.0)
                          : (constraints.maxHeight * 0.54).clamp(210.0, 420.0);
                      // Keep illustration strictly square on all screens by
                      // fitting to both width and height constraints.
                      final maxByWidth = constraints.maxWidth - 48; // 24 + 24 horizontal padding
                      final illustrationSize = math.max(
                        120.0,
                        math.min(targetByHeight, maxByWidth),
                      );
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: _handleIllustrationTap,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Container(
                                    width: illustrationSize,
                                    height: illustrationSize,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        data.imageAsset,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                data.title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              _DescriptionWidget(stepIndex: index),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            PrimaryButton(
              text: l10n.onboardingNext,
              icon: Icons.arrow_forward_rounded,
              enableHapticFeedback: true,
              onPressed: () {
                if (isLast) {
                  context.go(
                    '/startup/setup/create_vault',
                    extra: <String, dynamic>{'freshStart': true},
                  );
                } else {
                  _goNext();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleIllustrationTap() async {
    if (!PurchasesService.accessCodes.isNotEmpty) return;
    _iconTapCount++;
    if (_iconTapCount < 5) return;
    _iconTapCount = 0;

    if (!mounted) return;
    final accessUntil = await ActivateDemoDialog.show(context);
    if (!mounted || accessUntil == null) return;

    final local = accessUntil.toLocal();
    final localizations = MaterialLocalizations.of(context);
    final dateText = localizations.formatFullDate(local);
    final timeText = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(local),
      alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
    );

    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.demoAccessGranted('$dateText $timeText')),
      ),
    );
  }

  Future<void> _goNext() async {
    if (_currentIndex >= kOnboardingSteps.length - 1) return;
    await _controller.animateToPage(
      _currentIndex + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _goPrevious() async {
    if (_currentIndex <= 0) return;
    await _controller.animateToPage(
      _currentIndex - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({required this.stepIndex});

  final int stepIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mutedStyle = theme.textTheme.titleMedium?.copyWith(
      color: theme.colorScheme.onSurface.withValues(alpha: 0.72),
      fontWeight: FontWeight.w400,
      height: 1.35,
    );

    if (stepIndex == 0) {
      return _OpenSourceDescription(style: mutedStyle);
    }

    final text = kOnboardingSteps[stepIndex].descriptionSimple;
    if (text == null || text.isEmpty) {
      return const SizedBox.shrink();
    }

    return Text(
      text,
      textAlign: TextAlign.center,
      style: mutedStyle,
    );
  }
}

class _OpenSourceDescription extends StatefulWidget {
  const _OpenSourceDescription({required this.style});

  final TextStyle? style;

  @override
  State<_OpenSourceDescription> createState() => _OpenSourceDescriptionState();
}

class _OpenSourceDescriptionState extends State<_OpenSourceDescription> {
  late final TapGestureRecognizer _githubTap;

  @override
  void initState() {
    super.initState();
    _githubTap = TapGestureRecognizer()
      ..onTap = () async {
        final uri = Uri.parse(kOnboardingGithubUrl);
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      };
  }

  @override
  void dispose() {
    _githubTap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final base = widget.style ?? theme.textTheme.titleMedium;
    final linkStyle = base?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      decorationColor: theme.colorScheme.primary,
    );

    return Text.rich(
      TextSpan(
        style: widget.style,
        children: [
          const TextSpan(text: 'Anyone can check our code on '),
          TextSpan(
            text: 'GitHub',
            style: linkStyle,
            recognizer: _githubTap,
          ),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
