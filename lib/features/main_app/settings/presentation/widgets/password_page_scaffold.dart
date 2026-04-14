// lib/features/main_app/settings/presentation/widgets/password_page_scaffold.dart

import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordPageScaffold extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Widget child;

  const PasswordPageScaffold({
    super.key,
    required this.title,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(title, style: theme.textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: isLoading ? null : () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.screenPaddingH,
          vertical: context.spacing.screenPaddingV,
        ),
        child: child,
      ),
    );
  }
}
