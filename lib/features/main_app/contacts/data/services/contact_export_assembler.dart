// lib/features/main_app/contacts/data/services/contact_export_assembler.dart

import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:contacts/features/main_app/contacts/data/services/contact_vcf_builder.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';

/// Assembles export bytes: plain UTF-8 [.vcf] or password-protected [.zip].
class ContactExportAssembler {
  ContactExportAssembler._();

  static const vcfEntryName = 'contacts.vcf';

  static Future<Uint8List> buildVcfBytes(
    List<Contact> contacts,
    Future<Uint8List?> Function(String contactId, String imageFilename)
    loadPhoto,
  ) async {
    final text = await ContactVcfBuilder.buildBundle(contacts, loadPhoto);
    return Uint8List.fromList(utf8.encode(text));
  }

  static Uint8List buildPasswordProtectedZip(
    Uint8List vcfBytes,
    String password,
  ) {
    final archive = Archive()..add(ArchiveFile.bytes(vcfEntryName, vcfBytes));
    return ZipEncoder(password: password).encodeBytes(archive);
  }
}
