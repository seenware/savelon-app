import 'dart:convert';

import 'package:contacts/features/main_app/contacts/data/datasources/duplicate_cache_datasource.dart';
import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/domain/duplicate_thresholds.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';

class DuplicateCacheMapper {
  const DuplicateCacheMapper();

  List<DuplicateGroup> toDomain(
    DuplicateCacheSnapshot snapshot,
    Map<String, Contact> contactsById,
  ) {
    final memberByGroup = <String, List<Map<String, Object?>>>{};
    for (final row in snapshot.members) {
      final groupId = row['group_id'] as String? ?? '';
      memberByGroup.putIfAbsent(groupId, () => []).add(row);
    }

    final pairByGroup = <String, List<Map<String, Object?>>>{};
    for (final row in snapshot.pairs) {
      final groupId = row['group_id'] as String? ?? '';
      pairByGroup.putIfAbsent(groupId, () => []).add(row);
    }

    return snapshot.groups.map((row) {
      final groupId = row['group_id'] as String? ?? '';
      final members = [...(memberByGroup[groupId] ?? const [])]
        ..sort((a, b) {
          final left = a['rank'] as int? ?? 0;
          final right = b['rank'] as int? ?? 0;
          return left.compareTo(right);
        });

      final contacts = members
          .map((member) => contactsById[member['contact_id'] as String? ?? ''])
          .whereType<Contact>()
          .toList();

      final pairs = (pairByGroup[groupId] ?? const []).map((pairRow) {
        final leftId = pairRow['left_contact_id'] as String? ?? '';
        final rightId = pairRow['right_contact_id'] as String? ?? '';
        final left = contactsById[leftId];
        final right = contactsById[rightId];
        if (left == null || right == null) return null;
        return DuplicatePair(
          left: left,
          right: right,
          confidence: DuplicateConfidence(
            score: (pairRow['score'] as num?)?.toDouble() ?? 0,
            signals: (jsonDecode(pairRow['signals_json'] as String? ?? '[]')
                    as List<dynamic>)
                .whereType<String>()
                .toList(),
          ),
          isStrongEdge: (pairRow['is_strong_edge'] as int? ?? 0) == 1,
        );
      }).whereType<DuplicatePair>().toList();

      return DuplicateGroup(
        id: groupId,
        contacts: contacts,
        topScore: (row['top_score'] as num?)?.toDouble() ?? 0,
        pairs: pairs,
      );
    }).toList();
  }

  DuplicateCachePayload toPayload({
    required List<DuplicateGroup> groups,
    required int contactsRevision,
  }) {
    return DuplicateCachePayload(
      contactsRevision: contactsRevision,
      policyVersion: DuplicateThresholds.policyVersion,
      threshold: DuplicateThresholds.groupingThreshold,
      groups: _groupsRows(groups, contactsRevision),
      members: _membersRows(groups),
      pairs: _pairsRows(groups),
    );
  }

  List<Map<String, Object?>> _groupsRows(
    List<DuplicateGroup> groups,
    int revision,
  ) {
    return groups
        .map(
          (group) => {
            'group_id': group.id,
            'contacts_revision': revision,
            'policy_version': DuplicateThresholds.policyVersion,
            'threshold': DuplicateThresholds.groupingThreshold,
            'top_score': group.topScore,
          },
        )
        .toList();
  }

  List<Map<String, Object?>> _membersRows(List<DuplicateGroup> groups) {
    final rows = <Map<String, Object?>>[];
    for (final group in groups) {
      for (var i = 0; i < group.contacts.length; i++) {
        rows.add({
          'group_id': group.id,
          'contact_id': group.contacts[i].id,
          'rank': i,
        });
      }
    }
    return rows;
  }

  List<Map<String, Object?>> _pairsRows(List<DuplicateGroup> groups) {
    final rows = <Map<String, Object?>>[];
    for (final group in groups) {
      for (final pair in group.pairs) {
        rows.add({
          'group_id': group.id,
          'left_contact_id': pair.left.id,
          'right_contact_id': pair.right.id,
          'score': pair.confidence.score,
          'is_strong_edge': pair.isStrongEdge ? 1 : 0,
          'signals_json': jsonEncode(pair.confidence.signals),
        });
      }
    }
    return rows;
  }
}
