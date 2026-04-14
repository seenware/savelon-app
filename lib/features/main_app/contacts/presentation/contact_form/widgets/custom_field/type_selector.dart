import 'package:contacts/features/main_app/contacts/presentation/contact_form/utils/field_type_l10n.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class TypeSelector extends StatelessWidget {
  final List<String> types;
  final Function(String) onSelected;
  final String selectedType;
  final FieldKind fieldKind;

  const TypeSelector({
    super.key,
    required this.types,
    required this.onSelected,
    required this.selectedType,
    required this.fieldKind,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopupMenuButton<String>(
      initialValue: types[0],
      onSelected: onSelected,
      itemBuilder: (_) => [
        for (final t in types)
          PopupMenuItem(
            value: t,
            child: Text(localizedFieldType(l10n, t, fieldKind)),
          ),
      ],
      tooltip: '',
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 90,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                localizedFieldType(l10n, selectedType, fieldKind),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.7),
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: Colors.grey.shade700,
            ),
          ],
        ),
      ),
    );
  }
}
