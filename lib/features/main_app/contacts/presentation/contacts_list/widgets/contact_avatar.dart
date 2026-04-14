// lib/features/main_app/contacts/presentation/contacts_list/widgets/contact_avatar.dart

import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactAvatar extends ConsumerWidget {
  final String contactId;
  final String? imageFilename;
  final String firstName;
  final String lastName;
  final double? radius;

  const ContactAvatar({
    super.key,
    required this.contactId,
    required this.imageFilename,
    required this.firstName,
    required this.lastName,
    this.radius,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveRadius = radius ?? 20.0;

    final hasImage = imageFilename != null;

    if (hasImage) {
      final imageAsync = ref.watch(
        contactImageProvider((
          contactId: contactId,
          imageFilename: imageFilename,
        )),
      );

      return imageAsync.when(
        data: (imageBytes) {
          if (imageBytes == null) {
            return _buildInitialsAvatar(context, effectiveRadius);
          }

          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) =>
                Opacity(opacity: value, child: child),
            child: CircleAvatar(
              radius: effectiveRadius,
              backgroundImage: MemoryImage(imageBytes),
            ),
          );
        },
        loading: () =>
            SizedBox(width: effectiveRadius * 2, height: effectiveRadius * 2),
        error: (_, _) => _buildInitialsAvatar(context, effectiveRadius),
      );
    }

    return _buildInitialsAvatar(context, effectiveRadius);
  }

  Widget _buildInitialsAvatar(BuildContext context, double effectiveRadius) {
    final initials = _getInitials(firstName, lastName);

    return CircleAvatar(
      radius: effectiveRadius,
      backgroundColor: Theme.of(context).primaryColor,
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: effectiveRadius * 0.8,
        ),
      ),
    );
  }

  String _getInitials(String firstName, String lastName) {
    final first = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    final last = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
    final initials = '$first$last';
    return initials.isNotEmpty ? initials : '?';
  }
}
