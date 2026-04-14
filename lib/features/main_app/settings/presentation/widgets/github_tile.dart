// lib/features/main_app/settings/presentation/widgets/github_tile.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubTile extends StatelessWidget {
  const GithubTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.code,
        size: 20,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: const Text('Github'),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      onTap: () => _openGithub(context),
    );
  }

  Future<void> _openGithub(BuildContext context) async {
    final Uri githubUri = Uri.parse('https://github.com/seenware/savelon-app');
    try {
      await launchUrl(githubUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to open Github: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
