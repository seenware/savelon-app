// lib/core/layout/widgets/message_card.dart

import 'package:contacts/core/layout/widgets/custom_theme_wrapper.dart';
import 'package:flutter/material.dart';

enum MessageCardType { warning, error, info }

class MessageCard extends StatelessWidget {
  final String message;
  final MessageCardType type;
  const MessageCard({super.key, required this.message, required this.type});

  @override
  Widget build(BuildContext context) {
    if (type == MessageCardType.info) {
      return MessageCardContent(message: message, type: type);
    }

    final themeSeedColor = switch (type) {
      MessageCardType.warning => Colors.orange,
      MessageCardType.error => Colors.red,
      MessageCardType.info => Colors.blue,
    };

    return CustomThemeWrapper(
      seedColor: themeSeedColor,
      child: MessageCardContent(message: message, type: type),
    );
  }
}

class MessageCardContent extends StatelessWidget {
  final MessageCardType type;
  final String message;
  const MessageCardContent({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: Row(
        children: [
          Icon(switch (type) {
            MessageCardType.warning => Icons.warning_amber_rounded,
            MessageCardType.error => Icons.error_outline_rounded,
            MessageCardType.info => Icons.info_outline_rounded,
          }, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
