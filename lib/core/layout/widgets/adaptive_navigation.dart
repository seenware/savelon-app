// lib/core/layout/widgets/adaptive_navigation.dart

import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/theme/app_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bottom_navigation.dart';
import 'side_navigation_drawer.dart';

class AdaptiveNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final int? contactsCount;
  final int? duplicatesCount;

  const AdaptiveNavigation({
    super.key,
    required this.navigationShell,
    this.contactsCount,
    this.duplicatesCount,
  });

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = AppBreakpoints.isWide(context);
    return isWideScreen ? _buildWideLayout() : _buildCompactLayout(context);
  }

  Widget _buildWideLayout() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          SideNavigationDrawer(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _onDestinationSelected,
            contactsCount: contactsCount,
            duplicatesCount: duplicatesCount,
          ),
          Expanded(
            child: AppScaffold(body: navigationShell, minimumScreenPaddingH: 0),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactLayout(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      body: navigationShell,
      minimumScreenPaddingV: 0,
      minimumScreenPaddingH: 0,
      bottomNavigationBar: BottomNavigation(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onDestinationSelected,
        contactsCount: contactsCount,
        duplicatesCount: duplicatesCount,
      ),
    );
  }
}
