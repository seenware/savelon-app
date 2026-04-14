import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/core/auth/auth_state.dart';
import 'package:contacts/core/crypto/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PasswordSettingsTile extends ConsumerWidget {
  const PasswordSettingsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authProvider);

    // Only show when authenticated.
    if (!authAsync.hasValue || authAsync.value is! AuthStateAuthenticated) {
      return const SizedBox.shrink();
    }

    final cryptoService = ref.watch(cryptoServiceProvider);

    return FutureBuilder<bool>(
      future: cryptoService.isPasswordEnabled(),
      builder: (context, snapshot) {
        final hasPassword = snapshot.data ?? false;
        final l10n = context.l10n;
        final title = hasPassword
            ? l10n.passwordSettingsChangeTitle
            : l10n.passwordSettingsSetTitle;

        return ListTile(
          leading: Icon(
            hasPassword ? Icons.lock_outline : Icons.lock_open_outlined,
            size: 20,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(title),
          onTap: () {
            final route = hasPassword
                ? '/main_app/settings/password/change'
                : '/main_app/settings/password/set';
            context.push(route);
          },
        );
      },
    );
  }
}
