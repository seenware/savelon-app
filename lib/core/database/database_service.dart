// lib/core/database/database_service.dart

import 'package:contacts/core/storage/private_storage_migration.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

import 'schema/contacts_schema.dart';
import 'schema/duplicates_cache_schema.dart';

/// Encrypted local database service using SQLCipher.
///
/// Provides secure storage for contacts with full-database encryption.
class DatabaseService {
  DatabaseService();

  Database? _database;

  /// Open or create the encrypted database.
  ///
  /// On iOS, a previous failed open attempt (e.g. wrong password) can leave a
  /// stale FMDB/SQLite handle where `sqlite3_close()` returned SQLITE_BUSY
  /// because the failed `PRAGMA user_version` statement wasn't finalised yet.
  /// The very next open call then hits the lingering handle and fails again,
  /// even with the correct key.  A single retry — after a short yield that
  /// gives iOS time to finalise the statement and release file locks — is
  /// enough to recover cleanly.
  Future<void> initialize(Uint8List encryptionKey) async {
    if (_database != null) {
      return;
    }

    final path = await PrivateStoragePaths.encryptedDatabasePath();
    final hexKey = _bytesToHex(encryptionKey);

    for (var attempt = 0; attempt < 2; attempt++) {
      try {
        _database = await openDatabase(
          path,
          password: hexKey,
          version: 2,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
          onOpen: _onOpen,
        );
        break; // success — exit loop
      } catch (e) {
        if (attempt == 1) rethrow; // second attempt also failed — give up
        // Yield to the event loop so the OS / FMDB can complete its cleanup
        // of the previous stale connection before we try again.
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }
  }

  /// Convert bytes to hex string for SQLCipher key
  String _bytesToHex(Uint8List bytes) {
    return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join('');
  }

  /// Create database schema
  Future<void> _onCreate(Database db, int version) async {
    await db.execute(ContactsSchema.createTableSql);
    await db.execute(ContactsSchema.createSearchIndexSql);
    await _createDuplicateCacheTables(db);
    await db.insert(DuplicatesCacheSchema.appMetaTable, {
      'key': DuplicatesCacheSchema.metaContactsRevisionKey,
      'value': '0',
    }, conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _createDuplicateCacheTables(db);
      await db.insert(DuplicatesCacheSchema.appMetaTable, {
        'key': DuplicatesCacheSchema.metaContactsRevisionKey,
        'value': '0',
      }, conflictAlgorithm: ConflictAlgorithm.ignore);
    }
  }

  Future<void> _createDuplicateCacheTables(Database db) async {
    await db.execute(DuplicatesCacheSchema.createAppMetaTableSql);
    await db.execute(DuplicatesCacheSchema.createGroupsTableSql);
    await db.execute(DuplicatesCacheSchema.createMembersTableSql);
    await db.execute(DuplicatesCacheSchema.createPairsTableSql);
    await db.execute(DuplicatesCacheSchema.createGroupsRevisionIndexSql);
    await db.execute(DuplicatesCacheSchema.createMembersGroupIndexSql);
    await db.execute(DuplicatesCacheSchema.createPairsGroupIndexSql);
  }

  /// Verify SQLCipher is active on database open
  Future<void> _onOpen(Database db) async {
    final result = await db.rawQuery('PRAGMA cipher_version');
    if (result.isEmpty || result.first.values.first == null) {
      throw StateError(
        'SQLCipher not available! Database would be unencrypted.',
      );
    }

  }

  /// Get database instance
  Database get database {
    if (_database == null) {
      throw StateError('Database not initialized. Call initialize() first.');
    }
    return _database!;
  }

  /// Check if database is initialized
  bool get isInitialized => _database != null;

  // ==================== CRUD Operations ====================

  /// Insert a contact
  Future<void> insertContact(Map<String, dynamic> contact) async {
    await database.transaction((txn) async {
      await txn.insert(
        ContactsSchema.tableName,
        contact,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      await _incrementContactsRevisionTxn(txn);
    });
  }

  /// Batch insert multiple contacts in a single transaction
  Future<void> batchInsertContacts(List<Map<String, dynamic>> contacts) async {
    if (contacts.isEmpty) return;

    await database.transaction((txn) async {
      final batch = txn.batch();

      for (final contact in contacts) {
        batch.insert(
          ContactsSchema.tableName,
          contact,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(noResult: true);
      await _incrementContactsRevisionTxn(txn);
    });
  }

  /// Update a contact
  Future<void> updateContact(String id, Map<String, dynamic> updates) async {
    await database.transaction((txn) async {
      await txn.update(
        ContactsSchema.tableName,
        updates,
        where: '${ContactsSchema.columnId} = ?',
        whereArgs: [id],
      );
      await _incrementContactsRevisionTxn(txn);
    });
  }

  /// Get all contacts
  Future<List<Map<String, dynamic>>> getAllContacts() async {
    return await database.query(
      ContactsSchema.tableName,
      orderBy: '${ContactsSchema.columnFirstName} ASC',
    );
  }

  /// Get a single contact by ID
  Future<Map<String, dynamic>?> getContactById(String id) async {
    final results = await database.query(
      ContactsSchema.tableName,
      where: '${ContactsSchema.columnId} = ?',
      whereArgs: [id],
      limit: 1,
    );

    return results.isNotEmpty ? results.first : null;
  }

  /// Delete a contact permanently
  Future<void> deleteContact(String id) async {
    await database.transaction((txn) async {
      await txn.delete(
        ContactsSchema.tableName,
        where: '${ContactsSchema.columnId} = ?',
        whereArgs: [id],
      );
      await _incrementContactsRevisionTxn(txn);
    });
  }

  /// Insert/replace one contact and remove a set of others in one transaction.
  Future<void> replaceContactsForMerge({
    required Map<String, dynamic> mergedContact,
    required List<String> deleteIds,
  }) async {
    await database.transaction((txn) async {
      await txn.insert(
        ContactsSchema.tableName,
        mergedContact,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      for (final id in deleteIds) {
        await txn.delete(
          ContactsSchema.tableName,
          where: '${ContactsSchema.columnId} = ?',
          whereArgs: [id],
        );
      }
      await _incrementContactsRevisionTxn(txn);
    });
  }

  /// Search contacts by name or company
  Future<List<Map<String, dynamic>>> searchContacts(String query) async {
    final searchPattern = '%$query%';
    return await database.query(
      ContactsSchema.tableName,
      where:
          '''
        ${ContactsSchema.columnFirstName} LIKE ? OR
        ${ContactsSchema.columnLastName} LIKE ? OR
        ${ContactsSchema.columnCompany} LIKE ? OR
        ${ContactsSchema.columnNickname} LIKE ?
      ''',
      whereArgs: [searchPattern, searchPattern, searchPattern, searchPattern],
      orderBy: '${ContactsSchema.columnFirstName} ASC',
    );
  }

  /// Get count of all contacts
  Future<int> getContactCount() async {
    final result = await database.rawQuery(
      'SELECT COUNT(*) as count FROM ${ContactsSchema.tableName}',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> getContactsRevision() async {
    final rows = await database.query(
      DuplicatesCacheSchema.appMetaTable,
      columns: ['value'],
      where: 'key = ?',
      whereArgs: [DuplicatesCacheSchema.metaContactsRevisionKey],
      limit: 1,
    );
    if (rows.isEmpty) return 0;
    final raw = rows.first['value'] as String? ?? '0';
    return int.tryParse(raw) ?? 0;
  }

  Future<void> replaceDuplicateCache({
    required int contactsRevision,
    required String policyVersion,
    required double threshold,
    required List<Map<String, Object?>> groups,
    required List<Map<String, Object?>> members,
    required List<Map<String, Object?>> pairs,
  }) async {
    await database.transaction((txn) async {
      await txn.delete(DuplicatesCacheSchema.cachePairsTable);
      await txn.delete(DuplicatesCacheSchema.cacheMembersTable);
      await txn.delete(DuplicatesCacheSchema.cacheGroupsTable);

      final groupsBatch = txn.batch();
      for (final row in groups) {
        groupsBatch.insert(DuplicatesCacheSchema.cacheGroupsTable, row);
      }
      await groupsBatch.commit(noResult: true);

      final membersBatch = txn.batch();
      for (final row in members) {
        membersBatch.insert(DuplicatesCacheSchema.cacheMembersTable, row);
      }
      await membersBatch.commit(noResult: true);

      final pairsBatch = txn.batch();
      for (final row in pairs) {
        pairsBatch.insert(DuplicatesCacheSchema.cachePairsTable, row);
      }
      await pairsBatch.commit(noResult: true);

      await txn.insert(DuplicatesCacheSchema.appMetaTable, {
        'key': DuplicatesCacheSchema.metaCacheContactsRevisionKey,
        'value': '$contactsRevision',
      }, conflictAlgorithm: ConflictAlgorithm.replace);
      await txn.insert(DuplicatesCacheSchema.appMetaTable, {
        'key': DuplicatesCacheSchema.metaPolicyVersionKey,
        'value': policyVersion,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
      await txn.insert(DuplicatesCacheSchema.appMetaTable, {
        'key': DuplicatesCacheSchema.metaThresholdKey,
        'value': '$threshold',
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<({
    List<Map<String, Object?>> groups,
    List<Map<String, Object?>> members,
    List<Map<String, Object?>> pairs
  })?> readDuplicateCache({
    required int contactsRevision,
    required String policyVersion,
    required double threshold,
  }) async {
    final cacheRevisionRows = await database.query(
      DuplicatesCacheSchema.appMetaTable,
      columns: ['value'],
      where: 'key = ?',
      whereArgs: [DuplicatesCacheSchema.metaCacheContactsRevisionKey],
      limit: 1,
    );
    final cachedRevision = cacheRevisionRows.isNotEmpty
        ? int.tryParse(cacheRevisionRows.first['value'] as String? ?? '')
        : null;
    if (cachedRevision == null || cachedRevision != contactsRevision) {
      return null;
    }

    final policyRows = await database.query(
      DuplicatesCacheSchema.appMetaTable,
      columns: ['value'],
      where: 'key = ?',
      whereArgs: [DuplicatesCacheSchema.metaPolicyVersionKey],
      limit: 1,
    );
    final thresholdRows = await database.query(
      DuplicatesCacheSchema.appMetaTable,
      columns: ['value'],
      where: 'key = ?',
      whereArgs: [DuplicatesCacheSchema.metaThresholdKey],
      limit: 1,
    );

    final cachedPolicy = policyRows.isNotEmpty
        ? (policyRows.first['value'] as String? ?? '')
        : '';
    final cachedThreshold = thresholdRows.isNotEmpty
        ? double.tryParse(thresholdRows.first['value'] as String? ?? '')
        : null;
    if (cachedPolicy != policyVersion || cachedThreshold != threshold) {
      return null;
    }

    final groups = await database.query(DuplicatesCacheSchema.cacheGroupsTable);
    if (groups.isEmpty) return null;
    final members = await database.query(DuplicatesCacheSchema.cacheMembersTable);
    final pairs = await database.query(DuplicatesCacheSchema.cachePairsTable);
    return (
      groups: groups.cast<Map<String, Object?>>(),
      members: members.cast<Map<String, Object?>>(),
      pairs: pairs.cast<Map<String, Object?>>(),
    );
  }

  Future<void> _incrementContactsRevisionTxn(Transaction txn) async {
    final rows = await txn.query(
      DuplicatesCacheSchema.appMetaTable,
      columns: ['value'],
      where: 'key = ?',
      whereArgs: [DuplicatesCacheSchema.metaContactsRevisionKey],
      limit: 1,
    );
    final current = rows.isEmpty
        ? 0
        : int.tryParse(rows.first['value'] as String? ?? '0') ?? 0;
    await txn.insert(DuplicatesCacheSchema.appMetaTable, {
      'key': DuplicatesCacheSchema.metaContactsRevisionKey,
      'value': '${current + 1}',
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Changes the database encryption key by exporting all rows, deleting the
  /// current file, and re-creating the database with the new key.
  ///
  /// Avoids `PRAGMA rekey` whose key-format semantics differ from the text
  /// passphrase that `openDatabase(password:)` uses, which would produce an
  /// un-openable file after the rekey.
  ///
  /// Returns the exported rows so the caller can verify or further process
  /// them if needed.
  Future<List<Map<String, dynamic>>> changeEncryptionKey(
    Uint8List newKey,
  ) async {
    // 1. Export all contact rows while the old key is still active.
    final rows = await getAllContacts();

    // 2. Close and delete the file.
    await deleteDatabase(); // sets _database = null

    // 3. Re-create with the new key.
    await initialize(newKey);

    // 4. Re-insert all rows.
    if (rows.isNotEmpty) {
      await batchInsertContacts(rows);
    }

    return rows;
  }

  /// Close the database
  Future<void> close() async {
    await _database?.close();
    _database = null;
  }

  /// Delete the database file (factory reset)
  Future<void> deleteDatabase() async {
    await close();
    await PrivateStorageMigration.deleteEncryptedDatabaseFiles();
  }
}
