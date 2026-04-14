// lib/features/main_app/contacts/presentation/contact_form/handlers/form_save_handler.dart

import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:contacts/core/review/app_review_service.dart';
import 'package:contacts/features/main_app/organize/presentation/providers/organize_providers.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import '../hooks/use_contact_form_state.dart';
import '../utils/contact_mapper.dart';
import '../utils/form_validation.dart';
import '../widgets/no_name_dialog.dart';

class FormSaveHandler {
  final GlobalKey<FormState> formKey;
  final ContactFormState formState;
  final Contact? contact;
  final bool isEditingMode;
  final List<String> deleteOnSaveIds;
  final WidgetRef ref;

  FormSaveHandler({
    required this.formKey,
    required this.formState,
    required this.contact,
    required this.isEditingMode,
    this.deleteOnSaveIds = const [],
    required this.ref,
  });

  bool get isEditing => isEditingMode;

  Future<void> handleSave(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    final firstName = formState.firstNameController.text.trim();
    final lastName = formState.lastNameController.text.trim();
    final nickname = formState.nicknameController.text.trim();

    if (!FormValidation.hasName(firstName, lastName, nickname)) {
      final shouldSave = await showNoNameDialog(context);
      if (!context.mounted) return;
      if (shouldSave != true) return;
    }

    // In edit mode, if there are no unsaved changes, just close without saving
    // to avoid showing an unnecessary "Contact updated" message.
    if (isEditing && !formState.hasUnsavedChanges.value) {
      if (!context.mounted) return;
      Navigator.of(context).pop();
      return;
    }

    if (isEditing) {
      await _updateContact(context);
    } else {
      await _createContact(context);
    }
  }

  Future<void> _updateContact(
    BuildContext context,
  ) async {
    final l10n = context.l10n;
    final localeName = Localizations.localeOf(context).toString();
    try {
      final imageFilename = await _persistImage(contact!.id, contact!.imageFilename);

      final updatedContact = ContactMapper.fromFormState(
        formState: formState,
        contactId: contact!.id,
        imageFilename: imageFilename,
        localeName: localeName,
      );

      final repository = ref.read(contactsRepositoryProvider);
      if (repository == null) throw Exception('Contacts repository not found');
      await repository.save(updatedContact);

      ref.invalidate(contactsProvider);
      ref.read(duplicateGroupsRefreshProvider.notifier).schedule();
      ref.read(appReviewServiceProvider).maybePromptReviewOnce();

      if (!context.mounted) return;

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.contactUpdated)),
      );
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.failedToUpdate(e.toString())),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _createContact(
    BuildContext context,
  ) async {
    final l10n = context.l10n;
    final localeName = Localizations.localeOf(context).toString();
    try {
      final contactId = const Uuid().v4();
      String? imageFilename = await _persistImage(contactId, null);
      if (imageFilename == null &&
          !formState.imageRemovedNotifier.value &&
          formState.imageNotifier.value == null &&
          contact?.id.isNotEmpty == true &&
          contact?.imageFilename != null) {
        final imageStorage = ref.read(imageStorageProvider);
        if (imageStorage != null) {
          final sourceContactId = contact!.id;
          final sourceFilename = contact!.imageFilename!;
          final sourceBytes = await imageStorage.loadImage(
            sourceContactId,
            sourceFilename,
          );
          if (sourceBytes != null) {
            imageFilename = await imageStorage.saveImage(contactId, sourceBytes);
          }
        }
      }

      final newContact = ContactMapper.fromFormState(
        formState: formState,
        contactId: contactId,
        imageFilename: imageFilename,
        localeName: localeName,
      );

      final repository = ref.read(contactsRepositoryProvider);
      if (repository == null) throw Exception('Contacts repository not found');
      if (deleteOnSaveIds.isNotEmpty) {
        await repository.saveMerged(newContact, deleteIds: deleteOnSaveIds);
      } else {
        await repository.save(newContact);
      }

      ref.invalidate(contactsProvider);
      ref.read(duplicateGroupsRefreshProvider.notifier).schedule();

      if (!context.mounted) return;

      Navigator.of(context).pop();
      final isMerge = deleteOnSaveIds.isNotEmpty;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isMerge ? l10n.contactsMerged : l10n.contactSaved,
          ),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.failedToSave(e.toString())),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  /// Encrypts and stores the picked image, or deletes it if removed.
  ///
  /// Returns the filename to store in the DB:
  /// - Image removed → deletes file, returns null
  /// - New image picked → saves file, returns new filename (deletes old if changed)
  /// - No change → returns existing filename unchanged
  Future<String?> _persistImage(
    String contactId,
    String? existingFilename,
  ) async {
    final imageStorage = ref.read(imageStorageProvider);

    if (formState.imageRemovedNotifier.value) {
      if (imageStorage != null && existingFilename != null) {
        await imageStorage.deleteImage(contactId, existingFilename);
      }
      return null;
    }

    final pickedBytes = formState.imageNotifier.value;
    if (pickedBytes == null) return existingFilename;

    if (imageStorage == null) return existingFilename;

    // Delete old image before writing the new one
    if (existingFilename != null) {
      await imageStorage.deleteImage(contactId, existingFilename);
    }

    return await imageStorage.saveImage(contactId, pickedBytes);
  }
}
