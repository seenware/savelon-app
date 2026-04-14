import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/input.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class CompanySection extends StatelessWidget {
  final TextEditingController companyController;
  final TextEditingController departmentController;
  final TextEditingController jobTitleController;

  const CompanySection({
    super.key,
    required this.companyController,
    required this.departmentController,
    required this.jobTitleController,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            Input(
              controller: companyController,
              hintText: l10n.formCompany,
              textCapitalization: TextCapitalization.words,
            ),
            const Divider(),
            Input(
              controller: departmentController,
              hintText: l10n.formDepartment,
              textCapitalization: TextCapitalization.words,
            ),
            const Divider(),
            Input(
              controller: jobTitleController,
              hintText: l10n.formJobTitle,
              textCapitalization: TextCapitalization.words,
            ),
          ],
        ),
      ),
    );
  }
}
