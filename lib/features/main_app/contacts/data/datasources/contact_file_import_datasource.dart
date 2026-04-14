import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';

class FileImportContactWithPhoto {
  final Contact contact;
  final List<int>? photoBytes;

  const FileImportContactWithPhoto({required this.contact, this.photoBytes});
}

enum ContactFileImportError {
  userCancelled,
  unsupportedFileType,
  invalidFile,
  encryptedArchiveNeedsPassword,
  incorrectPassword,
  noVcfInArchive,
  noContactsFound,
}

class ContactFileImportException implements Exception {
  final ContactFileImportError error;
  final String? detail;

  const ContactFileImportException(this.error, [this.detail]);
}

class PickedContactImportFile {
  final String name;
  final List<int> bytes;

  const PickedContactImportFile({required this.name, required this.bytes});

  String get extension {
    final dot = name.lastIndexOf('.');
    if (dot < 0) return '';
    return name.substring(dot + 1).toLowerCase();
  }
}

abstract class ContactFileImportDataSource {
  Future<PickedContactImportFile?> pickImportFile();

  Future<List<FileImportContactWithPhoto>> parsePickedFile(
    PickedContactImportFile file, {
    String? password,
  });
}
