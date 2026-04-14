// lib/features/main_app/contacts/presentation/contact_details/widgets/contact_info_card.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contacts/core/purchases/premium_gate.dart';
import 'package:contacts/core/purchases/purchases_service.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:url_launcher/url_launcher.dart';

enum ContactInfoType { phone, email, link, other }

class ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final BorderRadius borderRadius;
  final ContactInfoType type;

  const ContactInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.type = ContactInfoType.other,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: colorScheme.surfaceContainerHigh,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: () => _handleTap(context),
        onLongPress: () => _showContextMenu(context),
        onSecondaryTapDown: (details) =>
            _showContextMenu(context, position: details.globalPosition),
        borderRadius: borderRadius,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value, style: theme.textTheme.bodyLarge),
                    if (label.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        label,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleTap(BuildContext context) {
    PurchasesService.hasPremiumAccess().then((hasPremium) {
      if (!context.mounted) return;
      if (hasPremium) {
        _performPrimaryAction(context);
      } else {
        _showContextMenu(context);
      }
    });
  }

  String _sanitizePhoneNumber(String input) {
    final trimmed = input.trim();
    final hasLeadingPlus = trimmed.startsWith('+');
    final digitsOnly = trimmed.replaceAll(RegExp(r'[^0-9]'), '');
    return hasLeadingPlus ? '+$digitsOnly' : digitsOnly;
  }

  Future<void> _showContextMenu(
    BuildContext context, {
    Offset? position,
  }) async {
    final RenderBox? overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;
    if (overlay == null) return;

    final Offset menuPosition = position ?? _getWidgetPosition(context);

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        menuPosition.dx,
        menuPosition.dy,
        overlay.size.width - menuPosition.dx,
        overlay.size.height - menuPosition.dy,
      ),
      items: _buildMenuItems(context),
    );

    if (!context.mounted) return;

    if (selected != null) {
      switch (selected) {
        case 'call':
          await _runGuardedAction(context, () => _makePhoneCall(context));
          break;
        case 'email':
          await _runGuardedAction(context, () => _sendEmail(context));
          break;
        case 'visit':
          await _runGuardedAction(context, () => _visitLink(context));
          break;
        case 'copy':
          await _runGuardedAction(context, () => _copyToClipboard(context));
          break;
      }
    }
  }

  List<PopupMenuEntry<String>> _buildMenuItems(BuildContext context) {
    final l10n = context.l10n;
    final items = <PopupMenuEntry<String>>[];

    if (type == ContactInfoType.phone) {
      items.add(
        const PopupMenuItem<String>(
          value: 'call',
          child: Row(
            children: [
              Icon(Icons.phone, size: 20),
              SizedBox(width: 12),
              Text('Call'),
            ],
          ),
        ),
      );
    }

    if (type == ContactInfoType.email) {
      items.add(
        const PopupMenuItem<String>(
          value: 'email',
          child: Row(
            children: [
              Icon(Icons.email, size: 20),
              SizedBox(width: 12),
              Text('Send Email'),
            ],
          ),
        ),
      );
    }

    if (type == ContactInfoType.link) {
      items.add(
        PopupMenuItem<String>(
          value: 'visit',
          child: Row(
            children: [
              const Icon(Icons.open_in_new, size: 20),
              const SizedBox(width: 12),
              Text(l10n.visit),
            ],
          ),
        ),
      );
    }

    items.add(
      PopupMenuItem<String>(
        value: 'copy',
        child: Row(
          children: [
            const Icon(Icons.copy, size: 20),
            const SizedBox(width: 12),
            Text(l10n.copy),
          ],
        ),
      ),
    );

    return items;
  }

  Offset _getWidgetPosition(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    return Offset(position.dx, position.dy + renderBox.size.height);
  }

  Future<void> _makePhoneCall(BuildContext context) async {
    final sanitized = _sanitizePhoneNumber(value);
    final Uri phoneUri = Uri(scheme: 'tel', path: sanitized);
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        if (!context.mounted) return;
        _showError(context, 'Cannot make phone calls on this device');
      }
    } catch (e) {
      if (!context.mounted) return;
      _showError(context, 'Failed to make call');
    }
  }

  Future<void> _sendEmail(BuildContext context) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: value);
    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        if (!context.mounted) return;
        _showError(context, 'Cannot send emails on this device');
      }
    } catch (e) {
      if (!context.mounted) return;
      _showError(context, 'Failed to open email client');
    }
  }

  Future<void> _visitLink(BuildContext context) async {
    final raw = value.trim();
    if (raw.isEmpty) return;
    final withScheme = raw.contains('://') ? raw : 'https://$raw';
    final uri = Uri.tryParse(withScheme);
    if (uri == null) {
      _showError(context, 'Invalid link');
      return;
    }
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (!context.mounted) return;
        _showError(context, 'Cannot open this link');
      }
    } catch (_) {
      if (!context.mounted) return;
      _showError(context, 'Failed to open link');
    }
  }

  Future<void> _copyToClipboard(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _performPrimaryAction(BuildContext context) {
    switch (type) {
      case ContactInfoType.phone:
        return _makePhoneCall(context);
      case ContactInfoType.email:
        return _sendEmail(context);
      case ContactInfoType.link:
        return _visitLink(context);
      case ContactInfoType.other:
        return _copyToClipboard(context);
    }
  }

  Future<void> _runGuardedAction(
    BuildContext context,
    Future<void> Function() action,
  ) async {
    if (!await PremiumGate.ensurePremium(context)) return;
    await action();
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
