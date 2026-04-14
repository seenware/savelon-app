// lib/features/main_app/contacts/presentation/contacts_list/contacts_list_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../core/theme/app_breakpoints.dart';
import '../../../../../core/theme/app_theme.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import '../contact_form/contact_form.dart';
import 'widgets/contacts_list_view.dart';
import 'widgets/compact_contacts_appbar.dart';
import 'widgets/wide_contacts_appbar.dart';

class ContactListPage extends HookConsumerWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsAsync = ref.watch(contactsProvider);
    final searchQuery = useState('');
    final isWideScreen = AppBreakpoints.isWide(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.screenPaddingH),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: isWideScreen
            ? WideContactsAppBar(
                searchQuery: searchQuery.value,
                onSearchChanged: (value) => searchQuery.value = value,
                onClear: () => searchQuery.value = '',
              )
            : CompactContactsAppBar(
                searchQuery: searchQuery.value,
                onSearchChanged: (value) => searchQuery.value = value,
                onClear: () => searchQuery.value = '',
              ),
        body: ContactsListView(
          contactsAsync: contactsAsync,
          searchQuery: searchQuery.value,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              useSafeArea: true,
              clipBehavior: Clip.antiAlias,
              builder: (_) => const ContactForm(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
