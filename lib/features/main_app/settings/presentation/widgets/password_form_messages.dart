// lib/features/main_app/settings/presentation/widgets/password_form_messages.dart

import 'package:contacts/core/layout/widgets/message_card.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PasswordFormMessages extends StatelessWidget {
  final String? errorMessage;

  const PasswordFormMessages({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    if (errorMessage == null) return const SizedBox.shrink();

    return Column(
      children: [
        MessageCard(message: errorMessage!, type: MessageCardType.error),
        SizedBox(height: context.spacing.medium),
      ],
    );
  }
}
