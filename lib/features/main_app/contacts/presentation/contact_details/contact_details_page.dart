// lib/features/main_app/contacts/presentation/contact_details/contact_details_page.dart

import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:contacts/features/main_app/organize/presentation/providers/organize_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../contact_form/contact_form.dart';
import 'widgets/contact_header.dart';
import 'widgets/contact_info_group.dart';

class ContactDetailsPage extends HookConsumerWidget {
  final String contactId;

  const ContactDetailsPage({super.key, required this.contactId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactAsync = ref.watch(contactByIdProvider(contactId));

    return contactAsync.when(
      data: (contact) {
        if (contact == null) {
          return _buildNotFoundScreen(context);
        }
        return _buildDetailsScreen(context, ref, contact);
      },
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) {
        final l10n = context.l10n;
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red),
                SizedBox(height: 16),
                Text(l10n.commonErrorWithDetails(error.toString())),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(contactByIdProvider(contactId)),
                  child: Text(l10n.commonRetry),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotFoundScreen(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_off, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(l10n.contactNotFound),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.commonBack),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsScreen(
    BuildContext context,
    WidgetRef ref,
    Contact contact,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final scrollController = useScrollController();
    final isExpanded = useRef(false);
    final expansionController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final expansionProgress = useAnimation(expansionController);
    const collapseDeltaThreshold = 2.0;

    void handleAvatarTap() {
      if (isExpanded.value) return;
      isExpanded.value = true;
      expansionController.forward();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final metrics = notification.metrics;
              if (notification is ScrollUpdateNotification) {
                final scrollDelta = notification.scrollDelta ?? 0.0;

                // When image is expanded or collapsing, consume upward drag to
                // collapse it first without scrolling the content.
                if (expansionController.value > 0 &&
                    scrollDelta > collapseDeltaThreshold &&
                    metrics.pixels >= metrics.minScrollExtent + 1.0 &&
                    notification.dragDetails != null) {
                  if (isExpanded.value && expansionController.isCompleted) {
                    isExpanded.value = false;
                    expansionController.reverse();
                  }

                  if (scrollController.hasClients) {
                    final current = scrollController.offset;
                    final target = (current - scrollDelta)
                        .clamp(metrics.minScrollExtent, metrics.maxScrollExtent);
                    scrollController.jumpTo(target);
                  }

                  return true;
                }

                // User is dragging down at the very top (overscroll region):
                // maximise image immediately once a downward drag is detected.
                if (!isExpanded.value &&
                    expansionController.isDismissed &&
                    metrics.pixels <= 0 &&
                    notification.dragDetails != null &&
                    scrollDelta < 0) {
                  isExpanded.value = true;
                  expansionController.forward();
                }
              }

              return false;
            },
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    ContactHeader(
                      contact: contact,
                      expansionProgress: expansionProgress,
                      onAvatarTap: handleAvatarTap,
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildContactInfoGroups(contact),
                          const SizedBox(height: 24),
                          _buildDeleteButton(context, ref, contact),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildOverlayAppBar(context, colorScheme, contact),
        ],
      ),
    );
  }

  Widget _buildOverlayAppBar(
    BuildContext context,
    ColorScheme colorScheme,
    Contact contact,
  ) {
    final padding = MediaQuery.of(context).padding;

    return Positioned(
      top: padding.top + 8,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconCircle(
            context: context,
            colorScheme: colorScheme,
            icon: Icons.arrow_back,
            onPressed: () => Navigator.pop(context),
          ),
          _buildIconCircle(
            context: context,
            colorScheme: colorScheme,
            icon: Icons.edit_outlined,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                useSafeArea: true,
                clipBehavior: Clip.antiAlias,
                builder: (_) => ContactForm(contact: contact),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIconCircle({
    required BuildContext context,
    required ColorScheme colorScheme,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      elevation: 0,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.15),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            size: 24,
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfoGroups(Contact contact) {
    final communicationGroup = ContactInfoGroup.communication(contact: contact);
    final workGroup = ContactInfoGroup.work(contact: contact);
    final additionalGroup = ContactInfoGroup.additional(contact: contact);

    return Column(
      children: [
        communicationGroup,
        if (communicationGroup.cards.isNotEmpty) const SizedBox(height: 20),

        workGroup,
        if (workGroup.cards.isNotEmpty) const SizedBox(height: 20),

        additionalGroup,
      ],
    );
  }

  Widget _buildDeleteButton(
    BuildContext context,
    WidgetRef ref,
    Contact contact,
  ) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => _confirmDelete(context, ref, contact),
        icon: const Icon(Icons.delete_outline_rounded, size: 24),
        label: Text(context.l10n.deleteContactTitle),
        style: OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.error,
          side: BorderSide(color: Theme.of(context).colorScheme.error),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Contact contact,
  ) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.deleteContactTitle),
        content: Text(l10n.deleteContactConfirmQuoted(contact.fullName)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            child: Text(l10n.commonDelete),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    try {
      final repository = ref.read(contactsRepositoryProvider);
      await repository?.delete(contactId);

      // Refresh contacts list
      ref.invalidate(contactsProvider);
      ref.read(duplicateGroupsRefreshProvider.notifier).schedule();

      if (!context.mounted) return;

      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.contactDeleted)));
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.failedToDelete(e.toString())),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
