import 'package:contacts/core/theme/app_breakpoints.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/utils/date_field_helper.dart';
import 'package:flutter/material.dart';

class DateInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.firstDate,
    this.lastDate,
  });

  Future<void> _handleDateSelection(BuildContext context) async {
    final locale = Localizations.localeOf(context).toString();
    final currentDate = DateFieldHelper.parseDateOrDefault(
      controller.text,
      locale,
    );

    final DateTime? picked = await DateFieldHelper.selectDate(
      context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      controller.text = DateFieldHelper.formatDate(picked, locale);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleDateSelection(context),
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: AppBreakpoints.isWide(context)
                ? const Icon(Icons.calendar_today_rounded)
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 12,
            ),
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
