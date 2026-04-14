// lib/features/main_app/contacts/presentation/contact_details/widgets/contact_avatar.dart

import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_details/utils/contact_display_helpers.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactAvatar extends ConsumerWidget {
  final Contact contact;
  final double size;

  const ContactAvatar({super.key, required this.contact, this.size = 120});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final imageAsync = ref.watch(
      contactImageProvider((
        contactId: contact.id,
        imageFilename: contact.imageFilename,
      )),
    );

    final imageBytes = imageAsync.asData?.value;

    if (imageBytes != null) {
      return CircleAvatar(
        radius: size / 2,
        backgroundImage: MemoryImage(imageBytes),
      );
    }

    final initials = ContactDisplayHelpers.getInitials(contact);
    final backgroundColor = theme.colorScheme.primaryContainer;
    final foregroundColor = theme.colorScheme.onPrimaryContainer;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Center(
        child: Text(
          initials,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: foregroundColor,
            fontWeight: FontWeight.w600,
            fontSize: size * 0.4,
          ),
        ),
      ),
    );
  }
}
