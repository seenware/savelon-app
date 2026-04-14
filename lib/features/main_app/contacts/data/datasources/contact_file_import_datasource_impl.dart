import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:contacts/features/main_app/contacts/data/datasources/contact_file_import_datasource.dart';
import 'package:contacts/features/main_app/contacts/data/services/contact_vcf_parser.dart';
import 'package:file_picker/file_picker.dart';

class ContactFileImportDataSourceImpl implements ContactFileImportDataSource {
  @override
  Future<PickedContactImportFile?> pickImportFile() async {
    final picked = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: const ['vcf', 'zip'],
      withData: true,
    );
    if (picked == null || picked.files.isEmpty) return null;

    final file = picked.files.first;
    final bytes = file.bytes;
    if (bytes == null || bytes.isEmpty) {
      throw const ContactFileImportException(
        ContactFileImportError.invalidFile,
      );
    }

    return PickedContactImportFile(name: file.name, bytes: bytes);
  }

  @override
  Future<List<FileImportContactWithPhoto>> parsePickedFile(
    PickedContactImportFile file, {
    String? password,
  }) async {
    return switch (file.extension) {
      'vcf' => _parseVcfFile(file.bytes),
      'zip' => _parseZipFile(file.bytes, password: password),
      _ => throw const ContactFileImportException(
        ContactFileImportError.unsupportedFileType,
      ),
    };
  }

  List<FileImportContactWithPhoto> _parseVcfFile(List<int> bytes) {
    try {
      final text = utf8.decode(bytes, allowMalformed: true);
      final contacts = ContactVcfParser.parse(text)
          .map(
            (entry) => FileImportContactWithPhoto(
              contact: entry.contact,
              photoBytes: entry.photoBytes,
            ),
          )
          .toList();
      if (contacts.isEmpty) {
        throw const ContactFileImportException(
          ContactFileImportError.noContactsFound,
        );
      }
      return contacts;
    } catch (e) {
      if (e is ContactFileImportException) rethrow;
      throw const ContactFileImportException(
        ContactFileImportError.invalidFile,
      );
    }
  }

  List<FileImportContactWithPhoto> _parseZipFile(
    List<int> bytes, {
    String? password,
  }) {
    try {
      final archive = ZipDecoder().decodeBytes(
        Uint8List.fromList(bytes),
        password: password,
      );
      final vcfEntries = archive.files
          .where(
            (entry) => !entry.isFile
                ? false
                : entry.name.toLowerCase().endsWith('.vcf'),
          )
          .toList();

      if (vcfEntries.isEmpty) {
        throw const ContactFileImportException(
          ContactFileImportError.noVcfInArchive,
        );
      }

      final contacts = <FileImportContactWithPhoto>[];
      for (final entry in vcfEntries) {
        final text = utf8.decode(entry.content, allowMalformed: true);
        contacts.addAll(
          ContactVcfParser.parse(text).map(
            (parsed) => FileImportContactWithPhoto(
              contact: parsed.contact,
              photoBytes: parsed.photoBytes,
            ),
          ),
        );
      }

      if (contacts.isEmpty) {
        throw const ContactFileImportException(
          ContactFileImportError.noContactsFound,
        );
      }
      return contacts;
    } on ArchiveException catch (e) {
      final message = e.toString().toLowerCase();
      if (message.contains('password') || message.contains('encrypted')) {
        if (password == null || password.isEmpty) {
          throw const ContactFileImportException(
            ContactFileImportError.encryptedArchiveNeedsPassword,
          );
        }
        throw const ContactFileImportException(
          ContactFileImportError.incorrectPassword,
        );
      }
      throw ContactFileImportException(
        ContactFileImportError.invalidFile,
        e.toString(),
      );
    } catch (e) {
      final errorText = e.toString().toLowerCase();
      if (e is ContactFileImportException) rethrow;
      if (password != null &&
          password.isNotEmpty &&
          (errorText.contains('password error') ||
              errorText.contains('wrong password') ||
              errorText.contains('invalid password'))) {
        throw const ContactFileImportException(
          ContactFileImportError.incorrectPassword,
        );
      }
      if ((password == null || password.isEmpty) &&
          (errorText.contains('null check operator used on a null value') ||
              errorText.contains('password') ||
              errorText.contains('encrypted'))) {
        throw const ContactFileImportException(
          ContactFileImportError.encryptedArchiveNeedsPassword,
        );
      }
      throw ContactFileImportException(
        ContactFileImportError.invalidFile,
        e.toString(),
      );
    }
  }
}
