// lib/features/main_app/contacts/presentation/contacts_list/widgets/contact_list_tile.dart

import 'package:contacts/core/utils/phone_formatter.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/features/main_app/duplicates/presentation/providers/duplicates_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import '../../contact_form/contact_form.dart';
import 'contact_avatar.dart';
import 'contact_info_row.dart';

class ContactListTile extends ConsumerWidget {
  final Contact contact;
  final bool isFirstInGroup;
  final bool isLastInGroup;

  const ContactListTile({
    super.key,
    required this.contact,
    required this.isFirstInGroup,
    required this.isLastInGroup,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final borderRadius = _getBorderRadius();
    final primaryInfo = contact.primaryInfo;

    return Padding(
      padding: EdgeInsets.only(
        left: 0,
        right: 0,
        top: isFirstInGroup ? 4 : 1,
        bottom: isLastInGroup ? 8 : 1,
      ),
      child: Material(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () => _navigateToDetails(context),
          onLongPress: () => _showContextMenu(context, ref),
          borderRadius: borderRadius,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                ContactAvatar(
                  contactId: contact.id,
                  imageFilename: contact.imageFilename,
                  firstName: contact.firstName,
                  lastName: contact.lastName,
                  radius: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      if (primaryInfo != null) ...[
                        const SizedBox(height: 4),
                        ContactInfoRow(
                          icon: _getIconForInfoType(primaryInfo.type),
                          text: primaryInfo.type == 'phone'
                              ? PhoneFormatter.format(primaryInfo.value)
                              : primaryInfo.value,
                          flexible: true,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForInfoType(String type) {
    switch (type) {
      case 'phone':
        return Icons.phone;
      case 'email':
        return Icons.email;
      case 'company':
        return Icons.business;
      case 'department':
        return Icons.business;
      case 'jobTitle':
        return Icons.work;
      default:
        return Icons.info;
    }
  }

  BorderRadius _getBorderRadius() {
    const double smallRadius = 4.0;
    const double largeRadius = 12.0;

    if (isFirstInGroup && isLastInGroup) {
      return BorderRadius.circular(largeRadius);
    } else if (isFirstInGroup) {
      return const BorderRadius.only(
        topLeft: Radius.circular(largeRadius),
        topRight: Radius.circular(largeRadius),
        bottomLeft: Radius.circular(smallRadius),
        bottomRight: Radius.circular(smallRadius),
      );
    } else if (isLastInGroup) {
      return const BorderRadius.only(
        topLeft: Radius.circular(smallRadius),
        topRight: Radius.circular(smallRadius),
        bottomLeft: Radius.circular(largeRadius),
        bottomRight: Radius.circular(largeRadius),
      );
    } else {
      return BorderRadius.circular(smallRadius);
    }
  }

  void _navigateToDetails(BuildContext context) {
    context.push('/main_app/contacts/${contact.id}');
  }

  void _showEditForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      clipBehavior: Clip.antiAlias,
      builder: (_) => ContactForm(contact: contact),
    );
  }

  Future<void> _showContextMenu(BuildContext context, WidgetRef ref) async {
    final RenderBox? overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(
          position.dx,
          position.dy + box.size.height / 2,
          box.size.width,
          0,
        ),
        Offset.zero & (overlay?.size ?? Size.zero),
      ),
      items: [
        PopupMenuItem<String>(
          value: 'edit',
          child: Row(
            children: [
              const Icon(Icons.edit, size: 20),
              const SizedBox(width: 12),
              Text(context.l10n.commonEdit),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Row(
            children: [
              const Icon(Icons.delete, size: 20, color: Colors.red),
              const SizedBox(width: 12),
              Text(
                context.l10n.commonDelete,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );

    if (selected == 'edit' && context.mounted) {
      _showEditForm(context);
    } else if (selected == 'delete' && context.mounted) {
      await _showDeleteConfirmation(context, ref);
    }
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.l10n.deleteContactTitle),
        content: Text(
          dialogContext.l10n.deleteContactConfirm(contact.fullName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(dialogContext.l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(dialogContext.l10n.commonDelete),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    try {
      final repository = ref.read(contactsRepositoryProvider);
      await repository?.delete(contact.id);

      // Refresh the contacts list
      ref.invalidate(contactsProvider);
      ref.read(duplicateGroupsRefreshProvider.notifier).schedule();

      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(content: Text(context.l10n.contactDeleted)),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.failedToDelete(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
