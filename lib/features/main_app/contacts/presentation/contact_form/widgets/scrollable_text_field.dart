// lib/features/main_app/contacts/presentation/contact_form/widgets/scrollable_text_field.dart

import 'package:contacts/features/main_app/contacts/presentation/contact_form/providers/form_scroll_controller_provider.dart';
import 'package:flutter/material.dart';

/// Scrolls the contact form when [textFieldFocusNode] gains focus and the
/// keyboard would obscure the field. [textFieldFocusNode] must be the same
/// instance passed to the inner [TextField] so focus/IME stay consistent.
class ScrollableTextField extends StatefulWidget {
  final FocusNode textFieldFocusNode;
  final Widget child;
  final Duration scrollDuration;
  final Curve scrollCurve;
  final double paddingAboveKeyboard;

  const ScrollableTextField({
    super.key,
    required this.textFieldFocusNode,
    required this.child,
    this.scrollDuration = const Duration(milliseconds: 300),
    this.scrollCurve = Curves.easeOutCubic,
    this.paddingAboveKeyboard = 20.0,
  });

  @override
  State<ScrollableTextField> createState() => _ScrollableTextFieldState();
}

class _ScrollableTextFieldState extends State<ScrollableTextField> {
  @override
  void initState() {
    super.initState();
    widget.textFieldFocusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(covariant ScrollableTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.textFieldFocusNode != widget.textFieldFocusNode) {
      oldWidget.textFieldFocusNode.removeListener(_onFocusChange);
      widget.textFieldFocusNode.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    widget.textFieldFocusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    if (widget.textFieldFocusNode.hasFocus) {
      _waitForKeyboardAndScroll();
    }
  }

  Future<void> _waitForKeyboardAndScroll() async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (!mounted) return;

    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    if (keyboardHeight == 0) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return;
      keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    }

    if (keyboardHeight > 0) {
      await _ensureVisible(keyboardHeight);
    }
  }

  Future<void> _ensureVisible(double keyboardHeight) async {
    if (!mounted) return;

    final scrollController = FormScrollController.of(context);
    if (scrollController == null) {
      return;
    }

    final renderObject = context.findRenderObject();
    if (renderObject == null) return;

    final renderBox = renderObject as RenderBox;

    final screenHeight = MediaQuery.of(context).size.height;
    final viewportHeight = screenHeight - keyboardHeight;

    final fieldGlobalPosition = renderBox.localToGlobal(Offset.zero);
    final fieldHeight = renderBox.size.height;
    final fieldBottom = fieldGlobalPosition.dy + fieldHeight;

    final visibleBottom = viewportHeight - widget.paddingAboveKeyboard;

    if (fieldBottom > visibleBottom) {
      final scrollAmount = fieldBottom - visibleBottom;
      final targetScroll = scrollController.offset + scrollAmount;

      final finalScroll = targetScroll.clamp(
        scrollController.position.minScrollExtent,
        scrollController.position.maxScrollExtent,
      );

      await scrollController.animateTo(
        finalScroll,
        duration: widget.scrollDuration,
        curve: widget.scrollCurve,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
