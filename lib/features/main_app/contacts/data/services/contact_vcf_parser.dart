import 'dart:convert';

import 'package:contacts/features/main_app/contacts/domain/entities/address.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/link.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import 'package:uuid/uuid.dart';

class ParsedVcfContact {
  final Contact contact;
  final List<int>? photoBytes;

  const ParsedVcfContact({required this.contact, this.photoBytes});
}

class ContactVcfParser {
  ContactVcfParser._();

  static final _uuid = const Uuid();

  static List<ParsedVcfContact> parse(String rawText) {
    final unfolded = _unfold(rawText);
    final lines = unfolded.split('\n').map((line) => line.trimRight()).toList();
    final cards = <List<String>>[];
    List<String>? current;

    for (final line in lines) {
      final upper = line.toUpperCase();
      if (upper == 'BEGIN:VCARD') {
        current = ['BEGIN:VCARD'];
        continue;
      }
      if (current == null) continue;
      current.add(line);
      if (upper == 'END:VCARD') {
        cards.add(current);
        current = null;
      }
    }

    final contacts = cards
        .map(_parseCard)
        .whereType<ParsedVcfContact>()
        .toList();
    return contacts;
  }

  static String _unfold(String text) {
    final normalized = text.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    return normalized.replaceAllMapped(RegExp(r'\n[ \t]'), (_) => '');
  }

  static ParsedVcfContact? _parseCard(List<String> lines) {
    String prefix = '';
    String firstName = '';
    String middleName = '';
    String lastName = '';
    String suffix = '';
    String nickname = '';
    String company = '';
    String department = '';
    String jobTitle = '';
    String note = '';
    List<int>? photoBytes;
    final phones = <Phone>[];
    final emails = <Email>[];
    final addresses = <Address>[];
    final links = <Link>[];

    for (final line in lines) {
      final colonIndex = line.indexOf(':');
      if (colonIndex <= 0) continue;
      final keyPart = line.substring(0, colonIndex);
      final valuePart = _unescape(line.substring(colonIndex + 1));
      final keyUpper = keyPart.toUpperCase();
      final property = keyUpper.split(';').first;

      switch (property) {
        case 'N':
          final parts = valuePart.split(';');
          lastName = _part(parts, 0);
          firstName = _part(parts, 1);
          middleName = _part(parts, 2);
          prefix = _part(parts, 3);
          suffix = _part(parts, 4);
          break;
        case 'FN':
          if (firstName.isEmpty &&
              lastName.isEmpty &&
              valuePart.trim().isNotEmpty) {
            final chunks = valuePart.trim().split(RegExp(r'\s+'));
            firstName = chunks.first;
            if (chunks.length > 1) {
              lastName = chunks.sublist(1).join(' ');
            }
          }
          break;
        case 'NICKNAME':
          nickname = valuePart.trim();
          break;
        case 'ORG':
          company = valuePart.split(';').first.trim();
          break;
        case 'X-DEPARTMENT':
          department = valuePart.trim();
          break;
        case 'TITLE':
          jobTitle = valuePart.trim();
          break;
        case 'TEL':
          final number = valuePart.trim();
          if (number.isNotEmpty) {
            phones.add(
              Phone(label: _extractTypeLabel(keyPart), number: number),
            );
          }
          break;
        case 'EMAIL':
          final address = valuePart.trim();
          if (address.isNotEmpty) {
            emails.add(
              Email(label: _extractTypeLabel(keyPart), address: address),
            );
          }
          break;
        case 'ADR':
          final address = _addressValue(keyPart, valuePart);
          if (address.isNotEmpty) {
            addresses.add(
              Address(label: _extractTypeLabel(keyPart), address: address),
            );
          }
          break;
        case 'URL':
          final url = valuePart.trim();
          if (url.isNotEmpty) {
            links.add(Link(label: 'Website', url: url));
          }
          break;
        case 'NOTE':
          note = valuePart;
          break;
        case 'PHOTO':
          photoBytes = _tryDecodePhoto(valuePart);
          break;
      }
    }

    final hasAnyMainField =
        firstName.trim().isNotEmpty ||
        lastName.trim().isNotEmpty ||
        company.trim().isNotEmpty ||
        phones.isNotEmpty ||
        emails.isNotEmpty;
    if (!hasAnyMainField) return null;

    return ParsedVcfContact(
      contact: Contact(
        id: _uuid.v4(),
        prefix: prefix.trim(),
        firstName: firstName.trim(),
        middleName: middleName.trim(),
        lastName: lastName.trim(),
        suffix: suffix.trim(),
        nickname: nickname.trim(),
        company: company.trim(),
        department: department.trim(),
        jobTitle: jobTitle.trim(),
        phones: phones,
        emails: emails,
        addresses: addresses,
        links: links,
        dates: const [],
        note: note.trim(),
      ),
      photoBytes: photoBytes,
    );
  }

  static String _addressValue(String keyPart, String valuePart) {
    final labelMatch = RegExp(
      r'LABEL=([^;]+)',
      caseSensitive: false,
    ).firstMatch(keyPart);
    if (labelMatch != null) {
      return _unescape(labelMatch.group(1) ?? '').trim();
    }

    final parts = valuePart
        .split(';')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty);
    return parts.join(', ');
  }

  static String _extractTypeLabel(String keyPart) {
    final typeMatch = RegExp(
      r'TYPE=([^;:]+)',
      caseSensitive: false,
    ).firstMatch(keyPart);
    if (typeMatch == null) return 'Other';
    final firstType = (typeMatch.group(1) ?? '')
        .split(',')
        .first
        .trim()
        .toLowerCase();
    if (firstType.isEmpty || firstType == 'internet' || firstType == 'voice') {
      return 'Other';
    }
    return '${firstType[0].toUpperCase()}${firstType.substring(1)}';
  }

  static String _unescape(String value) {
    return value
        .replaceAll(r'\n', '\n')
        .replaceAll(r'\N', '\n')
        .replaceAll(r'\,', ',')
        .replaceAll(r'\;', ';')
        .replaceAll(r'\\', '\\');
  }

  static String _part(List<String> parts, int index) {
    if (index >= parts.length) return '';
    return _unescape(parts[index]);
  }

  static List<int>? _tryDecodePhoto(String valuePart) {
    final compact = valuePart.replaceAll(RegExp(r'\s+'), '');
    if (compact.isEmpty) return null;
    try {
      return base64.decode(compact);
    } catch (_) {
      return null;
    }
  }
}
