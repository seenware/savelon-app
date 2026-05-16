// lib/features/main_app/main_app_route.dart

import 'package:contacts/core/layout/app_shell.dart';
import 'package:contacts/core/layout/widgets/fading_branch_container.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_details/contact_details_page.dart';
import 'package:contacts/features/main_app/contacts/presentation/contacts_list/contacts_list_page.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:contacts/features/main_app/duplicates/presentation/pages/duplicates_page.dart';
import 'package:contacts/features/main_app/duplicates/presentation/providers/duplicates_providers.dart';
import 'package:contacts/features/main_app/settings/presentation/pages/change_password_page.dart';
import 'package:contacts/features/main_app/settings/presentation/pages/export_contacts_page.dart';
import 'package:contacts/features/main_app/settings/presentation/pages/language_settings_page.dart';
import 'package:contacts/features/main_app/settings/presentation/pages/export_contacts_password_page.dart';
import 'package:contacts/features/main_app/settings/presentation/pages/export_contacts_success_page.dart';
import 'package:contacts/features/main_app/settings/presentation/pages/remove_password_page.dart';
import 'package:contacts/features/main_app/settings/presentation/pages/set_password_page.dart';
import 'package:contacts/features/main_app/settings/presentation/pages/settings_page.dart';
import 'package:contacts/features/main_app/updates/presentation/pages/support_webview_page.dart';
import 'package:contacts/features/main_app/updates/presentation/pages/updates_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Navigator keys for nested navigation
final _shellNavigatorContactsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellContacts',
);
final _shellNavigatorUpdatesKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellUpdates',
);
final _shellNavigatorDuplicatesKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellDuplicates',
);
final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellSettings',
);

GoRoute mainAppRoute(String path) => GoRoute(
  path: path,
  redirect: (context, state) {
    final currentPath = state.uri.path;

    if (currentPath == path || currentPath == '$path/') {
      return '$path/contacts';
    }

    return null;
  },
  routes: [
    // Main app shell with nested navigation
    StatefulShellRoute(
      navigatorContainerBuilder: (context, navigationShell, children) {
        return FadingBranchContainer(
          currentIndex: navigationShell.currentIndex,
          children: children,
        );
      },
      builder: (context, state, navigationShell) {
        return Consumer(
          builder: (context, ref, _) {
            ref.watch(duplicateGroupsBackgroundSyncProvider);
            final contactsCountAsync = ref.watch(contactsCountProvider);
            final isOnDuplicatesBranch =
                state.uri.path.startsWith('$path/duplicates');
            final lastKnownDuplicatesCount =
                ref.watch(lastKnownDuplicatesCountProvider);
            final duplicatesCountAsync = isOnDuplicatesBranch
                ? ref.watch(duplicatesCountProvider)
                : const AsyncValue<int>.loading();
            if (isOnDuplicatesBranch) {
              final latest = duplicatesCountAsync.asData?.value;
              if (!duplicatesCountAsync.isLoading &&
                  latest != null &&
                  latest != lastKnownDuplicatesCount) {
                Future.microtask(
                  () => ref
                      .read(lastKnownDuplicatesCountProvider.notifier)
                      .setValue(latest),
                );
              }
            }
            return AppShell(
              navigationShell: navigationShell,
              contactsCount: contactsCountAsync.asData?.value,
              duplicatesCount: isOnDuplicatesBranch
                  ? duplicatesCountAsync.asData?.value ??
                      lastKnownDuplicatesCount
                  : lastKnownDuplicatesCount,
            );
          },
        );
      },
      branches: [
        // Contacts branch
        StatefulShellBranch(
          navigatorKey: _shellNavigatorContactsKey,
          routes: [
            GoRoute(
              path: 'contacts',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ContactListPage()),
              routes: [
                GoRoute(
                  path: ':contactId',
                  pageBuilder: (context, state) => MaterialPage(
                    child: ContactDetailsPage(
                      contactId: state.pathParameters['contactId']!,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        // Duplicates branch
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDuplicatesKey,
          routes: [
            GoRoute(
              path: 'duplicates',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: DuplicatesPage()),
              routes: [
                GoRoute(
                  path: ':contactId',
                  pageBuilder: (context, state) => MaterialPage(
                    child: ContactDetailsPage(
                      contactId: state.pathParameters['contactId']!,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        // Updates branch
        StatefulShellBranch(
          navigatorKey: _shellNavigatorUpdatesKey,
          routes: [
            GoRoute(
              path: 'updates',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: UpdatesPage()),
              routes: [
                GoRoute(
                  path: 'support-webview',
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: SupportWebViewPage()),
                ),
              ],
            ),
          ],
        ),

        // Settings branch
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            GoRoute(
              path: 'settings',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SettingsPage()),
              routes: [
                GoRoute(
                  path: 'password',
                  redirect: (context, state) =>
                      '/main_app/settings/password/set',
                ),
                GoRoute(
                  path: 'password/set',
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: SetPasswordPage()),
                ),
                GoRoute(
                  path: 'password/change',
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: ChangePasswordPage()),
                ),
                GoRoute(
                  path: 'password/remove',
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: RemovePasswordPage()),
                ),
                GoRoute(
                  path: 'language',
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: LanguageSettingsPage()),
                ),
                GoRoute(
                  path: 'export-contacts',
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: ExportContactsPage()),
                  routes: [
                    GoRoute(
                      path: 'protected',
                      pageBuilder: (context, state) => const MaterialPage(
                        child: ExportContactsPasswordPage(),
                      ),
                    ),
                    GoRoute(
                      path: 'success',
                      pageBuilder: (context, state) => const MaterialPage(
                        child: ExportContactsSuccessPage(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
