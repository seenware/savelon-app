// lib/features/startup/onboarding/presentation/widgets/page_content/onboarding_icon.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnboardingIcon extends HookWidget {
  final IconData iconData;
  final Color? iconColor;
  final VoidCallback? onTap;
  static const double size = 120.0;

  const OnboardingIcon({
    super.key,
    required this.iconData,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveIconColor = iconColor ?? theme.colorScheme.primary;

    // Animation controller with hooks
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    // Tween animation from 0.9 to 1.0 scale for the circle
    final animation = useAnimation(
      Tween<double>(begin: 0.7, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      ),
    );

    // Start animation on build
    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(end: effectiveIconColor),
      duration: const Duration(milliseconds: 400),
      builder: (context, animatedColor, _) {
        final color = animatedColor ?? effectiveIconColor;
        return GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Animate only the background circle
                Transform.scale(
                  scale: animation,
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Icon stays fixed size on top
                Icon(iconData, size: size / 2, color: color),
              ],
            ),
          ),
        );
      },
    );
  }
}
