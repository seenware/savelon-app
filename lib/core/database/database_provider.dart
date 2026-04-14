// lib/core/database/database_provider.dart

import 'dart:typed_data';

import 'package:contacts/core/storage/private_storage_migration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database_service.dart';

class DatabaseNotifier extends Notifier<DatabaseService?> {
  @override
  DatabaseService? build() => null;

  Future<void> initialize(Uint8List key) async {
    if (state != null) return;

    await PrivateStorageMigration.migrateIfNeeded();

    final db = DatabaseService();
    await db.initialize(key);
    state = db;
  }

  Future<void> close() async {
    await state?.close();
    state = null;
  }

  Future<void> deleteDatabase() async {
    await state?.deleteDatabase();
    state = null;
  }

  /// Re-keys the database by dumping all rows and recreating the file with
  /// [newKey].  Updates the internal [state] reference in place.
  Future<List<Map<String, dynamic>>> changeEncryptionKey(
    Uint8List newKey,
  ) async {
    final db = state;
    if (db == null) throw StateError('Database not initialised');

    final rows = await db.changeEncryptionKey(newKey);

    // db.changeEncryptionKey already re-initialized the underlying service,
    // but the notifier still holds the same (now-updated) instance.
    // No state swap needed.
    return rows;
  }
}

final databaseProvider = NotifierProvider<DatabaseNotifier, DatabaseService?>(
  DatabaseNotifier.new,
);
