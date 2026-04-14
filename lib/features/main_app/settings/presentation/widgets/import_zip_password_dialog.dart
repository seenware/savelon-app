import 'package:contacts/core/layout/widgets/password_input_field.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class ImportZipPasswordDialog extends StatefulWidget {
  final Future<bool> Function(String password)? validatePassword;

  const ImportZipPasswordDialog({super.key, this.validatePassword});

  @override
  State<ImportZipPasswordDialog> createState() =>
      _ImportZipPasswordDialogState();

  static Future<String?> show(
    BuildContext context, {
    Future<bool> Function(String password)? validatePassword,
  }) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          ImportZipPasswordDialog(validatePassword: validatePassword),
    );
  }
}

class _ImportZipPasswordDialogState extends State<ImportZipPasswordDialog> {
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

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    Future<void> submit() async {
      if (!_canSubmit) return;
      final password = _controller.text.trim();
      final navigator = Navigator.of(context);
      if (widget.validatePassword == null) {
        navigator.pop(password);
        return;
      }

      setState(() {
        _isSubmitting = true;
        _errorText = null;
      });

      final isValid = await widget.validatePassword!(password);
      if (!mounted) return;

      if (isValid) {
        navigator.pop(password);
        return;
      }

      setState(() {
        _isSubmitting = false;
        _errorText = l10n.importErrorWrongPassword;
        _errorShakeTick++;
      });
    }

    return AlertDialog(
      title: Text(l10n.importZipPasswordTitle),
      content: PasswordInputField(
        controller: _controller,
        label: l10n.exportPasswordHint,
        errorText: _errorText,
        shakeSignal: _errorShakeTick,
        onChanged: (_) {
          setState(() {
            if (_errorText != null) {
              _errorText = null;
            }
          });
        },
        onSubmitted: submit,
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting
              ? null
              : () => Navigator.of(context).pop(null),
          child: Text(l10n.commonCancel),
        ),
        FilledButton(
          onPressed: _canSubmit ? submit : null,
          child: Text(
            _isSubmitting ? l10n.importZipPasswordChecking : l10n.commonContinue,
          ),
        ),
      ],
    );
  }
}
