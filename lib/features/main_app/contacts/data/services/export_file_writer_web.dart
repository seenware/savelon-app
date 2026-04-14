// lib/features/main_app/contacts/data/services/export_file_writer_web.dart

import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

Future<String> writeExportFile({
  required Uint8List bytes,
  required String baseName,
  required String fileExtension,
  required bool isZip,
}) async {
  await FileSaver.instance.saveFile(
    name: baseName,
    bytes: bytes,
    fileExtension: fileExtension,
    mimeType: isZip ? MimeType.zip : MimeType.custom,
    customMimeType: isZip ? null : 'text/vcard',
  );
  return '';
}
