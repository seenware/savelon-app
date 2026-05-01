import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/layout/widgets/primary_button.dart';
import 'package:contacts/core/theme/app_breakpoints.dart';
import 'package:flutter/material.dart';

class SetupPageScaffold extends StatelessWidget {
  const SetupPageScaffold({
    super.key,
    required this.body,
    this.bottomButtonText,
    this.onBottomButtonPressed,
    this.onBottomButtonDisabledPressed,
    this.bottomButtonLoading = false,
    this.secondaryAction,
    this.onBack,
    this.showBackButton = false,
  });

  final Widget body;
  final String? bottomButtonText;
  final VoidCallback? onBottomButtonPressed;
  final VoidCallback? onBottomButtonDisabledPressed;
  final bool bottomButtonLoading;
  final Widget? secondaryAction;
  final VoidCallback? onBack;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      limitWidth: false,
      resizeToAvoidBottomInset: true,
      body: AppBreakpoints.constrainSetupContent(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: body),
                if (secondaryAction != null) ...[
                  secondaryAction!,
                  const SizedBox(height: 12),
                ],
                if (bottomButtonText != null)
                  PrimaryButton(
                    text: bottomButtonText!,
                    onPressed: onBottomButtonPressed,
                    onDisabledPressed: onBottomButtonDisabledPressed,
                    isLoading: bottomButtonLoading,
                    maxWidth: null,
                  ),
              ],
            ),
            if (showBackButton && onBack != null)
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  onPressed: onBack,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
