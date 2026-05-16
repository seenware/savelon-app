// lib/core/layout/widgets/side_navigation_drawer.dart

import 'dart:math';

import 'package:contacts/core/layout/widgets/app_icon.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SideNavigationDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final int? contactsCount;
  final int? duplicatesCount;

  const SideNavigationDrawer({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.contactsCount,
    this.duplicatesCount,
  });

  @override
  Widget build(BuildContext context) {
    final double topPadding = max(
      context.spacing.screenPaddingV - MediaQuery.of(context).padding.top,
      0,
    );

    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        border: Border(
          right: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
        ),
      ),
      child: NavigationDrawer(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        indicatorColor: Theme.of(context).colorScheme.secondaryContainer,
        backgroundColor: Colors.transparent,
        children: [
          SizedBox(height: topPadding),
          _buildHeader(context),
          const SizedBox(height: 32),
          ..._buildNavigationDestinations(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12),
        AppIcon(size: 64),
        const SizedBox(width: 4),
        Text(
          context.l10n.appTitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }

  List<Widget> _buildNavigationDestinations(BuildContext context) {
    final count = contactsCount;
    final duplicates = duplicatesCount;
    final l10n = context.l10n;

    return [
      NavigationDrawerDestination(
        icon: _contactsIcon(context, isSelected: false, count: count),
        selectedIcon: _contactsIcon(context, isSelected: true, count: count),
        label: Text(l10n.navContacts),
      ),
      NavigationDrawerDestination(
        icon: _duplicatesIcon(context, isSelected: false, count: duplicates),
        selectedIcon: _duplicatesIcon(
          context,
          isSelected: true,
          count: duplicates,
        ),
        label: Text(l10n.navDuplicates),
      ),
      NavigationDrawerDestination(
        icon: const Icon(Icons.favorite_outline_rounded),
        selectedIcon: const Icon(Icons.favorite_rounded),
        label: Text(l10n.navSupport),
      ),
      NavigationDrawerDestination(
        icon: const Icon(Icons.settings_outlined),
        selectedIcon: const Icon(Icons.settings_rounded),
        label: Text(l10n.navSettings),
      ),
    ];
  }

  Widget _contactsIcon(
    BuildContext context, {
    required bool isSelected,
    required int? count,
  }) {
    final icon = Icon(
      isSelected ? Icons.person_rounded : Icons.person_outline_rounded,
    );
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

  Widget _duplicatesIcon(
    BuildContext context, {
    required bool isSelected,
    required int? count,
  }) {
    final icon = Icon(
      isSelected ? Icons.group_rounded : Icons.group_outlined,
    );
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
