class DuplicatesCacheSchema {
  DuplicatesCacheSchema._();

  static const String appMetaTable = 'app_meta';
  static const String cacheGroupsTable = 'duplicate_groups_cache';
  static const String cacheMembersTable = 'duplicate_group_members_cache';
  static const String cachePairsTable = 'duplicate_pairs_cache';

  static const String metaContactsRevisionKey = 'contacts_revision';
  static const String metaCacheContactsRevisionKey =
      'duplicate_cache_contacts_revision';
  static const String metaPolicyVersionKey = 'duplicate_policy_version';
  static const String metaThresholdKey = 'duplicate_threshold';

  static const String createAppMetaTableSql = '''
    CREATE TABLE IF NOT EXISTS $appMetaTable (
      key TEXT PRIMARY KEY,
      value TEXT NOT NULL
    )
  ''';

  static const String createGroupsTableSql = '''
    CREATE TABLE IF NOT EXISTS $cacheGroupsTable (
      group_id TEXT PRIMARY KEY,
      contacts_revision INTEGER NOT NULL,
      policy_version TEXT NOT NULL,
      threshold REAL NOT NULL,
      top_score REAL NOT NULL
    )
  ''';

  static const String createMembersTableSql = '''
    CREATE TABLE IF NOT EXISTS $cacheMembersTable (
      group_id TEXT NOT NULL,
      contact_id TEXT NOT NULL,
      rank INTEGER NOT NULL,
      PRIMARY KEY (group_id, contact_id)
    )
  ''';

  static const String createPairsTableSql = '''
    CREATE TABLE IF NOT EXISTS $cachePairsTable (
      group_id TEXT NOT NULL,
      left_contact_id TEXT NOT NULL,
      right_contact_id TEXT NOT NULL,
      score REAL NOT NULL,
      is_strong_edge INTEGER NOT NULL,
      signals_json TEXT NOT NULL,
      PRIMARY KEY (group_id, left_contact_id, right_contact_id)
    )
  ''';

  static const String createGroupsRevisionIndexSql = '''
    CREATE INDEX IF NOT EXISTS idx_duplicate_groups_revision
    ON $cacheGroupsTable(contacts_revision, policy_version, threshold)
  ''';

  static const String createMembersGroupIndexSql = '''
    CREATE INDEX IF NOT EXISTS idx_duplicate_members_group
    ON $cacheMembersTable(group_id, rank)
  ''';

  static const String createPairsGroupIndexSql = '''
    CREATE INDEX IF NOT EXISTS idx_duplicate_pairs_group
    ON $cachePairsTable(group_id)
  ''';
}
