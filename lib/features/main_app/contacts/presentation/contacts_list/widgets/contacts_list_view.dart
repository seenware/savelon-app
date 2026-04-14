// lib/features/main_app/contacts/presentation/contacts_list/widgets/contacts_list_view.dart

import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/import_contacts_capabilities.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_view_providers.dart';
import 'contact_list_tile.dart';
import 'empty_state_widget.dart';
import 'import_contacts_button.dart';

class ContactsListView extends ConsumerWidget {
  final AsyncValue<List<Contact>> contactsAsync;
  final String searchQuery;

  const ContactsListView({
    super.key,
    required this.contactsAsync,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return contactsAsync.when(
      data: (allContacts) {
        final filteredContacts = ref.watch(searchContactsProvider(searchQuery));

        if (filteredContacts.isEmpty) {
          final isTrulyEmpty = allContacts.isEmpty && searchQuery.isEmpty;
          final l10n = context.l10n;

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EmptyStateWidget(
                  message: searchQuery.isEmpty
                      ? l10n.contactsListEmpty
                      : l10n.contactsSearchNoResults,
                ),
                if (isTrulyEmpty && availableImportSources.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  const ImportContactsButton(
                    filled: false,
                    directDeviceImport: true,
                  ),
                ],
              ],
            ),
          );
        }

        return _buildGroupedList(context, ref);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _ErrorStateWidget(
        error: error,
        onRetry: () => ref.invalidate(contactsProvider),
      ),
    );
  }

  Widget _buildGroupedList(BuildContext context, WidgetRef ref) {
    final groupedContacts = ref.watch(groupedContactsProvider(searchQuery));
    final sortedKeys = ref.watch(sortedContactSectionKeysProvider(searchQuery));

    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        for (final letter in sortedKeys)
          SliverMainAxisGroup(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(
                  letter: letter,
                  backgroundColor: backgroundColor,
                  textColor: primaryColor,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final groupContacts = groupedContacts[letter]!;
                  final contact = groupContacts[index];
                  final isFirst = index == 0;
                  final isLast = index == groupContacts.length - 1;

                  return ContactListTile(
                    contact: contact,
                    isFirstInGroup: isFirst,
                    isLastInGroup: isLast,
                  );
                }, childCount: groupedContacts[letter]!.length),
              ),
            ],
          ),
      ],
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String letter;
  final Color backgroundColor;
  final Color textColor;

  _StickyHeaderDelegate({
    required this.letter,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  double get minExtent => 40.0;

  @override
  double get maxExtent => 40.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_StickyHeaderDelegate oldDelegate) {
    return letter != oldDelegate.letter ||
        backgroundColor != oldDelegate.backgroundColor ||
        textColor != oldDelegate.textColor;
  }
}

class _ErrorStateWidget extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorStateWidget({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(l10n.commonErrorWithDetails(error.toString())),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: Text(l10n.commonRetry)),
        ],
      ),
    );
  }
}
