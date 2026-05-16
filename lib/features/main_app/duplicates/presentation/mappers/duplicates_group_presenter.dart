import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/l10n/app_localizations.dart';

class DuplicatesGroupPresenter {
  const DuplicatesGroupPresenter();

  String subtitle(AppLocalizations l10n, Contact contact) {
    if (contact.emails.isNotEmpty) return contact.emails.first.address;
    if (contact.phones.isNotEmpty) return contact.phones.first.number;
    if (contact.company.isNotEmpty) return contact.company;
    return l10n.duplicatesSubtitlePlaceholder;
  }

  List<String> conflictPreview(AppLocalizations l10n, List<Contact> contacts) {
    final previews = <String>[];
    final fields = <String, List<String>>{
      l10n.fieldLabelName: contacts.map((c) => c.fullName).toList(),
      l10n.fieldLabelCompany: contacts.map((c) => c.company).toList(),
      l10n.fieldLabelPhone: contacts.expand((c) => c.phones.map((p) => p.number)).toList(),
      l10n.fieldLabelEmail: contacts.expand((c) => c.emails.map((e) => e.address)).toList(),
    };

    fields.forEach((field, values) {
      final variants = values
          .map((v) => v.trim().toLowerCase())
          .where((v) => v.isNotEmpty)
          .toSet()
          .length;
      if (variants > 1) {
        previews.add(l10n.duplicatesConflictFieldVariants(field, variants));
      }
    });
    return previews.isEmpty
        ? <String>[l10n.duplicatesConflictMostlyIdentical]
        : previews;
  }

  List<String> topSignals(DuplicateGroup group, {int limit = 3}) {
    if (group.pairs.isEmpty) return const [];
    final topPair = group.pairs.reduce(
      (a, b) => a.confidence.score >= b.confidence.score ? a : b,
    );
    return topPair.confidence.signals.take(limit).toList();
  }
}
