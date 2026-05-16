// lib/core/layout/widgets/bottom_navigation.dart

import 'dart:math' as math;

import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

/// Content height for icons + labels; [NavigationBar] adds bottom safe inset.
const double _kBarHeight = 64;

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final int? contactsCount;
  final int? organizeCount;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.contactsCount,
    this.organizeCount,
  });

  /// Trims excess bottom inset for [NavigationBar]'s internal [SafeArea] while
  /// staying at or above a practical minimum for home-indicator devices.
  static double compactBottomInset(MediaQueryData mediaQuery) {
    final viewBottom = mediaQuery.viewPadding.bottom;
    final padBottom = mediaQuery.padding.bottom;
    if (viewBottom <= 0) return padBottom;
    final base = padBottom > viewBottom ? viewBottom : padBottom;
    return math.max(6, base - 8);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;
    final mediaQuery = MediaQuery.of(context);

    final selectedColor = colorScheme.onSurfaceVariant;
    final unselectedColor = colorScheme.outline;

    final labelTextStyle = WidgetStateProperty.resolveWith<TextStyle?>((
      states,
    ) {
      final selected = states.contains(WidgetState.selected);
      return theme.textTheme.labelMedium?.copyWith(
        fontSize: 11,
        height: 1.1,
        letterSpacing: 0.1,
        color: selected ? selectedColor : unselectedColor,
      );
    });

    final iconTheme = WidgetStateProperty.resolveWith<IconThemeData?>((states) {
      final selected = states.contains(WidgetState.selected);
      return IconThemeData(
        size: 24,
        color: selected ? selectedColor : unselectedColor,
      );
    });

    return MediaQuery(
      data: mediaQuery.copyWith(
        padding: mediaQuery.padding.copyWith(
          bottom: compactBottomInset(mediaQuery),
        ),
      ),
      child: Theme(
        data: theme.copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          navigationBarTheme: NavigationBarThemeData(
            height: _kBarHeight,
            indicatorColor: Colors.transparent,
            iconTheme: iconTheme,
            labelTextStyle: labelTextStyle,
            labelPadding: EdgeInsets.zero,
          ),
        ),
        child: NavigationBar(
          height: _kBarHeight,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.zero,
          labelTextStyle: labelTextStyle,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.transparent;
            }
            return null;
          }),
          destinations: [
            NavigationDestination(
              icon: _contactsIcon(context, isSelected: false),
              selectedIcon: _contactsIcon(context, isSelected: true),
              label: l10n.navContacts,
              tooltip: '',
            ),
            NavigationDestination(
              icon: _organizeIcon(context, isSelected: false),
              selectedIcon: _organizeIcon(context, isSelected: true),
              label: l10n.navOrganize,
              tooltip: '',
            ),
            NavigationDestination(
              icon: const Icon(Icons.favorite_outline_rounded),
              selectedIcon: const Icon(Icons.favorite_rounded),
              label: l10n.navSupport,
              tooltip: '',
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings_rounded),
              label: l10n.navSettings,
              tooltip: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactsIcon(BuildContext context, {required bool isSelected}) {
    final icon = Icon(
      isSelected ? Icons.person_rounded : Icons.person_outline_rounded,
    );
    final count = contactsCount;
    if (count == null || count <= 0) return icon;
    final colorScheme = Theme.of(context).colorScheme;

    return Badge(
      backgroundColor: colorScheme.tertiaryContainer,
      textColor: colorScheme.onTertiaryContainer,
      alignment: Alignment.topRight,
      offset: const Offset(8, -8),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      label: Text(_badgeLabel(count)),
      child: icon,
    );
  }

  Widget _organizeIcon(BuildContext context, {required bool isSelected}) {
    final icon = Icon(
      isSelected
          ? Icons.auto_awesome_mosaic_rounded
          : Icons.auto_awesome_mosaic_outlined,
    );
    final count = organizeCount;
    if (count == null || count <= 0) return icon;
    final colorScheme = Theme.of(context).colorScheme;

    return Badge(
      backgroundColor: colorScheme.tertiaryContainer,
      textColor: colorScheme.onTertiaryContainer,
      alignment: Alignment.topRight,
      offset: const Offset(8, -8),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      label: Text(_badgeLabel(count)),
      child: icon,
    );
  }

  String _badgeLabel(int count) => count >= 1000 ? '∞' : '$count';
}
