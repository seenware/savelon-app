// lib/core/layout/widgets/fading_branch_container.dart

import 'package:flutter/material.dart';

/// Cross-fades between [StatefulShellRoute] branch navigators on tab change.
///
/// Keeps branch state alive (stacked like [IndexedStack]) but fades opacity
/// instead of switching instantly.
class FadingBranchContainer extends StatelessWidget {
  const FadingBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
    this.duration = const Duration(milliseconds: 150),
  });

  final int currentIndex;
  final List<Widget> children;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final effectiveDuration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : duration;

    // Keep a stable child order so branch elements update in place (didUpdateWidget)
    // instead of being recreated when tabs change.
    return Stack(
      fit: StackFit.expand,
      children: [
        for (var index = 0; index < children.length; index++)
          _BranchFade(
            key: ValueKey<int>(index),
            isActive: index == currentIndex,
            duration: effectiveDuration,
            child: children[index],
          ),
      ],
    );
  }
}

class _BranchFade extends StatelessWidget {
  const _BranchFade({
    super.key,
    required this.isActive,
    required this.duration,
    required this.child,
  });

  final bool isActive;
  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: !isActive,
        child: TickerMode(
          enabled: true,
          child: AnimatedOpacity(
            opacity: isActive ? 1 : 0,
            duration: duration,
            curve: Curves.easeInOut,
            child: child,
          ),
        ),
      ),
    );
  }
}
