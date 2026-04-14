// lib/features/startup/onboarding/presentation/providers/onboarding_provider.dart

import 'package:contacts/features/startup/onboarding/presentation/utils/onboarding_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingState {
  final int currentCarouselIndex;
  final int currentScreenIndex;

  OnboardingState({this.currentCarouselIndex = 0, this.currentScreenIndex = 0});

  OnboardingState copyWith({
    int? currentCarouselIndex,
    int? currentScreenIndex,
  }) {
    return OnboardingState(
      currentCarouselIndex: currentCarouselIndex ?? this.currentCarouselIndex,
      currentScreenIndex: currentScreenIndex ?? this.currentScreenIndex,
    );
  }

  bool get isLastCarouselScreen {
    final screensCount = CarouselsData.carousels[currentCarouselIndex].length;
    return currentScreenIndex == screensCount - 1;
  }

  bool get isLastCarousel {
    return currentCarouselIndex == CarouselsData.carousels.length - 1;
  }

  ScreenData get currentScreenData {
    return CarouselsData.carousels[currentCarouselIndex][currentScreenIndex];
  }

  List<ScreenData> get currentCarousel {
    return CarouselsData.carousels[currentCarouselIndex];
  }
}

class OnboardingNotifier extends Notifier<OnboardingState> {
  late final PageController pageController;

  @override
  OnboardingState build() {
    pageController = PageController();

    ref.onDispose(() {
      pageController.dispose();
    });

    return OnboardingState();
  }

  void onPageChanged(int index) {
    state = state.copyWith(currentScreenIndex: index);
  }

  // Navigate to next page with proper page controller usage
  void nextPage(VoidCallback onCompleteCallback) {
    if (state.isLastCarousel && state.isLastCarouselScreen) {
      onCompleteCallback();
      return;
    }

    if (!state.isLastCarouselScreen) {
      final nextScreenIndex = state.currentScreenIndex + 1;
      pageController.animateToPage(
        nextScreenIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      state = state.copyWith(currentScreenIndex: nextScreenIndex);
      return;
    }

    if (state.isLastCarouselScreen && !state.isLastCarousel) {
      final nextCarouselIndex = state.currentCarouselIndex + 1;
      pageController.jumpToPage(0);
      state = state.copyWith(
        currentCarouselIndex: nextCarouselIndex,
        currentScreenIndex: 0,
      );
    }
  }

}

final onboardingProvider =
    NotifierProvider.autoDispose<OnboardingNotifier, OnboardingState>(
      () => OnboardingNotifier(),
    );
