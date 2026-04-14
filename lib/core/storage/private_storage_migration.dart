// lib/core/storage/private_storage_migration.dart

import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

const _dbFileName = 'encrypted_contacts.db';
const _contactImagesDirName = 'contact_images';

/// Canonical paths under [getApplicationSupportDirectory] (not exposed via
/// iOS Files app when UIFileSharingEnabled is off).
class PrivateStoragePaths {
  PrivateStoragePaths._();

  static Future<Directory> databaseParentDirectory() async {
    final support = await getApplicationSupportDirectory();
    final dir = Directory(p.join(support.path, 'databases'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  static Future<String> encryptedDatabasePath() async {
    final dir = await databaseParentDirectory();
    return p.join(dir.path, _dbFileName);
  }

  static Future<Directory> contactImagesRoot() async {
    final support = await getApplicationSupportDirectory();
    return Directory(p.join(support.path, _contactImagesDirName));
  }

  static Future<Directory> legacyContactImagesRoot() async {
    final docs = await getApplicationDocumentsDirectory();
    return Directory(p.join(docs.path, _contactImagesDirName));
  }
}

/// Moves SQLCipher DB and encrypted images from legacy locations (Documents /
/// sqflite default) into Application Support. Idempotent.
class PrivateStorageMigration {
  PrivateStorageMigration._();

  static Future<void> migrateIfNeeded() async {
    await _migrateDatabaseIfNeeded();
    await _migrateContactImagesIfNeeded();
  }

  static Future<void> _migrateDatabaseIfNeeded() async {
    final newPath = await PrivateStoragePaths.encryptedDatabasePath();
    final newFile = File(newPath);
    if (await newFile.exists()) return;

    final oldPath = p.join(await getDatabasesPath(), _dbFileName);
    final oldFile = File(oldPath);
    if (!await oldFile.exists()) return;

    await PrivateStoragePaths.databaseParentDirectory();
    await _moveFile(oldFile, newFile);
  }

  static Future<void> _migrateContactImagesIfNeeded() async {
    final oldRoot = await PrivateStoragePaths.legacyContactImagesRoot();
    if (!await oldRoot.exists()) return;

    final newRoot = await PrivateStoragePaths.contactImagesRoot();

    if (!await newRoot.exists()) {
      await _moveDirectoryTree(oldRoot, newRoot);
      return;
    }

    await for (final entity in oldRoot.list()) {
      if (entity is! Directory) continue;
      final name = p.basename(entity.path);
      final dest = Directory(p.join(newRoot.path, name));
      if (await dest.exists()) continue;
      await entity.rename(dest.path);
    }
    if (await oldRoot.exists()) {
      try {
        await oldRoot.delete(recursive: true);
      } catch (_) {}
    }
  }

  static Future<void> _moveFile(File from, File to) async {
    try {
      await from.rename(to.path);
    } on FileSystemException catch (_) {
      await to.writeAsBytes(await from.readAsBytes());
      await from.delete();
    }
  }

  /// Renames [source] to [dest]; if rename fails, recursively copies then
  /// deletes [source].
  static Future<void> _moveDirectoryTree(
    Directory source,
    Directory dest,
  ) async {
    try {
      await source.rename(dest.path);
    } on FileSystemException catch (_) {
      await _copyDirectoryRecursive(source, dest);
      await source.delete(recursive: true);
    }
  }

  static Future<void> _copyDirectoryRecursive(
    Directory source,
    Directory dest,
  ) async {
    if (!await dest.exists()) {
      await dest.create(recursive: true);
    }
    await for (final entity in source.list(recursive: false)) {
      final name = p.basename(entity.path);
      if (entity is Directory) {
        await _copyDirectoryRecursive(
          entity,
          Directory(p.join(dest.path, name)),
        );
      } else if (entity is File) {
        await entity.copy(p.join(dest.path, name));
      }
    }
  }

  /// Deletes encrypted DB at the canonical path and at sqflite’s legacy path.
  static Future<void> deleteEncryptedDatabaseFiles() async {
    final newFile = File(await PrivateStoragePaths.encryptedDatabasePath());
    if (await newFile.exists()) {
      await newFile.delete();
    }

    final legacyFile = File(p.join(await getDatabasesPath(), _dbFileName));
    if (await legacyFile.exists()) {
      await legacyFile.delete();
    }
  }

  /// Removes contact image trees from both private and legacy locations.
  static Future<void> wipeContactImageDirectories() async {
    for (final root in [
      await PrivateStoragePaths.contactImagesRoot(),
      await PrivateStoragePaths.legacyContactImagesRoot(),
    ]) {
      if (await root.exists()) {
        await root.delete(recursive: true);
      }
    }
  }
}
