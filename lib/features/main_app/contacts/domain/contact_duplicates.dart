import 'dart:math';

import 'duplicate_thresholds.dart';
import 'duplicate_scoring_policy.dart';
import 'entities/contact.dart';

class DuplicateConfidence {
  final double score;
  final List<String> signals;

  const DuplicateConfidence({
    required this.score,
    required this.signals,
  });

  String get level {
    if (score >= DuplicateThresholds.highConfidenceThreshold) return 'High';
    if (score >= DuplicateThresholds.mediumConfidenceThreshold) return 'Medium';
    return 'Low';
  }
}

class DuplicatePair {
  final Contact left;
  final Contact right;
  final DuplicateConfidence confidence;
  final bool isStrongEdge;

  const DuplicatePair({
    required this.left,
    required this.right,
    required this.confidence,
    required this.isStrongEdge,
  });
}

class DuplicateGroup {
  final String id;
  final List<Contact> contacts;
  final double topScore;
  final List<DuplicatePair> pairs;

  const DuplicateGroup({
    required this.id,
    required this.contacts,
    required this.topScore,
    required this.pairs,
  });
}

class ContactDuplicateAnalyzer {
  final DuplicateScoringPolicy scoringPolicy;

  const ContactDuplicateAnalyzer({
    this.scoringPolicy = const DuplicateScoringPolicy(),
  });

  List<DuplicateGroup> buildGroups(
    List<Contact> contacts, {
    double threshold = DuplicateThresholds.groupingThreshold,
  }) {
    if (contacts.length < 2) return const [];

    final pairs = <DuplicatePair>[];
    final graph = <String, Set<String>>{};
    final byId = <String, Contact>{for (final c in contacts) c.id: c};
    final evidenceById = <String, ContactDuplicateEvidence>{
      for (final contact in contacts) contact.id: scoringPolicy.buildEvidence(contact),
    };
    final pairScoresById = <String, ({double sum, int count})>{};

    for (var i = 0; i < contacts.length; i++) {
      for (var j = i + 1; j < contacts.length; j++) {
        final left = contacts[i];
        final right = contacts[j];
        final leftEvidence = evidenceById[left.id];
        final rightEvidence = evidenceById[right.id];
        if (leftEvidence == null || rightEvidence == null) {
          continue;
        }
        // Prefilter intentionally disabled: we must preserve full detector recall.
        final confidence = scorePair(
          left,
          right,
          leftEvidence: leftEvidence,
          rightEvidence: rightEvidence,
        );
        final passThreshold = confidence.score >= threshold;
        final passPolicy = scoringPolicy.isPotentialDuplicate(confidence.score);
        if (!passThreshold || !passPolicy) {
          continue;
        }

        pairs.add(
          DuplicatePair(
            left: left,
            right: right,
            confidence: confidence,
            isStrongEdge: confidence.score >= DuplicateThresholds.strongEdgeThreshold,
          ),
        );
        graph.putIfAbsent(left.id, () => <String>{}).add(right.id);
        graph.putIfAbsent(right.id, () => <String>{}).add(left.id);
        final leftScore = pairScoresById[left.id] ?? (sum: 0.0, count: 0);
        pairScoresById[left.id] = (
          sum: leftScore.sum + confidence.score,
          count: leftScore.count + 1,
        );
        final rightScore = pairScoresById[right.id] ?? (sum: 0.0, count: 0);
        pairScoresById[right.id] = (
          sum: rightScore.sum + confidence.score,
          count: rightScore.count + 1,
        );
      }
    }

    final groups = <DuplicateGroup>[];
    final visited = <String>{};
    for (final contact in contacts) {
      if (!graph.containsKey(contact.id) || visited.contains(contact.id)) continue;

      final componentIds = <String>[];
      final stack = <String>[contact.id];
      visited.add(contact.id);

      while (stack.isNotEmpty) {
        final current = stack.removeLast();
        componentIds.add(current);
        for (final next in graph[current] ?? const <String>{}) {
          if (visited.add(next)) stack.add(next);
        }
      }

      if (componentIds.length < 2) continue;
      final componentSet = componentIds.toSet();
      final componentPairs = pairs
          .where(
            (pair) =>
                componentSet.contains(pair.left.id) &&
                componentSet.contains(pair.right.id),
          )
          .toList();
      final topScore = componentPairs.isEmpty
          ? threshold
          : componentPairs
              .map((pair) => pair.confidence.score)
              .reduce(max);

      final componentContacts = componentIds
          .map((id) => byId[id])
          .whereType<Contact>()
          .toList()
        ..sort((a, b) {
          final bScore = pairScoresById[b.id];
          final aScore = pairScoresById[a.id];
          final bAvg = bScore == null || bScore.count == 0
              ? 0.0
              : bScore.sum / bScore.count;
          final aAvg = aScore == null || aScore.count == 0
              ? 0.0
              : aScore.sum / aScore.count;
          final scoreCmp =
              bAvg.compareTo(aAvg);
          if (scoreCmp != 0) return scoreCmp;
          return a.fullName.compareTo(b.fullName);
        });

      groups.add(
        DuplicateGroup(
          id: _stableGroupId(componentIds),
          contacts: componentContacts,
          topScore: topScore,
          pairs: componentPairs,
        ),
      );
    }

    groups.sort((a, b) => b.topScore.compareTo(a.topScore));
    return groups;
  }

  DuplicateConfidence scorePair(
    Contact left,
    Contact right, {
    ContactDuplicateEvidence? leftEvidence,
    ContactDuplicateEvidence? rightEvidence,
  }) {
    final result = leftEvidence != null && rightEvidence != null
        ? scoringPolicy.scoreWithEvidence(leftEvidence, rightEvidence)
        : scoringPolicy.score(left, right);
    return DuplicateConfidence(score: result.score, signals: result.signals);
  }

  String _stableGroupId(List<String> componentIds) {
    final sortedIds = [...componentIds]..sort();
    return sortedIds.join('_');
  }
}
