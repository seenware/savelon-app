// lib/features/startup/setup/presentation/widgets/page_shell.dart

import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/layout/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageShell extends StatelessWidget {
  final String title;
  final VoidCallback? onNext;
  final VoidCallback? onDisabledNext;
  final bool showBackButton;
  final List<Widget> children;
  final String nextButtonText;
  final bool isLoading;

  const PageShell({
    super.key,
    required this.title,
    required this.onNext,
    this.onDisabledNext,
    this.showBackButton = true,
    required this.children,
    this.nextButtonText = 'Continue',
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset:
          true, // Changed to true to allow keyboard resize
      limitWidth: true,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 24)),
                if (showBackButton)
                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () => context.pop(),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(child: Column(children: children)),
          ),
          PrimaryButton(
            text: nextButtonText,
            onPressed: onNext,
            onDisabledPressed: onDisabledNext,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
