// lib/core/layout/widgets/app_scaffold.dart

import 'package:contacts/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool resizeToAvoidBottomInset;
  final bool limitWidth;
  final double? minimumScreenPaddingH;
  final double? minimumScreenPaddingV;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset = true,
    this.limitWidth = false,
    this.minimumScreenPaddingH,
    this.minimumScreenPaddingV,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(
          horizontal: minimumScreenPaddingH ?? context.spacing.screenPaddingH,
          vertical: minimumScreenPaddingV ?? context.spacing.screenPaddingV,
        ),
        child: limitWidth
            ? Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: context.spacing.maxScreenWidth,
                  ),
                  child: body,
                ),
              )
            : body,
      ),
    );
  }
}
