import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:light_dark_theme_toggle_web/utils/constants.dart';

import 'code_viewer.dart';

class UsageWidget extends StatelessWidget {
  const UsageWidget({
    super.key,
    required this.textTheme,
    required this.descriptionStyle,
  });

  final TextTheme textTheme;
  final TextStyle descriptionStyle;

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenMode.mainHorizontalPadding,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Installation",
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "1. Add the dependency to your pubspec.yaml:",
            style: descriptionStyle,
          ),
          const SizedBox(height: 10),
          CustomCodeViewer(
            code: installDependencies,
            language: 'yaml',
          ),
          const SizedBox(height: 20),
          Text(
            "2. Import the package in your Dart file:",
            style: descriptionStyle,
          ),
          const SizedBox(height: 10),
          CustomCodeViewer(code: importPackage),
          const SizedBox(height: 20),
          Divider(),
          const SizedBox(height: 30),
          Text(
            "Usage",
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 10),
          CustomCodeViewer(code: usageCode, language: 'dart'),
          const SizedBox(height: 20),
          Divider(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
