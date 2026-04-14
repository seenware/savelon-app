// lib/features/main_app/contacts/presentation/contact_details/widgets/contact_info_group.dart

import 'package:contacts/core/utils/phone_formatter.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'contact_info_card.dart';
import 'package:flutter/material.dart';

class ContactInfoGroup extends StatelessWidget {
  final List<Widget> cards;

  const ContactInfoGroup({super.key, required this.cards});

  factory ContactInfoGroup.communication({required Contact contact}) {
    final cards = <Widget>[];

    for (var phone in contact.phones) {
      cards.add(
        ContactInfoCard(
          icon: Icons.phone_outlined,
          label: phone.label,
          value: PhoneFormatter.format(phone.number),
          type: ContactInfoType.phone,
        ),
      );
    }

    for (var email in contact.emails) {
      cards.add(
        ContactInfoCard(
          icon: Icons.email_outlined,
          label: email.label,
          value: email.address,
          type: ContactInfoType.email,
        ),
      );
    }

    for (var address in contact.addresses) {
      cards.add(
        ContactInfoCard(
          icon: Icons.location_on_outlined,
          label: address.label,
          value: address.address,
        ),
      );
    }

    return ContactInfoGroup(cards: cards);
  }

  factory ContactInfoGroup.work({required Contact contact}) {
    final cards = <Widget>[];

    if (contact.company.isNotEmpty) {
      cards.add(
        ContactInfoCard(
          icon: Icons.business_outlined,
          label: 'Company',
          value: contact.company,
        ),
      );
    }

    if (contact.department.isNotEmpty) {
      cards.add(
        ContactInfoCard(
          icon: Icons.group_outlined,
          label: 'Department',
          value: contact.department,
        ),
      );
    }

    if (contact.jobTitle.isNotEmpty) {
      cards.add(
        ContactInfoCard(
          icon: Icons.work_outline,
          label: 'Job Title',
          value: contact.jobTitle,
        ),
      );
    }

    return ContactInfoGroup(cards: cards);
  }

  factory ContactInfoGroup.additional({required Contact contact}) {
    final cards = <Widget>[];

    for (var date in contact.dates) {
      cards.add(
        ContactInfoCard(
          icon: Icons.calendar_today_outlined,
          label: date.label,
          value: _formatDate(date.date),
        ),
      );
    }

    for (var link in contact.links) {
      cards.add(
        ContactInfoCard(
          icon: Icons.link_outlined,
          label: link.label,
          value: link.url,
          type: ContactInfoType.link,
        ),
      );
    }

    if (contact.note.isNotEmpty) {
      cards.add(
        ContactInfoCard(
          icon: Icons.note_outlined,
          label: 'Note',
          value: contact.note,
        ),
      );
    }

    return ContactInfoGroup(cards: cards);
  }

  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: List.generate(cards.length, (index) {
        final isFirst = index == 0;
        final isLast = index == cards.length - 1;
        final hasNext = index < cards.length - 1;

        BorderRadius borderRadius;
        if (cards.length == 1) {
          borderRadius = BorderRadius.circular(12);
        } else if (isFirst) {
          borderRadius = const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          );
        } else if (isLast) {
          borderRadius = const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );
        } else {
          borderRadius = BorderRadius.circular(4);
        }

        return Column(
          children: [
            ContactInfoCard(
              icon: (cards[index] as ContactInfoCard).icon,
              label: (cards[index] as ContactInfoCard).label,
              value: (cards[index] as ContactInfoCard).value,
              type: (cards[index] as ContactInfoCard).type,
              borderRadius: borderRadius,
            ),
            if (hasNext) const SizedBox(height: 2),
          ],
        );
      }),
    );
  }
}
