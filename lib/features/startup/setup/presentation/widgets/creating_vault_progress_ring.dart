import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Circular progress stroke used on [CreatingVaultPage].
class CreatingVaultProgressRingPainter extends CustomPainter {
  const CreatingVaultProgressRingPainter({
    required this.progress,
    required this.baseColor,
  });

  final double progress;
  final Color baseColor;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 14.0;
    final center = size.center(Offset.zero);
    final radius = (math.min(size.width, size.height) - stroke) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final basePaint = Paint()
      ..color = baseColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;

    final fillPaint = Paint()
      ..color = const Color(0xFF36D17F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 0, math.pi * 2, false, basePaint);
    canvas.drawArc(
      rect,
      -math.pi / 2,
      math.pi * 2 * progress.clamp(0, 1),
      false,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CreatingVaultProgressRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.baseColor != baseColor;
  }
}
