import 'package:contacts/core/locale/locale_provider.dart';
import 'package:contacts/features/main_app/settings/presentation/language_locale_labels.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LanguageSettingsTile extends ConsumerWidget {
  const LanguageSettingsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final current = ref.watch(localeNotifierProvider);
    final subtitle = current == null
        ? l10n.languageSystemDefault
        : labelForLocale(current);

    return ListTile(
      leading: const Icon(Icons.language_outlined),
      title: Text(l10n.language),
      subtitle: Text(subtitle),
      onTap: () => context.push('/main_app/settings/language'),
    );
  }
}
