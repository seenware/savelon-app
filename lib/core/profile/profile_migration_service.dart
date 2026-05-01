import 'dart:math';

import 'package:contacts/core/profile/profile_constants.dart';
import 'package:contacts/core/storage/secure_storage_service.dart';

class ProfileMigrationService {
  ProfileMigrationService({SecureStorageService? storage})
    : _storage = storage ?? SecureStorageService.instance;

  final SecureStorageService _storage;

  Future<void> migrateDefaultsIfNeeded() async {
    final done = await _storage.read(ProfileConstants.storageKeyMigrationV1);
    if (done == '1') return;

    final existingUsername = await _storage.read(
      ProfileConstants.storageKeyUsername,
    );
    final existingAvatar = await _storage.read(
      ProfileConstants.storageKeyAvatarId,
    );

    if (existingUsername == null || existingUsername.trim().isEmpty) {
      await _storage.write(
        ProfileConstants.storageKeyUsername,
        ProfileConstants.defaultUsername,
      );
    }

    if (existingAvatar == null ||
        !ProfileConstants.animalAvatarIds.contains(existingAvatar)) {
      final random = Random();
      final randomAvatar =
          ProfileConstants.animalAvatarIds[random.nextInt(
            ProfileConstants.animalAvatarIds.length,
          )];
      await _storage.write(ProfileConstants.storageKeyAvatarId, randomAvatar);
    }

    await _storage.write(ProfileConstants.storageKeyMigrationV1, '1');
  }
}
