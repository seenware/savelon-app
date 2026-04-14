// lib/core/layout/widgets/bottom_navigation.dart

import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Theme(
      data: theme.copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: NavigationBar(
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
