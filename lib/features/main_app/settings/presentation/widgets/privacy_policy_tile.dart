// lib/features/main_app/settings/presentation/widgets/privacy_policy_tile.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyTile extends StatelessWidget {
  const PrivacyPolicyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.visibility_off_outlined,
        size: 20,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: const Text('Privacy Policy'),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      onTap: () => _openPrivacyPolicy(context),
    );
  }

  Future<void> _openPrivacyPolicy(BuildContext context) async {
    final Uri privacyPolicyUri = Uri.parse('https://savelon.com/privacy');
    try {
      await launchUrl(privacyPolicyUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to open privacy policy: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
