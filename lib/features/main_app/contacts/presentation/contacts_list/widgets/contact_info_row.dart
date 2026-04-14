// lib/features/main_app/contacts/presentation/contacts_list/widgets/contact_info_row.dart

import 'package:flutter/material.dart';

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool flexible;

  const ContactInfoRow({
    super.key,
    required this.icon,
    required this.text,
    this.flexible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        if (flexible)
          Flexible(child: Text(text, overflow: TextOverflow.ellipsis))
        else
          Text(text),
      ],
    );
  }
}
