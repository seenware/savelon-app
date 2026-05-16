import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'widgets/adaptive_navigation.dart';

class AppShell extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  final int? contactsCount;
  final int? duplicatesCount;

  const AppShell({
    super.key,
    required this.navigationShell,
    this.contactsCount,
    this.duplicatesCount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveNavigation(
      navigationShell: navigationShell,
      contactsCount: contactsCount,
      duplicatesCount: duplicatesCount,
    );
  }
}
