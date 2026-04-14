// lib/core/layout/widgets/password_input_field.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordInputField extends HookWidget {
  final TextEditingController controller;
  final String label;
  final String? helperText;
  final String? errorText;
  final int shakeSignal;
  final FocusNode? focusNode;
  final VoidCallback? onFocusLost;
  final VoidCallback? onSubmitted;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;

  const PasswordInputField({
    super.key,
    required this.controller,
    required this.label,
    this.helperText,
    this.errorText,
    this.shakeSignal = 0,
    this.focusNode,
    this.onFocusLost,
    this.onSubmitted,
    this.onChanged,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final isVisible = useState(false);
    final internalFocusNode = useFocusNode();
    final effectiveFocusNode = focusNode ?? internalFocusNode;
    final wasFocused = useRef(false);
    final disableAnimations =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    final shakeController = useAnimationController(
      duration: const Duration(milliseconds: 360),
    );
    final previousErrorText = useRef<String?>(null);
    final previousShakeSignal = useRef<int>(shakeSignal);
    final isFirstBuild = useRef(true);
    final shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: -10,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -10,
          end: 10,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 10,
          end: -6,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -6,
          end: 6,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 6,
          end: 0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
    ]).animate(shakeController);

    useEffect(() {
      void onNodeFocus() {
        final hasFocus = effectiveFocusNode.hasFocus;
        if (wasFocused.value && !hasFocus) {
          onFocusLost?.call();
        }
        wasFocused.value = hasFocus;
      }

      effectiveFocusNode.addListener(onNodeFocus);
      return () => effectiveFocusNode.removeListener(onNodeFocus);
    }, [effectiveFocusNode]);

    useEffect(() {
      final enteredErrorState =
          previousErrorText.value == null && errorText != null;
      final receivedForceShakeSignal =
          previousShakeSignal.value != shakeSignal && errorText != null;
      final shouldShake =
          !disableAnimations &&
          !isFirstBuild.value &&
          (enteredErrorState || receivedForceShakeSignal);

      if (shouldShake) {
        shakeController.forward(from: 0);
      }

      isFirstBuild.value = false;
      previousErrorText.value = errorText;
      previousShakeSignal.value = shakeSignal;
      return null;
    }, [errorText, shakeSignal, disableAnimations]);

    return AnimatedBuilder(
      animation: shakeController,
      builder: (context, child) => Transform.translate(
        offset: Offset(shakeAnimation.value, 0),
        child: child,
      ),
      child: TextField(
        controller: controller,
        focusNode: effectiveFocusNode,
        textInputAction: textInputAction,
        obscureText: !isVisible.value,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          helperText: errorText != null ? null : helperText,
          errorText: errorText,
          suffixIcon: IconButton(
            icon: Icon(
              isVisible.value ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () => isVisible.value = !isVisible.value,
          ),
        ),
        onSubmitted: (_) => onSubmitted?.call(),
        onChanged: onChanged,
      ),
    );
  }
}
