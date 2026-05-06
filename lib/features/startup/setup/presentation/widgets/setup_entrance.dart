import 'package:flutter/material.dart';

class SetupEntrance extends StatefulWidget {
  const SetupEntrance({
    super.key,
    required this.child,
    required this.index,
    this.baseDelayMs = 80,
  });

  final Widget child;
  final int index;
  final int baseDelayMs;

  @override
  State<SetupEntrance> createState() => _SetupEntranceState();
}

class _SetupEntranceState extends State<SetupEntrance> {
  bool _shown = false;

  @override
  void initState() {
    super.initState();
    final delay = Duration(milliseconds: widget.baseDelayMs * widget.index);
    Future<void>.delayed(delay, () {
      if (mounted) {
        setState(() => _shown = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
      offset: _shown ? Offset.zero : const Offset(0, 0.08),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeOutCubic,
        opacity: _shown ? 1 : 0,
        child: widget.child,
      ),
    );
  }
}
