// lib/features/startup/subscription/presentation/subscription_expired_page.dart

import 'package:contacts/core/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubscriptionExpiredPage extends HookConsumerWidget {
  const SubscriptionExpiredPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifying = useState(false);
    final errorMessage = useState<String?>(null);

    Future<void> onVerify() async {
      verifying.value = true;
      errorMessage.value = null;
      final err = await ref.read(authProvider.notifier).verifySubscription();
      // If err is non-null, state was restored to expired — show the message.
      if (err != null) {
        errorMessage.value = err;
      }
      verifying.value = false;
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: 72,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 24),
                Text(
                  'Subscription Expired',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Internet only verifies subscription; contacts never leave the device.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
                if (errorMessage.value != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    errorMessage.value!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 32),
                if (verifying.value)
                  const CircularProgressIndicator()
                else
                  FilledButton.icon(
                    onPressed: onVerify,
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Verify Subscription'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
