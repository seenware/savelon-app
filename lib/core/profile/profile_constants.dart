class ProfileConstants {
  ProfileConstants._();

  static const String defaultUsername = 'My vault';
  static const List<String> animalAvatarIds = <String>[
    'cat',
    'dog',
    'fox',
    'owl',
    'rabbit',
    'turtle',
    'dolphin',
  ];

  static const String storageKeyUsername = 'profile_username';
  static const String storageKeyAvatarId = 'profile_avatar_id';
  static const String storageKeyMigrationV1 = 'profile_migration_v1_done';
}
