import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class NotesSection extends StatelessWidget {
  final TextEditingController controller;

  const NotesSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null,
      minLines: 4,
      scrollPhysics: const ClampingScrollPhysics(),
      decoration: InputDecoration(
        hintText: context.l10n.formHintNotes,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
