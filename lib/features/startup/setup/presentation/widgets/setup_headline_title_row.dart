import 'package:flutter/material.dart';

/// Headline row aligned with the overlay back button on [SetupPageScaffold].
///
/// Uses [kMinInteractiveDimension] as minimum height so a single-line title
/// stays vertically centered like a toolbar title; the row grows when the
/// title wraps so no lines are clipped.
class SetupHeadlineTitleRow extends StatelessWidget {
  const SetupHeadlineTitleRow({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: kMinInteractiveDimension),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: kMinInteractiveDimension),
          Expanded(child: child),
          const SizedBox(width: kMinInteractiveDimension),
        ],
      ),
    );
  }
}
