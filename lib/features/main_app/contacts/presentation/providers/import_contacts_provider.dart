// features/main_app/contacts/presentation/providers/import_contacts_provider.dart

import 'dart:typed_data';

import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:contacts/features/main_app/contacts/data/datasources/contact_file_import_datasource.dart';
import 'package:contacts/features/main_app/contacts/data/datasources/contact_file_import_datasource_impl.dart';
import 'package:contacts/features/main_app/contacts/data/datasources/device_contacts_datasource.dart';
import 'package:contacts/features/main_app/contacts/data/datasources/device_contacts_datasource_impl.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:contacts/features/main_app/duplicates/presentation/providers/duplicates_providers.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceContactsDataSourceProvider = Provider<DeviceContactsDataSource>(
  (ref) => DeviceContactsDataSourceImpl(),
);
final contactFileImportDataSourceProvider =
    Provider<ContactFileImportDataSource>(
      (ref) => ContactFileImportDataSourceImpl(),
    );

enum ImportContactsStatus {
  idle,
  preparing,
  awaitingPassword,
  importing,
  success,
  error,
  permissionDenied,
  noContacts,
}

enum ImportContactsError {
  unsupportedSource,
  permissionDenied,
  noContacts,
  unsupportedFileType,
  invalidFile,
  wrongArchivePassword,
  noVcfInArchive,
  importFailed,
}

extension ImportContactsErrorX on ImportContactsError {
  /// English fallback for tests / logging only — UI should use [localizedMessage].
  String toUserMessage([String? detail]) {
    return switch (this) {
      ImportContactsError.unsupportedSource => 'Import is not available here.',
      ImportContactsError.permissionDenied =>
        'Contacts permission is required to import contacts.',
      ImportContactsError.noContacts => 'There are no contacts to import.',
      ImportContactsError.unsupportedFileType =>
        'Please select a .vcf file or a .zip archive.',
      ImportContactsError.invalidFile =>
        'The selected file is invalid or unreadable.',
      ImportContactsError.wrongArchivePassword =>
        'Incorrect archive password. Please try again.',
      ImportContactsError.noVcfInArchive =>
        'No .vcf files were found in the selected archive.',
      ImportContactsError.importFailed =>
        'Failed to import contacts: ${detail ?? 'unknown error'}',
    };
  }
}

enum ImportPreparationResult { ready, cancelled, passwordRequired, failed }

class ImportContactsState {
  final ImportContactsStatus status;
  final List<Contact> contactsToImport;
  final int importedCount;
  final int skippedCount;
  final ImportContactsError? error;
  final String? importFailureDetail;

  const ImportContactsState({
    this.status = ImportContactsStatus.idle,
    this.contactsToImport = const [],
    this.importedCount = 0,
    this.skippedCount = 0,
    this.error,
    this.importFailureDetail,
  });

  String? get errorMessage => error?.toUserMessage(importFailureDetail);

  ImportContactsState copyWith({
    ImportContactsStatus? status,
    List<Contact>? contactsToImport,
    int? importedCount,
    int? skippedCount,
    Object? error = _missing,
    Object? importFailureDetail = _missing,
  }) {
    return ImportContactsState(
      status: status ?? this.status,
      contactsToImport: contactsToImport ?? this.contactsToImport,
      importedCount: importedCount ?? this.importedCount,
      skippedCount: skippedCount ?? this.skippedCount,
      error: error == _missing ? this.error : error as ImportContactsError?,
      importFailureDetail: importFailureDetail == _missing
          ? this.importFailureDetail
          : importFailureDetail as String?,
    );
  }
}

const _missing = Object();

final importContactsStateProvider =
    NotifierProvider<ImportContactsNotifier, ImportContactsState>(
      ImportContactsNotifier.new,
    );

class ImportContactsNotifier extends Notifier<ImportContactsState> {
  PickedContactImportFile? _pickedImportFile;
  List<FileImportContactWithPhoto> _fileContactsWithPhotos = const [];

  @override
  ImportContactsState build() {
    return const ImportContactsState();
  }

  Future<ImportPreparationResult> prepareDeviceContacts() async {
    _pickedImportFile = null;
    state = const ImportContactsState(status: ImportContactsStatus.preparing);

    final dataSource = ref.read(deviceContactsDataSourceProvider);

    try {
      final hasPermission = await dataSource.requestPermission();
      if (!hasPermission) {
        state = const ImportContactsState(
          status: ImportContactsStatus.permissionDenied,
          error: ImportContactsError.permissionDenied,
        );
        return ImportPreparationResult.failed;
      }

      final contacts = await dataSource.fetchContactsWithPhotos();
      final mappedContacts = contacts.map((entry) => entry.contact).toList();

      if (mappedContacts.isEmpty) {
        state = const ImportContactsState(
          status: ImportContactsStatus.noContacts,
          error: ImportContactsError.noContacts,
        );
        return ImportPreparationResult.failed;
      }

      state = ImportContactsState(
        status: ImportContactsStatus.idle,
        contactsToImport: mappedContacts,
      );
      return ImportPreparationResult.ready;
    } catch (e) {
      state = ImportContactsState(
        status: ImportContactsStatus.error,
        error: ImportContactsError.importFailed,
        importFailureDetail: e.toString(),
      );
      return ImportPreparationResult.failed;
    }
  }

  Future<ImportPreparationResult> prepareFileContacts({
    String? password,
    bool pickFile = false,
  }) async {
    if (pickFile) {
      _pickedImportFile = null;
      _fileContactsWithPhotos = const [];
    }
    state = const ImportContactsState(status: ImportContactsStatus.preparing);

    final fileDataSource = ref.read(contactFileImportDataSourceProvider);

    try {
      final pickedFile =
          _pickedImportFile ?? await fileDataSource.pickImportFile();
      if (pickedFile == null) {
        state = const ImportContactsState();
        return ImportPreparationResult.cancelled;
      }
      _pickedImportFile = pickedFile;

      final contacts = await fileDataSource.parsePickedFile(
        pickedFile,
        password: password,
      );
      _fileContactsWithPhotos = contacts;
      state = ImportContactsState(
        status: ImportContactsStatus.idle,
        contactsToImport: contacts.map((entry) => entry.contact).toList(),
      );
      return ImportPreparationResult.ready;
    } on ContactFileImportException catch (e) {
      if (e.error == ContactFileImportError.userCancelled) {
        state = const ImportContactsState();
        return ImportPreparationResult.cancelled;
      }
      if (e.error == ContactFileImportError.encryptedArchiveNeedsPassword) {
        state = const ImportContactsState(
          status: ImportContactsStatus.awaitingPassword,
        );
        return ImportPreparationResult.passwordRequired;
      }
      state = ImportContactsState(
        status: e.error == ContactFileImportError.noContactsFound
            ? ImportContactsStatus.noContacts
            : ImportContactsStatus.error,
        error: _mapFileImportError(e.error),
        importFailureDetail: e.detail,
      );
      return ImportPreparationResult.failed;
    } catch (e) {
      state = ImportContactsState(
        status: ImportContactsStatus.error,
        error: ImportContactsError.importFailed,
        importFailureDetail: e.toString(),
      );
      return ImportPreparationResult.failed;
    }
  }

  Future<void> importAllContacts() async {
    if (state.contactsToImport.isEmpty) return;

    state = state.copyWith(
      status: ImportContactsStatus.importing,
      importedCount: 0,
      skippedCount: 0,
    );

    try {
      final imageStorage = ref.read(imageStorageProvider);
      final contactsRepository = ref.read(contactsRepositoryProvider);

      final List<Contact> contactsToImport;
      final dataSource = ref.read(deviceContactsDataSourceProvider);

      if (_pickedImportFile == null) {
        final contactsWithPhotos = await dataSource.fetchContactsWithPhotos();
        contactsToImport = await _buildContactsFromDeviceEntries(
          contactsWithPhotos,
          imageStorage: imageStorage,
        );
      } else {
        contactsToImport = await _buildContactsFromFileEntries(
          _fileContactsWithPhotos,
          imageStorage: imageStorage,
        );
      }

      final result =
          await contactsRepository?.batchImport(contactsToImport) ??
          (imported: 0, skipped: 0);

      // Invalidate the contacts list so the UI reacts immediately
      ref.invalidate(contactsProvider);
      ref.read(duplicateGroupsRefreshProvider.notifier).schedule(
        delay: const Duration(milliseconds: 1000),
      );

      state = state.copyWith(
        status: ImportContactsStatus.success,
        importedCount: result.imported,
        skippedCount: result.skipped,
        error: null,
        importFailureDetail: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: ImportContactsStatus.error,
        error: ImportContactsError.importFailed,
        importFailureDetail: e.toString(),
      );
    }
  }

  Future<List<Contact>> _buildContactsFromDeviceEntries(
    List<dynamic> entries, {
    required dynamic imageStorage,
  }) async {
    final contacts = <Contact>[];
    for (var i = 0; i < entries.length; i++) {
      final entry = entries[i];
      var contact = entry.contact;
      if (imageStorage != null && entry.photoBytes != null) {
        try {
          final compressed = await FlutterImageCompress.compressWithList(
            entry.photoBytes!,
            minWidth: 800,
            minHeight: 800,
            quality: 90,
            format: CompressFormat.jpeg,
          );
          final filename = await imageStorage.saveImage(contact.id, compressed);
          contact = contact.copyWith(imageFilename: filename);
        } catch (_) {}
      }
      contacts.add(contact);
      if (i % 25 == 0) {
        await Future<void>.delayed(Duration.zero);
      }
    }
    return contacts;
  }

  Future<List<Contact>> _buildContactsFromFileEntries(
    List<dynamic> entries, {
    required dynamic imageStorage,
  }) async {
    final contacts = <Contact>[];
    for (var i = 0; i < entries.length; i++) {
      final entry = entries[i];
      var contact = entry.contact;
      final photoBytes = entry.photoBytes;
      if (imageStorage != null && photoBytes != null && photoBytes.isNotEmpty) {
        try {
          final compressed = await FlutterImageCompress.compressWithList(
            Uint8List.fromList(photoBytes),
            minWidth: 800,
            minHeight: 800,
            quality: 90,
            format: CompressFormat.jpeg,
          );
          final filename = await imageStorage.saveImage(contact.id, compressed);
          contact = contact.copyWith(imageFilename: filename);
        } catch (_) {}
      }
      contacts.add(contact);
      if (i % 25 == 0) {
        await Future<void>.delayed(Duration.zero);
      }
    }
    return contacts;
  }

  void reset() {
    _pickedImportFile = null;
    _fileContactsWithPhotos = const [];
    state = const ImportContactsState();
  }

  ImportContactsError _mapFileImportError(ContactFileImportError error) {
    return switch (error) {
      ContactFileImportError.userCancelled => ImportContactsError.importFailed,
      ContactFileImportError.unsupportedFileType =>
        ImportContactsError.unsupportedFileType,
      ContactFileImportError.invalidFile => ImportContactsError.invalidFile,
      ContactFileImportError.encryptedArchiveNeedsPassword =>
        ImportContactsError.wrongArchivePassword,
      ContactFileImportError.incorrectPassword =>
        ImportContactsError.wrongArchivePassword,
      ContactFileImportError.noVcfInArchive =>
        ImportContactsError.noVcfInArchive,
      ContactFileImportError.noContactsFound => ImportContactsError.noContacts,
    };
  }
}
