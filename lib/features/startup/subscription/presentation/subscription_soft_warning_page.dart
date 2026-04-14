// lib/features/startup/subscription/presentation/subscription_soft_warning_page.dart

import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/core/purchases/purchases_service.dart'
    show PurchasesService, kOfflineWindowDays;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class SubscriptionSoftWarningPage extends HookConsumerWidget {
  const SubscriptionSoftWarningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastVerified = useState<DateTime?>(null);
    final deadline = useState<DateTime?>(null);
    final loading = useState(true);

    useEffect(() {
      Future<void> loadDates() async {
        final paidThrough = await PurchasesService.getCachedPaidThrough();
        final lv = await PurchasesService.getLastVerifiedAt();

        // Grace deadline mirrors evaluateOfflineAccess logic.
        DateTime? dl;
        if (paidThrough != null || lv != null) {
          final ref_ = (lv != null &&
                  paidThrough != null &&
                  lv.isAfter(paidThrough))
              ? lv
              : (paidThrough ?? lv!);
          dl = ref_.add(const Duration(days: kOfflineWindowDays));
        }

        lastVerified.value = lv;
        deadline.value = dl;
        loading.value = false;
      }

      loadDates();
      return null;
    }, const []);

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
                  Icons.wifi_off_rounded,
                  size: 72,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(height: 24),
                Text(
                  'Subscription Verification Needed',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                if (loading.value)
                  const CircularProgressIndicator()
                else
                  _BodyText(
                    lastVerified: lastVerified.value,
                    deadline: deadline.value,
                  ),
                const SizedBox(height: 32),
                FilledButton(
                  onPressed: () => ref
                      .read(authProvider.notifier)
                      .dismissSubscriptionWarning(),
                  child: const Text('Continue Anyway'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  final DateTime? lastVerified;
  final DateTime? deadline;

  const _BodyText({required this.lastVerified, required this.deadline});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        );

    final fmt = DateFormat.yMMMd();

    final verifiedLine = lastVerified != null
        ? 'Last verified ${fmt.format(lastVerified!)}.'
        : 'Subscription could not be verified online.';

    final deadlineLine = deadline != null
        ? 'Your access continues until ${fmt.format(deadline!)} — connect before then to verify.'
        : 'Connect to the internet to verify your subscription.';

    return Text(
      '$verifiedLine $deadlineLine',
      style: style,
      textAlign: TextAlign.center,
    );
  }
}
