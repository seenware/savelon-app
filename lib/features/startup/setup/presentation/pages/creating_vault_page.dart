import 'dart:math' as math;

import 'package:contacts/features/startup/setup/presentation/widgets/setup_entrance.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/setup_page_scaffold.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CreatingVaultPage extends StatefulWidget {
  const CreatingVaultPage({
    super.key,
    required this.onCompleted,
    required this.onBack,
  });

  final Future<bool> Function() onCompleted;
  final VoidCallback onBack;

  @override
  State<CreatingVaultPage> createState() => _CreatingVaultPageState();
}

class _CreatingVaultPageState extends State<CreatingVaultPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _requested = false;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..addStatusListener((status) async {
            if (status == AnimationStatus.completed && !_requested) {
              _requested = true;
              final ok = await widget.onCompleted();
              if (!mounted) return;
              if (!ok) {
                setState(() => _failed = true);
              }
            }
          });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final inactiveRingColor = theme.brightness == Brightness.dark
        ? const Color(0xFF333333)
        : const Color(0xFFBDBDBD);
    return SetupPageScaffold(
      showBackButton: true,
      onBack: widget.onBack,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 44,
                    child: Row(
                      children: [
                        const SizedBox(width: 48),
                        Expanded(
                          child: Text(
                            l10n.setupCreatingVaultTitle,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineMedium,
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight - 44,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        SetupEntrance(
                          index: 0,
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, _) {
                              final percent = (_controller.value * 100).round();
                              return CustomPaint(
                                painter: _ProgressPainter(
                                  progress: _controller.value,
                                  baseColor: inactiveRingColor,
                                ),
                                child: SizedBox(
                                  width: 240,
                                  height: 240,
                                  child: Center(
                                    child: Text(
                                      l10n.setupCreatingVaultPercent(percent),
                                      style: theme.textTheme.displaySmall
                                          ?.copyWith(
                                            fontSize: 56,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, _) {
                            final value = _controller.value;
                            final entries = <({String text, bool visible})>[
                              (
                                text: l10n.setupCreatingKeyLabel,
                                visible: value > 0.08,
                              ),
                              (
                                text: l10n.setupEncryptingDataLabel,
                                visible: value > 0.4,
                              ),
                              (
                                text: l10n.setupCheckingSecurityLabel,
                                visible: value > 0.72,
                              ),
                            ];
                            final rowTextStyle = theme.textTheme.titleMedium
                                ?.copyWith(
                                  fontSize: 18,
                                  color: theme.colorScheme.onSurfaceVariant
                                      .withValues(alpha: 0.72),
                                );
                            final availableWidth = MediaQuery.sizeOf(context).width;
                            final painters = entries
                                .map(
                                  (entry) => TextPainter(
                                    text: TextSpan(
                                      text: entry.text,
                                      style: rowTextStyle,
                                    ),
                                    textDirection: TextDirection.ltr,
                                    maxLines: 2,
                                  )..layout(maxWidth: availableWidth),
                                )
                                .toList();
                            final totalRequiredHeight = painters.fold<double>(
                                  0,
                                  (sum, painter) => sum + painter.height,
                                ) +
                                (entries.length * 8);
                            final statusBoxHeight = math.max(
                              84.0,
                              totalRequiredHeight,
                            );
                            return SizedBox(
                              height: statusBoxHeight,
                              child: Column(
                                children: entries
                                    .map(
                                      (entry) => AnimatedSlide(
                                        duration: const Duration(
                                          milliseconds: 260,
                                        ),
                                        curve: Curves.easeOutCubic,
                                        offset: entry.visible
                                            ? Offset.zero
                                            : const Offset(0, 0.2),
                                        child: AnimatedOpacity(
                                          duration: const Duration(
                                            milliseconds: 260,
                                          ),
                                          opacity: entry.visible ? 1 : 0,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                            ),
                                            child: Text(
                                              entry.text,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                    fontSize: 18,
                                                    color: theme
                                                        .colorScheme
                                                        .onSurfaceVariant
                                                        .withValues(
                                                          alpha: 0.72,
                                                        ),
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                          },
                        ),
                        if (_failed) ...[
                          const SizedBox(height: 16),
                          Text(
                            l10n.setupCreatingVaultError,
                            style: TextStyle(color: theme.colorScheme.error),
                          ),
                        ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  const _ProgressPainter({
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
  bool shouldRepaint(covariant _ProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.baseColor != baseColor;
  }
}
