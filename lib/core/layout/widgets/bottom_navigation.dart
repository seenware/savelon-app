// lib/core/layout/widgets/bottom_navigation.dart

import 'dart:math' as math;

import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

/// Content height for icons + labels; bottom safe inset is added separately.
const double _kBarHeight = 60;

const double _kIconLabelGap = 6;

const Duration _kNavColorTransitionDuration = Duration(milliseconds: 200);

const double _kIconSize = 24;

/// Slot size fits a slightly scaled-up selected icon without shifting layout.
const double _kIconSlotSize = 28;

/// Subtle emphasis when a tab is selected.
const double _kSelectedIconScale = 1.07;

/// Duplicates outline→filled glyphs already read slightly larger when selected.
const double _kDuplicatesSelectedIconScale = 1.02;

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final int? contactsCount;
  final int? duplicatesCount;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.contactsCount,
    this.duplicatesCount,
  });

  /// Trims excess bottom inset for the bar's [SafeArea] while staying at or
  /// above a practical minimum for home-indicator devices.
  static double compactBottomInset(MediaQueryData mediaQuery) {
    final viewBottom = mediaQuery.viewPadding.bottom;
    final padBottom = mediaQuery.padding.bottom;
    if (viewBottom <= 0) return padBottom;
    final base = padBottom > viewBottom ? viewBottom : padBottom;
    return math.max(4, base - 8);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;
    final mediaQuery = MediaQuery.of(context);
    final transitionDuration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : _kNavColorTransitionDuration;
    final backgroundColor =
        theme.navigationBarTheme.backgroundColor ??
        colorScheme.surfaceContainer;

    return MediaQuery(
      data: mediaQuery.copyWith(
        padding: mediaQuery.padding.copyWith(
          bottom: compactBottomInset(mediaQuery),
        ),
      ),
      child: Material(
        color: backgroundColor,
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: _kBarHeight,
            child: Row(
              children: [
                _BottomNavItem(
                  index: 0,
                  selectedIndex: selectedIndex,
                  label: l10n.navContacts,
                  duration: transitionDuration,
                  icon: Icons.person_outline_rounded,
                  selectedIcon: Icons.person_rounded,
                  badgeCount: contactsCount,
                  onTap: () => onDestinationSelected(0),
                ),
                _BottomNavItem(
                  index: 1,
                  selectedIndex: selectedIndex,
                  label: l10n.navDuplicates,
                  duration: transitionDuration,
                  icon: Icons.people_outline_rounded,
                  selectedIcon: Icons.people_rounded,
                  selectedIconScale: _kDuplicatesSelectedIconScale,
                  badgeCount: duplicatesCount,
                  onTap: () => onDestinationSelected(1),
                ),
                _BottomNavItem(
                  index: 2,
                  selectedIndex: selectedIndex,
                  label: l10n.navSupport,
                  duration: transitionDuration,
                  icon: Icons.favorite_outline_rounded,
                  selectedIcon: Icons.favorite_rounded,
                  onTap: () => onDestinationSelected(2),
                ),
                _BottomNavItem(
                  index: 3,
                  selectedIndex: selectedIndex,
                  label: l10n.navSettings,
                  duration: transitionDuration,
                  icon: Icons.settings_outlined,
                  selectedIcon: Icons.settings_rounded,
                  onTap: () => onDestinationSelected(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.index,
    required this.selectedIndex,
    required this.label,
    required this.duration,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
    this.selectedIconScale = _kSelectedIconScale,
    this.badgeCount,
  });

  final int index;
  final int selectedIndex;
  final String label;
  final Duration duration;
  final IconData icon;
  final IconData selectedIcon;
  final double selectedIconScale;
  final VoidCallback onTap;
  final int? badgeCount;

  bool get _isSelected => index == selectedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedColor = colorScheme.onSurfaceVariant;
    final unselectedColor = colorScheme.outline;
    final targetColor = _isSelected ? selectedColor : unselectedColor;
    final labelStyle = theme.textTheme.labelMedium?.copyWith(
      fontSize: 11,
      height: 1.1,
      letterSpacing: 0.1,
    );

    Widget iconWidget = AnimatedTheme(
      duration: duration,
      curve: Curves.easeInOut,
      data: theme.copyWith(
        iconTheme: IconThemeData(size: _kIconSize, color: targetColor),
      ),
      child: Icon(_isSelected ? selectedIcon : icon),
    );

    iconWidget = AnimatedScale(
      scale: _isSelected ? selectedIconScale : 1,
      duration: duration,
      curve: Curves.easeInOut,
      alignment: Alignment.center,
      child: iconWidget,
    );

    iconWidget = SizedBox(
      width: _kIconSlotSize,
      height: _kIconSlotSize,
      child: Center(child: iconWidget),
    );

    final count = badgeCount;
    if (count != null && count > 0) {
      iconWidget = Badge(
        backgroundColor: colorScheme.tertiaryContainer,
        textColor: colorScheme.onTertiaryContainer,
        alignment: Alignment.topRight,
        offset: const Offset(8, -8),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        label: Text(_badgeLabel(count)),
        child: iconWidget,
      );
    }

    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconWidget,
              SizedBox(height: _kIconLabelGap),
              AnimatedDefaultTextStyle(
                duration: duration,
                curve: Curves.easeInOut,
                style: labelStyle!.copyWith(color: targetColor),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _badgeLabel(int count) => count >= 1000 ? '∞' : '$count';
}
