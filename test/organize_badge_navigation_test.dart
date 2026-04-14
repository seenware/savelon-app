import 'package:contacts/l10n/app_localizations.dart';
import 'package:contacts/core/layout/widgets/bottom_navigation.dart';
import 'package:contacts/core/layout/widgets/side_navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('bottom navigation shows organize badge count', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          bottomNavigationBar: BottomNavigation(
            selectedIndex: 1,
            onDestinationSelected: (_) {},
            contactsCount: 0,
            organizeCount: 5,
          ),
        ),
      ),
    );

    expect(find.text('5'), findsOneWidget);
  });

  testWidgets('side navigation shows organize badge count', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          textTheme: const TextTheme(displaySmall: TextStyle(fontSize: 20)),
        ),
        home: SizedBox(
          width: 500,
          child: Scaffold(
            body: SideNavigationDrawer(
              selectedIndex: 1,
              onDestinationSelected: (_) {},
              contactsCount: 0,
              organizeCount: 3,
            ),
          ),
        ),
      ),
    );

    expect(find.text('3'), findsOneWidget);
  });
}
