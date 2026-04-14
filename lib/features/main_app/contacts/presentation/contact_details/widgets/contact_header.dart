// lib/features/main_app/contacts/presentation/contact_details/widgets/contact_header.dart

import 'dart:typed_data';

import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:contacts/core/theme/app_breakpoints.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_details/utils/contact_display_helpers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactHeader extends ConsumerWidget {
  final Contact contact;
  final double expansionProgress;
  final VoidCallback? onAvatarTap;

  const ContactHeader({
    super.key,
    required this.contact,
    required this.expansionProgress,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final fullName = ContactDisplayHelpers.getFullName(contact);
    final hasNickname = contact.nickname.isNotEmpty;

    final imageAsync = ref.watch(
      contactImageProvider((
        contactId: contact.id,
        imageFilename: contact.imageFilename,
      )),
    );
    final imageBytes = imageAsync.asData?.value;
    final hasImage = imageBytes != null;

    final clampedProgress = expansionProgress.clamp(
      0.0,
      1.0,
    ); // 0 = circle, 1 = rectangle
    const minImageSize = 120.0;
    final mediaQuery = MediaQuery.of(context);
    final isWideScreen = AppBreakpoints.isWide(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availablePageWidth = constraints.maxWidth;
        final wideLandscapeMaxSize = mediaQuery.size.height * 0.4;

        final maxExpandedSize = isWideScreen && isLandscape
            ? wideLandscapeMaxSize.clamp(minImageSize, availablePageWidth)
            : availablePageWidth.clamp(minImageSize, double.infinity);

        final imageSize =
            minImageSize + (maxExpandedSize - minImageSize) * clampedProgress;

        // Start with a circle, end with a rectangle/square.
        final startRadius = minImageSize / 2;
        const endRadius = 0.0;
        final borderRadiusValue =
            startRadius + (endRadius - startRadius) * clampedProgress;
        final borderRadius = BorderRadius.circular(borderRadiusValue);

        return Column(
          children: [
            SizedBox(height: 24 * (1 - clampedProgress)),
            GestureDetector(
              onTap: hasImage && onAvatarTap != null ? onAvatarTap : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                width: imageSize,
                height: imageSize,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: _buildAvatarContent(
                    context: context,
                    theme: theme,
                    imageBytes: imageBytes,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Full name
            Text(
              fullName.isNotEmpty ? fullName : 'No Name',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            // Nickname
            if (hasNickname) ...[
              const SizedBox(height: 4),
              Text(
                '"${contact.nickname}"',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildAvatarContent({
    required BuildContext context,
    required ThemeData theme,
    required Uint8List? imageBytes,
  }) {
    if (imageBytes != null) {
      return Image.memory(
        imageBytes,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      );
    }

    final initials = ContactDisplayHelpers.getInitials(contact);
    final backgroundColor = theme.colorScheme.primaryContainer;
    final foregroundColor = theme.colorScheme.onPrimaryContainer;

    return Container(
      color: backgroundColor,
      alignment: Alignment.center,
      child: Text(
        initials,
        style: theme.textTheme.headlineMedium?.copyWith(
          color: foregroundColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
