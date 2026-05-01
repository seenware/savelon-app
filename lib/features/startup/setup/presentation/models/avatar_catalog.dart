import 'package:flutter/material.dart';

class AvatarOption {
  const AvatarOption({
    required this.id,
    required this.icon,
    required this.background,
  });

  final String id;
  final IconData icon;
  final Color background;
}

const List<AvatarOption> setupAvatarCatalog = <AvatarOption>[
  AvatarOption(
    id: 'cat',
    icon: Icons.security_rounded,
    background: Color(0xFFEF5350),
  ),
  AvatarOption(
    id: 'dog',
    icon: Icons.shield_rounded,
    background: Color(0xFFFF9800),
  ),
  AvatarOption(
    id: 'fox',
    icon: Icons.lock_rounded,
    background: Color(0xFF5C6BC0),
  ),
  AvatarOption(
    id: 'owl',
    icon: Icons.verified_user_rounded,
    background: Color(0xFF7E57C2),
  ),
  AvatarOption(
    id: 'rabbit',
    icon: Icons.vpn_key_rounded,
    background: Color(0xFF42A5F5),
  ),
  AvatarOption(
    id: 'turtle',
    icon: Icons.lock_person_rounded,
    background: Color(0xFF66BB6A),
  ),
  AvatarOption(
    id: 'dolphin',
    icon: Icons.admin_panel_settings_rounded,
    background: Color(0xFF8D6E63),
  ),
];

AvatarOption avatarById(String id) {
  return setupAvatarCatalog.firstWhere(
    (avatar) => avatar.id == id,
    orElse: () => setupAvatarCatalog.first,
  );
}
