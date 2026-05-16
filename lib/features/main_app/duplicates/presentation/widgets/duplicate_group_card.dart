import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/duplicates/presentation/mappers/duplicates_group_presenter.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class DuplicateGroupCard extends StatelessWidget {
  final DuplicateGroup group;
  final Set<String> selectedIds;
  final DuplicatesGroupPresenter presenter;
  final VoidCallback onSkip;
  final VoidCallback? onMerge;
  final ValueChanged<Contact> onContactTap;
  final ValueChanged<Contact> onToggleSelection;

  const DuplicateGroupCard({
    super.key,
    required this.group,
    required this.selectedIds,
    required this.presenter,
    required this.onSkip,
    required this.onMerge,
    required this.onContactTap,
    required this.onToggleSelection,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final showSelectionControl = group.contacts.length >= 3;
    final duplicatesTitle = l10n.duplicatesCount(group.contacts.length);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              duplicatesTitle,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...group.contacts.map(
              (contact) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: showSelectionControl
                    ? GestureDetector(
                        onTap: () => onToggleSelection(contact),
                        child: _SelectionCircle(
                          selected: selectedIds.contains(contact.id),
                        ),
                      )
                    : null,
                title: Text(
                  contact.fullName.isNotEmpty
                      ? contact.fullName
                      : l10n.noNameInList,
                ),
                subtitle: Text(presenter.subtitle(l10n, contact)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => onContactTap(contact),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                TextButton(
                  onPressed: onSkip,
                  child: Text(l10n.commonSkip),
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: onMerge,
                  icon: const Icon(Icons.merge_type),
                  label: Text(l10n.commonMerge),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectionCircle extends StatelessWidget {
  final bool selected;

  const _SelectionCircle({required this.selected});

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).colorScheme.secondaryContainer;
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? selectedColor : Colors.transparent,
        border: Border.all(
          color: selected ? selectedColor : Theme.of(context).dividerColor,
        ),
      ),
      child: selected ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
    );
  }
}
