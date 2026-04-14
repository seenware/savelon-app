import 'package:contacts/core/database/database_service.dart';

class DuplicateCacheSnapshot {
  final List<Map<String, Object?>> groups;
  final List<Map<String, Object?>> members;
  final List<Map<String, Object?>> pairs;

  const DuplicateCacheSnapshot({
    required this.groups,
    required this.members,
    required this.pairs,
  });
}

class DuplicateCachePayload {
  final int contactsRevision;
  final String policyVersion;
  final double threshold;
  final List<Map<String, Object?>> groups;
  final List<Map<String, Object?>> members;
  final List<Map<String, Object?>> pairs;

  const DuplicateCachePayload({
    required this.contactsRevision,
    required this.policyVersion,
    required this.threshold,
    required this.groups,
    required this.members,
    required this.pairs,
  });
}

class DuplicateCacheDataSource {
  final DatabaseService _database;

  const DuplicateCacheDataSource(this._database);

  Future<int> getContactsRevision() => _database.getContactsRevision();

  Future<DuplicateCacheSnapshot?> read({
    required int contactsRevision,
    required String policyVersion,
    required double threshold,
  }) async {
    final cached = await _database.readDuplicateCache(
      contactsRevision: contactsRevision,
      policyVersion: policyVersion,
      threshold: threshold,
    );
    if (cached == null) return null;
    return DuplicateCacheSnapshot(
      groups: cached.groups,
      members: cached.members,
      pairs: cached.pairs,
    );
  }

  Future<void> replace(DuplicateCachePayload payload) {
    return _database.replaceDuplicateCache(
      contactsRevision: payload.contactsRevision,
      policyVersion: payload.policyVersion,
      threshold: payload.threshold,
      groups: payload.groups,
      members: payload.members,
      pairs: payload.pairs,
    );
  }
}
