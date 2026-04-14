import 'package:contacts/features/main_app/contacts/presentation/contact_form/controllers/name_fields_controller.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Header extends HookWidget {
  final TextEditingController? prefixController;
  final TextEditingController firstNameController;
  final TextEditingController? middleNameController;
  final TextEditingController lastNameController;
  final TextEditingController? suffixController;
  final NameFieldsController nameFieldsController;
  final bool isEditing;
  final VoidCallback onSave;
  final VoidCallback? onClose;

  const Header({
    super.key,
    this.prefixController,
    required this.firstNameController,
    this.middleNameController,
    required this.lastNameController,
    this.suffixController,
    required this.nameFieldsController,
    required this.onSave,
    this.onClose,
    this.isEditing = false,
  });

  String _getDisplayTitle(AppLocalizations l10n) {
    final prefix = prefixController?.text.trim() ?? '';
    final first = firstNameController.text.trim();
    final middle = middleNameController?.text.trim() ?? '';
    final last = lastNameController.text.trim();
    final suffix = suffixController?.text.trim() ?? '';

    final parts = <String>[];
    if (prefix.isNotEmpty) parts.add(prefix);
    if (first.isNotEmpty) parts.add(first);
    if (middle.isNotEmpty) parts.add(middle);
    if (last.isNotEmpty) parts.add(last);
    if (suffix.isNotEmpty) parts.add(suffix);

    final combinedName = parts.join(' ');

    if (combinedName.isEmpty) {
      return isEditing ? l10n.editContact : l10n.newContact;
    }

    return combinedName;
  }

  @override
  Widget build(BuildContext context) {
    // Listen to all name field changes
    useListenable(firstNameController);
    useListenable(lastNameController);
    if (prefixController != null) useListenable(prefixController!);
    if (middleNameController != null) useListenable(middleNameController!);
    if (suffixController != null) useListenable(suffixController!);

    final displayTitle = _getDisplayTitle(context.l10n);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: onClose ?? () => Navigator.of(context).pop(),
        ),
        Expanded(
          child: Center(
            child: Text(
              displayTitle,
              style: Theme.of(context).textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
        IconButton.filled(
          icon: const Icon(Icons.check_rounded),
          onPressed: onSave,
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
