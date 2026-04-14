import 'entities/address.dart';
import 'entities/contact.dart';
import 'entities/date.dart' as cdate;
import 'entities/email.dart';
import 'entities/link.dart';
import 'entities/phone.dart';

class ContactMergePolicy {
  const ContactMergePolicy();

  int completenessScore(Contact contact) {
    var score = 0;
    for (final value in [
      contact.prefix,
      contact.firstName,
      contact.middleName,
      contact.lastName,
      contact.suffix,
      contact.nickname,
      contact.company,
      contact.department,
      contact.jobTitle,
      contact.note,
    ]) {
      if (value.trim().isNotEmpty) score += 1;
    }
    score += contact.phones.length;
    score += contact.emails.length;
    score += contact.addresses.length;
    score += contact.links.length;
    score += contact.dates.length;
    if (contact.imageFilename != null && contact.imageFilename!.isNotEmpty) {
      score += 1;
    }
    return score;
  }

  List<Contact> sortByCompleteness(List<Contact> contacts) {
    final sorted = [...contacts];
    sorted.sort((a, b) => completenessScore(b).compareTo(completenessScore(a)));
    return sorted;
  }

  Contact mergeAsDraft(List<Contact> contacts, {String draftId = ''}) {
    if (contacts.isEmpty) {
      throw ArgumentError('Cannot merge an empty contact list');
    }

    final sorted = sortByCompleteness(contacts);

    final imageSource = sorted.firstWhere(
      (c) => c.imageFilename != null && c.imageFilename!.isNotEmpty,
      orElse: () => sorted.first,
    );

    // IMPORTANT: For create-mode merge we later copy the stored image by
    // (sourceContactId=image draft id, sourceFilename=imageFilename).
    // Therefore `id` and `imageFilename` must originate from the same contact.
    final mergedId = draftId.isNotEmpty ? draftId : imageSource.id;
    final mergedImageFilename = imageSource.imageFilename;

    return Contact(
      id: mergedId,
      prefix: _mergeScalar(sorted.map((c) => c.prefix)),
      firstName: _mergeScalar(sorted.map((c) => c.firstName)),
      middleName: _mergeScalar(sorted.map((c) => c.middleName)),
      lastName: _mergeScalar(sorted.map((c) => c.lastName)),
      suffix: _mergeScalar(sorted.map((c) => c.suffix)),
      nickname: _mergeScalar(sorted.map((c) => c.nickname)),
      company: _mergeScalar(sorted.map((c) => c.company)),
      department: _mergeScalar(sorted.map((c) => c.department)),
      jobTitle: _mergeScalar(sorted.map((c) => c.jobTitle)),
      note: _mergeScalar(sorted.map((c) => c.note)),
      phones: _mergePhones(sorted),
      emails: _mergeEmails(sorted),
      addresses: _mergeAddresses(sorted),
      links: _mergeLinks(sorted),
      dates: _mergeDates(sorted),
      imageFilename: mergedImageFilename,
    );
  }

  String _mergeScalar(Iterable<String> rawValues) {
    final values = rawValues
        .map((v) => v.trim())
        .where((v) => v.isNotEmpty)
        .toList();
    if (values.isEmpty) return '';
    final unique = <String>[];
    for (final value in values) {
      if (!unique.any((existing) => _eq(existing, value))) unique.add(value);
    }
    if (unique.length == 1) return unique.first;
    return '${unique.first} ${unique.skip(1).map((v) => '($v)').join(' ')}';
  }

  List<Phone> _mergePhones(List<Contact> contacts) {
    final merged = <Phone>[];
    final seen = <String>{};
    for (final contact in contacts) {
      for (final phone in contact.phones) {
        final key = _normalizeDigits(phone.number);
        if (key.isEmpty || seen.add(key)) {
          merged.add(phone);
        }
      }
    }
    return merged;
  }

  List<Email> _mergeEmails(List<Contact> contacts) {
    final merged = <Email>[];
    final seen = <String>{};
    for (final contact in contacts) {
      for (final email in contact.emails) {
        final key = email.address.trim().toLowerCase();
        if (key.isEmpty || seen.add(key)) {
          merged.add(email);
        }
      }
    }
    return merged;
  }

  List<Address> _mergeAddresses(List<Contact> contacts) {
    final merged = <Address>[];
    final seen = <String>{};
    for (final contact in contacts) {
      for (final address in contact.addresses) {
        final key = address.address.trim().toLowerCase();
        if (key.isEmpty || seen.add(key)) {
          merged.add(address);
        }
      }
    }
    return merged;
  }

  List<Link> _mergeLinks(List<Contact> contacts) {
    final merged = <Link>[];
    final seen = <String>{};
    for (final contact in contacts) {
      for (final link in contact.links) {
        final key = link.url.trim().toLowerCase();
        if (key.isEmpty || seen.add(key)) {
          merged.add(link);
        }
      }
    }
    return merged;
  }

  List<cdate.Date> _mergeDates(List<Contact> contacts) {
    final merged = <cdate.Date>[];
    final seen = <String>{};
    for (final contact in contacts) {
      for (final date in contact.dates) {
        final key =
            '${date.label.trim().toLowerCase()}|${date.date.toIso8601String()}';
        if (seen.add(key)) merged.add(date);
      }
    }
    return merged;
  }

  String _normalizeDigits(String value) => value.replaceAll(RegExp(r'\D'), '');

  bool _eq(String a, String b) => a.toLowerCase() == b.toLowerCase();
}
