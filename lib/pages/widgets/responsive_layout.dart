import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';

class ResponsiveLayout extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const ResponsiveLayout({
    super.key,
    required this.children,
    this.spacing = 0.0,
    this.padding = EdgeInsets.zero,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    Widget layout = switch (screenMode) {
      ScreenMode.mobile => Column(
          spacing: spacing,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            ...children,
            const SizedBox(height: 30),
          ],
        ),
      ScreenMode.tablet || ScreenMode.desktop => Row(
          spacing: spacing,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        ),
    };

    return Padding(
      padding: padding,
      child: layout,
    );
  }
}
