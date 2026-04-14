// lib/features/main_app/contacts/presentation/providers/export_contacts_provider.dart

import 'dart:typed_data';

import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:contacts/features/main_app/contacts/data/services/contact_export_assembler.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_messages.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ExportContactsState {
  final bool isExporting;
  final ExportContactsError? error;
  /// Only used when [error] is [ExportContactsError.exportFailed].
  final String? exportFailureDetail;
  final ExportContactsNotice? notice;
  final String? savedFilePath;
  final bool showIosAppFolderWarning;

  const ExportContactsState({
    this.isExporting = false,
    this.error,
    this.exportFailureDetail,
    this.notice,
    this.savedFilePath,
    this.showIosAppFolderWarning = false,
  });

  String? get errorMessage => error?.toUserMessage(exportFailureDetail);
}

bool exportContactsErrorIsNew(
  ExportContactsState? previous,
  ExportContactsState next,
) {
  if (next.error == null) return false;
  if (previous == null) return true;
  return next.error != previous.error ||
      next.exportFailureDetail != previous.exportFailureDetail;
}

bool exportContactsSuccessIsNew(
  ExportContactsState? previous,
  ExportContactsState next,
) {
  if (next.notice != ExportContactsNotice.fileSavedSuccessfully) return false;
  if (previous == null) return true;
  return previous.notice != ExportContactsNotice.fileSavedSuccessfully ||
      next.savedFilePath != previous.savedFilePath ||
      next.showIosAppFolderWarning != previous.showIosAppFolderWarning;
}

class ExportContactsNotifier extends Notifier<ExportContactsState> {
  @override
  ExportContactsState build() => const ExportContactsState();

  /// Native “Save as” / picker on mobile & desktop; direct save to Downloads (etc.) on Linux; browser download on web.
  Future<void> export({
    required bool usePassword,
    String? password,
  }) async {
    if (state.isExporting) return;

    state = const ExportContactsState(isExporting: true);

    try {
      final repository = ref.read(contactsRepositoryProvider);
      if (repository == null) {
        state = const ExportContactsState(
          error: ExportContactsError.contactsUnavailable,
        );
        return;
      }

      final contacts = await repository.getAll();
      if (contacts.isEmpty) {
        state = const ExportContactsState(
          error: ExportContactsError.noContacts,
        );
        return;
      }

      final imageStorage = ref.read(imageStorageProvider);

      Future<Uint8List?> loadPhoto(
        String contactId,
        String imageFilename,
      ) async {
        if (imageStorage == null) return null;
        return imageStorage.loadImage(contactId, imageFilename);
      }

      final vcfBytes = await ContactExportAssembler.buildVcfBytes(
        contacts,
        loadPhoto,
      );

      final Uint8List outBytes;
      final String fileExtension;
      final bool isZip;

      if (usePassword) {
        final pw = password;
        if (pw == null || pw.isEmpty) {
          state = const ExportContactsState(
            error: ExportContactsError.passwordRequiredForProtected,
          );
          return;
        }
        if (pw.length < kExportProtectedPasswordMinLength) {
          state = const ExportContactsState(
            error: ExportContactsError.passwordTooShortForProtected,
          );
          return;
        }
        outBytes = ContactExportAssembler.buildPasswordProtectedZip(
          vcfBytes,
          pw,
        );
        fileExtension = 'zip';
        isZip = true;
      } else {
        outBytes = vcfBytes;
        fileExtension = 'vcf';
        isZip = false;
      }

      final mimeType = isZip ? MimeType.zip : MimeType.custom;
      final customMime = isZip ? null : 'text/vcard';

      final exportBaseName =
          'contacts_${DateFormat('yyyy-MM-dd').format(DateTime.now())}';

      if (kIsWeb) {
        await FileSaver.instance.saveFile(
          name: exportBaseName,
          bytes: outBytes,
          fileExtension: fileExtension,
          mimeType: mimeType,
          customMimeType: customMime,
        );
        state = const ExportContactsState(
          notice: ExportContactsNotice.downloadStarted,
        );
        return;
      }

      final useSaveDialog =
          defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS ||
          defaultTargetPlatform == TargetPlatform.windows;

      if (useSaveDialog) {
        final path = await FileSaver.instance.saveAs(
          name: exportBaseName,
          bytes: outBytes,
          fileExtension: fileExtension,
          mimeType: mimeType,
          customMimeType: customMime,
        );
        if (path == null || path.isEmpty) {
          state = const ExportContactsState();
          return;
        }
        final shouldWarnForIosAppFolder =
            defaultTargetPlatform == TargetPlatform.iOS &&
            _looksLikeIosAppContainerPath(path);
        state = ExportContactsState(
          notice: ExportContactsNotice.fileSavedSuccessfully,
          savedFilePath: path,
          showIosAppFolderWarning: shouldWarnForIosAppFolder,
        );
        return;
      }

      await FileSaver.instance.saveFile(
        name: exportBaseName,
        bytes: outBytes,
        fileExtension: fileExtension,
        mimeType: mimeType,
        customMimeType: customMime,
      );
      state = const ExportContactsState(
        notice: ExportContactsNotice.fileSavedSuccessfully,
      );
    } catch (e) {
      state = ExportContactsState(
        error: ExportContactsError.exportFailed,
        exportFailureDetail: e.toString(),
      );
    }
  }
}

bool _looksLikeIosAppContainerPath(String path) {
  final normalized = path.toLowerCase();
  if (!normalized.contains('/documents/')) return false;
  return !normalized.contains('mobile documents');
}

final exportContactsNotifierProvider =
    NotifierProvider<ExportContactsNotifier, ExportContactsState>(
      ExportContactsNotifier.new,
    );
