// lib/features/main_app/contacts/data/services/contact_vcf_builder.dart

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:contacts/features/main_app/contacts/domain/constants/field_types.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/date.dart'
    as ce;

/// Builds vCard 3.0 text for app contacts (export only; lives in data layer).
class ContactVcfBuilder {
  ContactVcfBuilder._();

  static Future<String> buildBundle(
    List<Contact> contacts,
    Future<Uint8List?> Function(String contactId, String imageFilename)
    loadPhoto,
  ) async {
    final out = StringBuffer();
    for (var i = 0; i < contacts.length; i++) {
      out.write(await buildVcard(contacts[i], loadPhoto));
      if (i < contacts.length - 1) {
        out.write('\r\n');
      }
    }
    return out.toString();
  }

  static Future<String> buildVcard(
    Contact c,
    Future<Uint8List?> Function(String contactId, String imageFilename)
    loadPhoto,
  ) async {
    final lines = <String>['BEGIN:VCARD', 'VERSION:3.0'];

    final fn = c.fullName.trim();
    if (fn.isNotEmpty) {
      lines.addAll(_foldProperty('FN:${_escape(fn)}'));
    }

    lines.addAll(
      _foldProperty(
        'N:${_escape(c.lastName)};${_escape(c.firstName)};${_escape(c.middleName)};${_escape(c.prefix)};${_escape(c.suffix)}',
      ),
    );

    if (c.nickname.trim().isNotEmpty) {
      lines.addAll(_foldProperty('NICKNAME:${_escape(c.nickname.trim())}'));
    }

    if (c.company.trim().isNotEmpty) {
      lines.addAll(_foldProperty('ORG:${_escape(c.company.trim())}'));
    }
    if (c.department.trim().isNotEmpty) {
      lines.addAll(
        _foldProperty('X-DEPARTMENT:${_escape(c.department.trim())}'),
      );
    }
    if (c.jobTitle.trim().isNotEmpty) {
      lines.addAll(_foldProperty('TITLE:${_escape(c.jobTitle.trim())}'));
    }

    for (final p in c.phones) {
      final type = _phoneVcardType(p.label);
      final num = p.number.trim();
      if (num.isEmpty) continue;
      lines.addAll(_foldProperty('TEL;TYPE=$type:${_escape(num)}'));
    }

    for (final e in c.emails) {
      final type = _emailVcardType(e.label);
      final addr = e.address.trim();
      if (addr.isEmpty) continue;
      lines.addAll(_foldProperty('EMAIL;TYPE=INTERNET,$type:${_escape(addr)}'));
    }

    for (final a in c.addresses) {
      final addr = a.address.trim();
      if (addr.isEmpty) continue;
      final type = _addressVcardType(a.label);
      lines.addAll(
        _foldProperty('ADR;TYPE=$type;LABEL=${_escape(addr)}:;;;;;;'),
      );
    }

    for (final l in c.links) {
      final url = l.url.trim();
      if (url.isEmpty) continue;
      lines.addAll(_foldProperty('URL:${_escape(url)}'));
    }

    for (final d in c.dates) {
      final line = _dateProperty(d);
      if (line != null) {
        lines.addAll(_foldProperty(line));
      }
    }

    final note = c.note.trim();
    if (note.isNotEmpty) {
      lines.addAll(_foldProperty('NOTE:${_escape(note)}'));
    }

    if (c.imageFilename != null && c.imageFilename!.isNotEmpty) {
      final bytes = await loadPhoto(c.id, c.imageFilename!);
      if (bytes != null && bytes.isNotEmpty) {
        final kind = _imageKind(bytes);
        final b64 = base64.encode(bytes);
        lines.addAll(_foldProperty('PHOTO;ENCODING=b;TYPE=$kind:$b64'));
      }
    }

    lines.add('END:VCARD');
    return lines.join('\r\n');
  }

  static String _imageKind(Uint8List bytes) {
    if (bytes.length >= 2 && bytes[0] == 0xff && bytes[1] == 0xd8) {
      return 'JPEG';
    }
    if (bytes.length >= 8 &&
        bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4e &&
        bytes[3] == 0x47) {
      return 'PNG';
    }
    return 'JPEG';
  }

  static String? _dateProperty(ce.Date d) {
    final y = d.date.year;
    final m = d.date.month;
    final day = d.date.day;
    final iso =
        '${y.toString().padLeft(4, '0')}'
        '${m.toString().padLeft(2, '0')}'
        '${day.toString().padLeft(2, '0')}';

    final label = d.label.trim().toLowerCase();
    if (label == ContactFieldTypes.date[1].toLowerCase()) {
      return 'BDAY:$iso';
    }
    final key = _sanitizeKey(d.label);
    if (key.isEmpty) {
      return 'X-CONTACT-DATE:$iso';
    }
    return 'X-CONTACT-DATE-$key:$iso';
  }

  static String _sanitizeKey(String label) {
    return label.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
  }

  static String _phoneVcardType(String label) {
    switch (label.toLowerCase()) {
      case 'mobile':
        return 'CELL,VOICE';
      case 'home':
        return 'HOME,VOICE';
      case 'work':
        return 'WORK,VOICE';
      case 'school':
        return 'WORK,VOICE';
      default:
        return 'VOICE';
    }
  }

  static String _emailVcardType(String label) {
    switch (label.toLowerCase()) {
      case 'personal':
        return 'HOME';
      case 'work':
        return 'WORK';
      case 'school':
        return 'WORK';
      default:
        return 'OTHER';
    }
  }

  static String _addressVcardType(String label) {
    switch (label) {
      case 'Home':
        return 'HOME';
      case 'Work':
        return 'WORK';
      case 'School':
        return 'WORK';
      case 'Birth':
        return 'HOME';
      default:
        return 'HOME';
    }
  }

  static String _escape(String s) {
    return s
        .replaceAll('\\', '\\\\')
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n')
        .replaceAll('\n', '\\n')
        .replaceAll(',', '\\,')
        .replaceAll(';', '\\;');
  }

  /// RFC 2425 folding uses octet limits (75 / 74) but chunks must remain valid UTF-8.
  static int _utf8SafeTake(List<int> bytes, int start, int maxBytes) {
    final remaining = bytes.length - start;
    if (remaining == 0) return 0;
    var len = min(maxBytes, remaining);
    while (len > 0) {
      try {
        utf8.decode(bytes.sublist(start, start + len));
        return len;
      } catch (_) {
        len--;
      }
    }
    throw FormatException(
      'vCard line contains invalid UTF-8 at byte offset $start',
    );
  }

  /// RFC 2425 folding (octet-based).
  static List<String> _foldProperty(String line) {
    final bytes = utf8.encode(line);
    const maxFirst = 75;
    const maxCont = 74;
    if (bytes.length <= maxFirst) {
      return [utf8.decode(bytes)];
    }
    final out = <String>[];
    var i = 0;
    var first = true;
    while (i < bytes.length) {
      final limit = first ? maxFirst : maxCont;
      final take = _utf8SafeTake(bytes, i, limit);
      final chunk = bytes.sublist(i, i + take);
      out.add(first ? utf8.decode(chunk) : ' ${utf8.decode(chunk)}');
      i += take;
      first = false;
    }
    return out;
  }
}
