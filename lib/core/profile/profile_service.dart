import 'dart:math';

import 'package:contacts/core/profile/profile_constants.dart';
import 'package:contacts/core/storage/secure_storage_service.dart';

class ProfileService {
  ProfileService({SecureStorageService? storage})
    : _storage = storage ?? SecureStorageService.instance;

  final SecureStorageService _storage;

  Future<String> readUsername() async {
    final value = await _storage.read(ProfileConstants.storageKeyUsername);
    if (value == null || value.trim().isEmpty) {
      return ProfileConstants.defaultUsername;
    }
    final trimmed = value.trim();
    // Legacy installs had no vault name; some builds stored a generic label.
    if (trimmed.toLowerCase() == 'anonymous') {
      return ProfileConstants.defaultUsername;
    }
    return trimmed;
  }

  Future<String> readAvatarId() async {
    final value = await _storage.read(ProfileConstants.storageKeyAvatarId);
    if (value == null || !ProfileConstants.animalAvatarIds.contains(value)) {
      return _randomAvatarId();
    }
    return value;
  }

  Future<void> saveProfile({
    required String username,
    required String avatarId,
  }) async {
    await _storage.write(
      ProfileConstants.storageKeyUsername,
      username.trim().isEmpty
          ? ProfileConstants.defaultUsername
          : username.trim(),
    );
    await _storage.write(
      ProfileConstants.storageKeyAvatarId,
      ProfileConstants.animalAvatarIds.contains(avatarId)
          ? avatarId
          : ProfileConstants.animalAvatarIds.first,
    );
  }

  String _randomAvatarId() {
    final random = Random();
    return ProfileConstants.animalAvatarIds[random.nextInt(
      ProfileConstants.animalAvatarIds.length,
    )];
  }
}
