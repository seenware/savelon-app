import 'package:contacts/core/layout/widgets/access_code_input_field.dart';
import 'package:contacts/core/purchases/purchases_service.dart';
import 'package:flutter/material.dart';

class ActivateDemoDialog extends StatefulWidget {
  const ActivateDemoDialog({super.key});

  static Future<DateTime?> show(BuildContext context) {
    return showDialog<DateTime>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const ActivateDemoDialog(),
    );
  }

  @override
  State<ActivateDemoDialog> createState() => _ActivateDemoDialogState();
}

class _ActivateDemoDialogState extends State<ActivateDemoDialog> {
  late final TextEditingController _controller;
  String? _errorText;
  int _errorShakeTick = 0;
  bool _isSubmitting = false;

  bool get _canSubmit => !_isSubmitting && _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _errorMessageFor(DemoCodeRedeemStatus status) {
    switch (status) {
      case DemoCodeRedeemStatus.outsideValidityWindow:
        return 'This access code is not active right now.';
      case DemoCodeRedeemStatus.invalidCode:
        return 'Incorrect access code';
      case DemoCodeRedeemStatus.success:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> submit() async {
      if (!_canSubmit) return;
      final navigator = Navigator.of(context);

      setState(() {
        _isSubmitting = true;
        _errorText = null;
      });

      final result = await PurchasesService.redeemDemoCode(_controller.text);
      if (!mounted) return;

      if (result.status == DemoCodeRedeemStatus.success &&
          result.accessUntil != null) {
        navigator.pop(result.accessUntil);
        return;
      }

      setState(() {
        _isSubmitting = false;
        _errorText = _errorMessageFor(result.status);
        _errorShakeTick++;
      });
    }

    return AlertDialog(
      title: const Text('Activate Demo'),
      content: AccessCodeInputField(
        controller: _controller,
        label: 'Access code',
        errorText: _errorText,
        shakeSignal: _errorShakeTick,
        onChanged: (_) {
          setState(() {
            if (_errorText != null) _errorText = null;
          });
        },
        onSubmitted: submit,
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting
              ? null
              : () => Navigator.of(context).pop(null),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _canSubmit ? submit : null,
          child: Text(_isSubmitting ? 'Checking...' : 'Continue'),
        ),
      ],
    );
  }
}
